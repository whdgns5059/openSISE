package kr.co.opensise.user.detail.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;
import kr.co.opensise.user.detail.service.DetailServiceInf;

@Controller
@RequestMapping("/detail")
public class DetailController {

	@Resource(name="detailService")
	private DetailServiceInf detailService;
	
	@RequestMapping("/detail")
	public String detail(ArticleVo articleVo, @RequestParam("dl_ty") String dl_ty, Model model) {
		
		Map<String, Object> detailMap = detailService.getDetailInfo(articleVo, dl_ty);
		
		ArticleVo selectArticleVo = (ArticleVo) detailMap.get("selectArticleVo");
		List<DealVo> selectDealVoList = (List<DealVo>) detailMap.get("selectDealVoList");
		List<String> selectAreas = (List<String>) detailMap.get("selectAreas");
		
		model.addAttribute("selectArticleVo", selectArticleVo);
		model.addAttribute("selectDealVoList", selectDealVoList);
		model.addAttribute("selectAreas", selectAreas);
		
		return "detail";
	}

}
