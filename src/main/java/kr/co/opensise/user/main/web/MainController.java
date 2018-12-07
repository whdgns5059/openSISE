package kr.co.opensise.user.main.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.opensise.user.main.model.BuildingSaleVo;
import kr.co.opensise.user.main.service.MainServiceInf;


@Controller
@RequestMapping("/main")
public class MainController {
	
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
	public String main(Model model, @RequestParam(value="searchName", defaultValue="")String searchName, @RequestParam("building")String building) {
		Map<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("searchName", searchName);
		searchMap.put("building", building);
		
		List<BuildingSaleVo> buildSaleList = mainService.buildingSaleList(searchMap);
		//하라미터를 바탕으로  db에 검색 (파라미터 : 건물분류, 검색명)
		model.addAttribute("buildingSaleList", buildSaleList);
		model.addAttribute("search", searchName);
		return "main";
	}
	

}
