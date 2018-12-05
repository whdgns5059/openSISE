package kr.co.opensise.member.login.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	/**  
	* Method   : login 
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 :  로그인 접속 방법 선택(카카오톡/오픈시세)
	*/
	@RequestMapping("/selectLogin")
	public String selectLogin() {
		return "selectLogin";
	}

	

	/**  
	* Method   : login 
	* 작성자 :  
	* 변경이력 :  
	* @return  
	* Method 설명 :  OpenSisy 로그인방식
	*/
	@RequestMapping("/login")
	public String login() {
		return "login";
	}

}
