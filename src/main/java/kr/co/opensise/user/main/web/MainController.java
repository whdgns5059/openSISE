package kr.co.opensise.user.main.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class MainController {
	

	/**  
	* Method   : main 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @return  
	* Method 설명 : 건물분류와 검색명을 가지고 매물 검색   
	*/
	@RequestMapping("/main")
	public String main() {
		//하라미터를 바탕으로  db에 검색 (파라미터 : 건물분류, 검색명)
		
		return "main";
	}

}
