package kr.co.opensise.member.Login.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.opensise.member.Login.model.MemberVo;
import kr.co.opensise.member.Login.service.LoginServiceInf;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	
	@Resource(name = "loginService")
	private LoginServiceInf loginService;
	

	/**  
	* Method   :  selectMypage
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 : 해당 회원 정보 출력
	*/
	@RequestMapping("/selectMypage")
	public String selectMypage(Model model, HttpSession session) {
		//String mem_email = (String)session.getAttribute("memEmail");
		//MemberVo memberVo = loginService.searchUser(mem_email);
		//model.addAttribute("memberVo", memberVo);
		
		return "myinfo";
	}
	
	
}
