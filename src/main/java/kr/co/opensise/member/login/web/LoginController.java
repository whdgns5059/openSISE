package kr.co.opensise.member.login.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	/**  
	* Method   : login 
	* �ۼ��� :  ���ֿ�
	* �����̷� :  
	* @return  
	* Method ���� :  �α��� ���� ��� ����(īī����/���½ü�)
	*/
	@RequestMapping("/selectLogin")
	public String selectLogin() {
		return "selectLogin";
	}

	

	/**  
	* Method   : login 
	* �ۼ��� :  
	* �����̷� :  
	* @return  
	* Method ���� :  OpenSisy �α��ι��
	*/
	@RequestMapping("/login")
	public String login() {
		return "login";
	}

}
