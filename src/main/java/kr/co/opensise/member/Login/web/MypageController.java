package kr.co.opensise.member.Login.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String InfoUpdate(Model model, @RequestParam("mem_email")String mem_email) {
		MemberVo memberVo = loginService.searchUser(mem_email);
		List<MemberVo> memberJobLiset = loginService.jobList();
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("JobList",memberJobLiset);
		
		return "myInfoUpdate";
	}
	
	
	/**  
	* Method   :  duplication
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 : 해당 회원 정보 수정시 닉네임 중복체크
	*/
	
	@RequestMapping(value="/myPageDuplication", method={RequestMethod.POST})
	public String duplication(@RequestParam("memNm") String mem_nm, Model model ) {
		int memberNm = loginService.check_nm(mem_nm);
		List<MemberVo> memberJobLiset = loginService.jobList();
		model.addAttribute("msg",memberNm);
		model.addAttribute("JobList",memberJobLiset);
		
		return "myInfoUpdate";
	}
	
	/**  
	* Method   :  updateFinish
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 : 해당 회원 정보 수정처리
	*/
	@RequestMapping(value="/updateFinish", method = {RequestMethod.POST})
	public String updateFinish(Model model, MemberVo memberVo) {
		loginService.myInfoUpdate(memberVo);
		MemberVo member = loginService.searchUser(memberVo.getMem_email());
		
		model.addAttribute("memberVo", member);
		return "myinfo";
	}
	
	
	@RequestMapping(value="/steamList")
	public String heartList(Model model,  HttpSession session) {
/*		String userId = (String)session.getAttribute("userId");
		//UserVo userVo = userService.searchUser(userId);
		List<heartVo> heartVo = userService.heartList(userId);
		
		//model.addAttribute("userVo",userVo);
		model.addAttribute("heartVo",heartVo);
*/		
		return "steamList";
	}
	
}
	
