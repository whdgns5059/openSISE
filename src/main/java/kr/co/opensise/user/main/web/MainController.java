package kr.co.opensise.user.main.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.opensise.user.main.model.BuildingSaleVo;
import kr.co.opensise.user.main.model.FilterVo;
import kr.co.opensise.user.main.service.MainServiceInf;


@Controller
@RequestMapping("/main")
public class MainController {
	Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Resource(name = "mainService")
	MainServiceInf mainService;
	
	/**  
	* Method   : main 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @return  
	* Method 설명 : 건물분류와 검색명을 가지고 매물 검색   
	*/
	@RequestMapping("/main")
	public String main(Model model, FilterVo filterVo) {
		//매물리스트 검색 결과를 담을 리스트 
		List<BuildingSaleVo> buildSaleList = null;
		if(filterVo.getBuilding().equals("house")) {
			buildSaleList = mainService.buildingSingleSaleList(filterVo);
		}else {
			buildSaleList = mainService.buildingSaleList(filterVo);
		}
		//하라미터를 바탕으로  db에 검색 (파라미터 : 건물분류, 검색명)
		model.addAttribute("buildingSaleList", buildSaleList);
		model.addAttribute("buildingSaleListSize", buildSaleList.size());
		model.addAttribute("searchName", filterVo.getSearchName());
		model.addAttribute("building",filterVo.getBuilding());
		model.addAttribute("dlType",filterVo.getDl_ty());
		return "main";
	}
	
	@RequestMapping("/mainAjax")
	public String mainAjax(Model model, FilterVo filterVo) {
		List<BuildingSaleVo> buildFilterList = null;
		if(filterVo.getBuilding().equals("all")) {
			buildFilterList = mainService.buildingSingleFilterList(filterVo);
		}else {
			buildFilterList = mainService.buildingFilterList(filterVo);
		}
		//파라미터를 바탕으로  db에 검색 (파라미터 : 건물분류, 검색명)
		model.addAttribute("buildingSaleList", buildFilterList);
		model.addAttribute("buildingSaleListSize", buildFilterList.size());
		model.addAttribute("building",filterVo.getBuilding());
		model.addAttribute("dlType",filterVo.getDl_ty());
		return "user/mainAjax/rightList";
	}
	

}
