package kr.co.opensise.member.Login.web;

import java.util.List;

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
	* Method   :  selectLogin
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 : 로그인 선택(오픈시세/카카오톡 로그인)
	*/
	@RequestMapping("/selectLogin")
	public String selectLogin() {
		return "selectLogin";
	}

	/**  
	* Method   :  login
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 : 오픈시세 로그인
	*/
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	
	/**  
	* Method   :  loginView
	* 작성자 :  김주연
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
			session.setAttribute("nowLogin", user);
			model.addAttribute("memberVo",user);
			return "openPage";
		} else {
			model.addAttribute("msg","ID와 PW를 다시 확인해 주세요");
			return "member/loginErr";
		}
	}
	
	/**  
	* Method   :  passButton
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 : 비밀번호 찾기 팝업으로 이동
	*/
	@RequestMapping("/pass")
	public String passButton() {
		return "member/passButton";
	}
	

	/**  
	* Method   :  passButtonChk
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 : 비밀번호 찾기 
	*/
	@RequestMapping("/passChk")
	public String passButtonChk() {
		// 임시 return
		return "signup";
	}
	
	
	
	/** Method   : sign_Up 
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 :  회원가입
	*/
	@RequestMapping("/signup")
	public String sign_Up(Model model) {
		List<MemberVo> memberJobLiset = loginService.jobList();
		model.addAttribute("JobList",memberJobLiset);
		return "signup";
	}
	
	
	/** Method   : signUpSelection 
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 :  회원가입 필수정보입력
	*/
	@RequestMapping(value="/signUpSelection", method= {RequestMethod.POST})
	public String signUpSelection(Model model, MemberVo memberVo) {
		// 암호화 처리
		memberVo.setMem_pass(KISA_SHA256.encrypt(memberVo.getMem_pass()));
		
		loginService.signup(memberVo);
		model.addAttribute("mem_email",memberVo.getMem_email());
		
		List<MemberVo> interest = loginService.interestLiset();
		model.addAttribute("intrstList",interest);

		return "signupDetail";
	}
	
	/** Method   : signupDetail 
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 :  회원가입 선택정보입력후 저장 
	*/
	@RequestMapping(value="/signupDetail", method= {RequestMethod.POST})
	public String signupDetail(Model model, MemberVo memberVo) {
		
		// 리턴값 임시
		return "openPage";
	}
	
	/** Method   : duplication 
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 :  회원가입시 닉네임 중복체크
	*/
	@RequestMapping(value="/duplication", method={RequestMethod.POST})
	public String duplication(@RequestParam("memNm") String mem_nm, Model model ) {
		int memberNm = loginService.check_nm(mem_nm);
		List<MemberVo> memberJobLiset = loginService.jobList();
		model.addAttribute("msg",memberNm);
		model.addAttribute("JobList",memberJobLiset);
		
		return "signup";
		
	}
	
	
	
}
