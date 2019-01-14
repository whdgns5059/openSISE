package kr.co.opensise.user.detail.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;
import kr.co.opensise.admin.statis.model.FavoriteVo;
import kr.co.opensise.member.Login.model.MemberVo;
import kr.co.opensise.user.detail.model.AvgTradeVo;
import kr.co.opensise.user.detail.model.PictureVo;
import kr.co.opensise.user.detail.model.PostVo;
import kr.co.opensise.user.detail.model.ReplyVo;
import kr.co.opensise.user.detail.model.ReportVo;
import kr.co.opensise.user.detail.model.Report_classfVo;
import kr.co.opensise.user.detail.service.DetailService;
import kr.co.opensise.user.detail.service.DetailServiceInf;

@Controller
@RequestMapping("/detail")
public class DetailController {

	@Resource(name="detailService")
	private DetailServiceInf detailService;
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/info")
	public String detail(ArticleVo articleVo, @RequestParam("dl_ty") String dl_ty, Model model, HttpSession session) {

		
		//최근 본 매물 저장 리스트
		List<ArticleVo> searchList = (List<ArticleVo>) session.getAttribute("searchList");

		if(searchList == null) {
			searchList = new ArrayList<>();
			session.setAttribute("searchList", searchList);
		}
		
		articleVo.setArtcl_dl_ty(dl_ty);
		
		
		
		Map<String, Object> detailMap = detailService.getDetailInfo(articleVo, dl_ty);
		
		ArticleVo selectArticleVo = (ArticleVo) detailMap.get("selectArticleVo");
		List<String> selectAreas = (List<String>) detailMap.get("selectAreas");
		List<PostVo> selectReview  = (List<PostVo>) detailMap.get("selectReview");

		selectArticleVo.setArtcl_dl_ty(dl_ty);
		searchList.add(selectArticleVo);
		
		MemberVo nowLogin = (MemberVo) session.getAttribute("nowLogin");

		FavoriteVo favorVo = new FavoriteVo();
		favorVo.setFavor_gu(articleVo.getArtcl_gu());
		favorVo.setFavor_dong(articleVo.getArtcl_dong());
		favorVo.setFavor_zip(articleVo.getArtcl_zip());
		favorVo.setFavor_rd(articleVo.getArtcl_rd());
		favorVo.setFavor_ty(articleVo.getDl_ty());

		int favorCount = detailService.selectFavorCount(favorVo);
		
		FavoriteVo selFavor = null;
		if(nowLogin !=null) {
			favorVo.setFavor_mem(nowLogin.getMem_no());
			selFavor = detailService.selectFavor(favorVo);
		}
		
		
		articleVo.setBuilding(selectArticleVo.getArtcl_bc());
		
		model.addAttribute("selectArticleVo", selectArticleVo);
		model.addAttribute("selectAreas", selectAreas);
		model.addAttribute("dl_ty", dl_ty);
		model.addAttribute("selectReview", selectReview);
		model.addAttribute("selFavor", selFavor);
		model.addAttribute("favorCount", favorCount);
		model.addAttribute("building", selectArticleVo.getArtcl_bc());
		model.addAttribute("dlType", "매매");
		model.addAttribute("articleVo", articleVo);
		
		Logger logger = LoggerFactory.getLogger(DetailController.class);
		logger.info("buildings : " + articleVo.getBuilding());
		logger.info("searchName : " + articleVo.getSearchName());
		logger.info("dl_ty : " + articleVo.getArtcl_dl_ty());
		
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
		model.addAttribute("excv_area", dealVo.getDl_excv_area());

		
		return "user/detailAjax/chart";
	}
	
	@RequestMapping("/insertReview")
	public String insertReview(PostVo postVo,  @RequestParam("dl_ty") String dl_ty, Model model
								, @RequestPart("post_img") List<MultipartFile> parts, HttpServletRequest request) {
	
		String path = request.getServletContext().getRealPath("/reviewImg");
		
		detailService.insertReview(postVo, parts, path);
		
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
		
		for(ReplyVo replyVo : replyList) {
			String mem_email = replyVo.getMem_email();
			String emailStar = mem_email.substring(0, 5) + "*********";
			replyVo.setMem_email(emailStar);
		}
	
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
	
	@RequestMapping("/deleteReply")
	public String deleteReply(ReplyVo replyVo, Model model) {
		
		int result = detailService.deleteReply(replyVo.getRpl_no());
		
		model.addAttribute("post_no", replyVo.getRpl_post());
		
		return "redirect:/detail/selectReplyAjax";
	}
	
	@RequestMapping("/deleteReview")
	public String deleteReview(@RequestParam("post_no") String post_no, @RequestParam("dl_ty") String dl_ty, Model model) {
		
		PostVo postVo = detailService.selectReviewByNo(post_no);
		
		int result = detailService.deleteReview(post_no);
	
		model.addAttribute("artcl_gu", postVo.getPost_gu());
		model.addAttribute("artcl_dong", postVo.getPost_dong());
		model.addAttribute("artcl_zip", postVo.getPost_zip());
		model.addAttribute("artcl_rd", postVo.getPost_rd());
		model.addAttribute("dl_ty", dl_ty);
		
		return "redirect:/detail/info";
		
	}

	
	@RequestMapping("/selectReviewPic")
	public String selectReviewPic(PostVo postVo, Model model) {
		
		List<PictureVo> pictureList = detailService.selectReviewPic(postVo);
	
		model.addAttribute("pictureList", pictureList);
		
		return "user/detailAjax/picture";
	}
	
	@RequestMapping("/selectStat")
	public String selectStat(DealVo dealVo, Model model) {
	
		
		Map<String, Float> statMap = detailService.selectStat(dealVo);

		Float priceStat = statMap.get("priceStat");
		Float marketStat = statMap.get("marketStat");
		Float humanStat = statMap.get("humanStat");
		Float trafficStat = statMap.get("trafficStat");
		
		model.addAttribute("priceStat", priceStat);
		model.addAttribute("marketStat", marketStat);
		model.addAttribute("humanStat", humanStat);
		model.addAttribute("trafficStat", trafficStat);
		
		return "user/detailAjax/radar";
	}
	
	@RequestMapping("/insertFavor")
	public void insertFavor(FavoriteVo favorVo) {
		detailService.insertFavor(favorVo);
	}
	
	@RequestMapping("/deleteFavor")
	public void deleteFavor(FavoriteVo favorVo) {
		detailService.deleteFavor(favorVo.getFavor_no());
	}
	
	
	@RequestMapping("/totalDeal")
	public String totalDeal(DealVo dealVo, Model model) {

		List<DealVo> totalDealList = detailService.selectTotalDealList(dealVo);
	
		model.addAttribute("dealListByArea", totalDealList);
		model.addAttribute("dl_ty", dealVo.getDl_ty());
		
		return "user/detailAjax/totalDealList";
		
		
	}
	
	@RequestMapping("/reportForm")
	public String reportForm(@RequestParam("rpt_post") String rpt_post, Model model) {
		// 게시글 번호
		model.addAttribute("rpt_post", rpt_post);
		
		// 신고 분류
		List<Report_classfVo> rpt_cfList = detailService.getRpt_classf();
		model.addAttribute("rpt_cfList", rpt_cfList);
		
		return "user/detailAjax/reportForm";
	}
	
	
	@RequestMapping("/reportInsert")
	@ResponseBody
	public int reportInsert(ReportVo rptVo, HttpSession session) {

		MemberVo memberVo = (MemberVo) session.getAttribute("nowLogin");
		rptVo.setRpt_mem(memberVo.getMem_no());
		
		int result = detailService.insertReport(rptVo);
		
		return result; 
	}

	
	@RequestMapping("/updateReviewForm")
	public String updateReviewForm(@RequestParam("post_no") String post_no, Model model) {
		
		PostVo postVo = detailService.selectReviewByNo(post_no);
		List<PictureVo> picList = detailService.selectReviewPic(postVo);
		
		model.addAttribute("postVo", postVo);
		model.addAttribute("picList", picList);
		
		return "user/detailAjax/updateForm";
	}
	
	@RequestMapping("/deletePic")
	@ResponseBody
	public int deletePic(@RequestParam("pic_no") String pic_no) {
		
		int delResult = detailService.deletePic(pic_no);
		
		return delResult;
	}
	
	@RequestMapping("/updateReview")
	public String updateReview(PostVo postVo, @RequestPart("post_img") List<MultipartFile> parts, HttpServletRequest request) {
		
		String path = request.getServletContext().getRealPath("/reviewImg");
		
		int result = detailService.updateReview(postVo, parts, path);
		
		return "user/detailAjax/updateResult";
	}
	
}





























