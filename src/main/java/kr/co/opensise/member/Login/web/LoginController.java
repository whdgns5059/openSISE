package kr.co.opensise.member.Login.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.opensise.member.Login.model.MemberVo;
import kr.co.opensise.member.Login.service.LoginServiceInf;
import kr.co.opensise.member.encrypt.sha.KISA_SHA256;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Resource(name = "loginService")
	private LoginServiceInf loginService;
	
	/**  
	* Method   :  
	* 작성자 :  
	* 변경이력 :  
	* @return  
	* Method 설명 : 로그인 선택(오픈시세/카카오톡 로그인)
	*/
	@RequestMapping("/selectLogin")
	public String selectLogin() {
		return "selectLogin";
	}

	/**  
	* Method   :  
	* 작성자 :  
	* 변경이력 :  
	* @return  
	* Method 설명 : 오픈시세 로그인
	*/
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	
	/**  
	* Method   :  
	* 작성자 :  
	* 변경이력 :  
	* @return  
	* Method 설명 : 오픈시세  암호화 및 로그인
	*/
	@RequestMapping(value="/openLogin", method= {RequestMethod.POST})
	public String loginView(@RequestParam("mem_email") String mem_email,@RequestParam("mem_pass") String mem_pass, Model model, HttpServletRequest request, HttpServletResponse response) {

		String encryptPass = KISA_SHA256.encrypt(mem_pass);
		MemberVo user = loginService.selectMember(mem_email);
		
		if (user != null && user.authPass(encryptPass)) {
			
			HttpSession session = request.getSession();
			session.setAttribute("mem_email", user.getMem_pass());
			model.addAttribute("memberVo",user);
			return "openPage";
		} else {
			model.addAttribute("msg","ID와 PW를 다시 확인해 주세요");
			return "loginErr";
		}
	}

}
