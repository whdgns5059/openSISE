package kr.co.opensise.user.main.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/main")
public class MainController {
	
/*	@Resource(name = "mainService")
	MainServiceInf mainService;*/
	

	/**  
	* Method   : main 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @return  
	* Method 설명 : 건물분류와 검색명을 가지고 매물 검색   
	*/
	@RequestMapping("/main")
	public String main(Model model, @RequestParam("searchName")String searchName, @RequestParam("building")String building) {
		
		//하라미터를 바탕으로  db에 검색 (파라미터 : 건물분류, 검색명)
		model.addAttribute("search", searchName);
		return "main";
	}

}
