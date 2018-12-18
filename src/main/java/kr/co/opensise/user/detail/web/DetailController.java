package kr.co.opensise.user.detail.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;
import kr.co.opensise.member.Login.model.MemberVo;
import kr.co.opensise.user.detail.model.AvgTradeVo;
import kr.co.opensise.user.detail.model.PostVo;
import kr.co.opensise.user.detail.model.ReplyVo;
import kr.co.opensise.user.detail.service.DetailServiceInf;

@Controller
@RequestMapping("/detail")
public class DetailController {

	@Resource(name="detailService")
	private DetailServiceInf detailService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/info")
	public String detail(ArticleVo articleVo, @RequestParam("dl_ty") String dl_ty, Model model) {
		
		Map<String, Object> detailMap = detailService.getDetailInfo(articleVo, dl_ty);
		
		ArticleVo selectArticleVo = (ArticleVo) detailMap.get("selectArticleVo");
		List<String> selectAreas = (List<String>) detailMap.get("selectAreas");
		List<PostVo> selectReview  = (List<PostVo>) detailMap.get("selectReview");

		
		model.addAttribute("selectArticleVo", selectArticleVo);
		model.addAttribute("selectAreas", selectAreas);
		model.addAttribute("dl_ty", dl_ty);
		model.addAttribute("selectReview", selectReview);
		
		return "detail";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/tradeInfoAjax")
	public String tradeInfoAjax(ArticleVo articleVo , DealVo dealVo, Model model) {
	
		String dl_ty = dealVo.getDl_ty();
		float dl_excv_area = dealVo.getDl_excv_area();
		
		Map<String, Object> tradeInfoMap = detailService.getDetailTradeInfo(articleVo, dl_ty, dl_excv_area);
		
		AvgTradeVo avgTradeVo = (AvgTradeVo) tradeInfoMap.get("avgTradeVo");
		List<DealVo> recentTradeList  = (List<DealVo>) tradeInfoMap.get("recentTradeVo");
		List<DealVo> dealListByArea = (List<DealVo>) tradeInfoMap.get("dealListByArea");
		List<DealVo> monthlyAvg = (List<DealVo>) tradeInfoMap.get("monthlyAvg");
		
		model.addAttribute("avgTradeVo", avgTradeVo);
		model.addAttribute("recentTradeList", recentTradeList);
		model.addAttribute("dealListByArea", dealListByArea);
		model.addAttribute("monthlyAvg", monthlyAvg);
		model.addAttribute("dl_ty", dealVo.getDl_ty());

		
		return "user/detailAjax/chart";
	}
	
	@RequestMapping("/insertReview")
	public String insertReview(PostVo postVo, @RequestParam("dl_ty") String dl_ty, Model model) {
	
		detailService.insertReview(postVo);
		
		
		model.addAttribute("artcl_gu", postVo.getPost_gu());
		model.addAttribute("artcl_dong", postVo.getPost_dong());
		model.addAttribute("artcl_zip", postVo.getPost_zip());
		model.addAttribute("artcl_rd", postVo.getPost_rd());
		model.addAttribute("dl_ty", dl_ty);
		
		return "redirect:/detail/info";
	}
	
	@RequestMapping("/selectReplyAjax")
	public String selectReplyAjax(@RequestParam("post_no") String post_no, Model model) {
	
		int post_no_int = Integer.parseInt(post_no);
		
		List<ReplyVo> replyList = detailService.selectReply(post_no_int);
	
		model.addAttribute("replyList", replyList);
		
		return "user/detailAjax/reply";
	}
	
	@RequestMapping("/insertReply")
	public String insertReply(ReplyVo replyVo, HttpSession session, Model model) {
		
		MemberVo memberVo =  (MemberVo) session.getAttribute("nowLogin");
		replyVo.setRpl_mem(memberVo.getMem_no());
		
		int result = detailService.insertReply(replyVo);
	
		model.addAttribute("post_no", replyVo.getRpl_post());
		
		return "redirect:/detail/selectReplyAjax";
	}

}





























