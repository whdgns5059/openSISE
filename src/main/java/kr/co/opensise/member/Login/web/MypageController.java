package kr.co.opensise.member.Login.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.opensise.member.Login.model.MemberVo;
import kr.co.opensise.member.Login.service.LoginServiceInf;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	private static Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Resource(name = "loginService")
	private LoginServiceInf loginService;
	

	/**  
	* Method   :  selectMypage
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 : 해당 회원 정보 출력
	*/
	@RequestMapping("/myInfo")
	public String userInfo(Model model, HttpSession session) {
		MemberVo user = (MemberVo) session.getAttribute("nowLogin");
		MemberVo member = loginService.searchUser(user.getMem_email());
		logger.info("mem_email {}", user.getMem_email());
		model.addAttribute("memberVo", member);
		
		return "myinfo";
	}
	
	/**  
	* Method   :  selectMypage
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 : 해당 회원 정보 수정
	*/
	@RequestMapping(value="/myInfoUpdate", method = {RequestMethod.POST})
	public String InfoUpdate() {
		
		return "myInfoUpdate";
	}
	
}
