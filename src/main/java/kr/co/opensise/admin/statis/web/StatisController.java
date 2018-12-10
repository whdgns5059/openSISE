package kr.co.opensise.admin.statis.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/statis")
public class StatisController {
	
	/**
	* Method : member
	* 작성자 : Bella
	* 변경이력 :
	* @return
	* Method 설명 : 회원통계
	*/
	@RequestMapping("/member")
	public String member() {
		
		return "statis/member";
	}
	
	/**
	* Method : favor
	* 작성자 : Bella
	* 변경이력 :
	* @return
	* Method 설명 : 인기건물
	*/
	@RequestMapping("/favor")
	public String favor() {
		return "statis/favor";
	}
	
	/**
	* Method : interest
	* 작성자 : Bella
	* 변경이력 :
	* @return
	* Method 설명 : 관심사통계
	*/
	@RequestMapping("/interest")
	public String interest() {
		return "statis/interest";
	}
	
	/**
	* Method : visitor
	* 작성자 : Bella
	* 변경이력 :
	* @return
	* Method 설명 : 방문자수
	*/
	@RequestMapping("/visitor")
	public String visitor() {
		return "statis/visitor";
	}
	
	/**
	* Method : pageCount
	* 작성자 : Bella
	* 변경이력 :
	* @return
	* Method 설명 : 페이지사용량
	*/
	@RequestMapping("/pageCount")
	public String pageCount() {
		return "statis/pageCount";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
