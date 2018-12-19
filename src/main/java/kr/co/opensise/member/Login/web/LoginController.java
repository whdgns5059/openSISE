package kr.co.opensise.member.Login.web;

import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.opensise.member.Login.model.MemberVo;
import kr.co.opensise.member.Login.service.LoginServiceInf;
import kr.co.opensise.member.encrypt.seed.KISA_SEED_CBC;
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
		} else if(user == null ){
			model.addAttribute("msg","존재하지 않는 회원입니다! 가입후 이용바랍니다 ");
			return "loginErr";
		}else {
			model.addAttribute("msg","ID와 PW를 다시 확인해 주세요" );
			return "loginErr";
		}
	}
	
	/** Method   : duplication 
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 :  로그아웃
	*/
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "openPage";
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
	

	/** Method   : recentlyViewed 
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 :  최근 본 매물
	*/
	@RequestMapping("/recentlyviewed")
	public String recentlyViewed(Model model) {
		return "recentlyViewed";
	}
	
	
	/** Method   : passWordChange 
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 :  보안설정(비밀번호 변경)
	*/
	@RequestMapping("/passwordChange")
	public String passWordChange(Model model) {
		return "passWordChange";
	}
	
	/** Method   : passWordChange 
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 :  비밀번호 찾기 메일발송 처리
	*/
	@RequestMapping(value = "/mailSender") 
	public String mailSender(@RequestParam("memEmail") String memEmail, HttpServletRequest request, ModelMap mo) throws AddressException, MessagingException {

		// 암호화 처리
		String seedEncrypt = KISA_SEED_CBC.Encrypt(memEmail);
		
		
		
		// 네이버일 경우 smtp.naver.com 
		// Google일 경우 smtp.gmail.com 
		String host = "smtp.naver.com";

		final String username = "openSise"; //네이버 아이디
		final String password = "nikfdcsobtusygbi"; //네이버 이메일 비밀번호
		int port=465; //포트번호

		// 메일 내용 
		String recipient = memEmail; //받는 사람의 메일주소
		String subject = "회원인증"; //메일 제목 입력해주세요.
		String body = "OpenSise 회원인증 "
				+ "아래 링크 클릭시 회원인증 처리가 완료 됩니다! "
				+ "http://localhost:8081/login/passCertification?OpenSise"+seedEncrypt; //메일 내용
		
		Properties props = System.getProperties(); // 정보를 담기 위한 객체 생성

		// SMTP 서버 정보 설정
		props.put("mail.smtp.host", "smtp.gmail.com"); 
		props.put("mail.smtp.port", 465); 
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		//Session 생성 
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
			String un=username; 
			String pw=password; 
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(un, pw); } });

		session.setDebug(true); //for debug
		
		Message mimeMessage = new MimeMessage(session); //MimeMessage 생성
		mimeMessage.setFrom(new InternetAddress("openSise@gmail.com")); //발신자 셋팅 , 보내는 사람의 이메일주소

		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음

		mimeMessage.setSubject(subject); //제목셋팅 
		mimeMessage.setText(body); //내용셋팅
		Transport.send(mimeMessage); //javax.mail.Transport.send() 이용

		return "login";
	}	
	 
	/** Method   : passWordChange 
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 :  비밀번호 찾기 메일로 인증링크 전송 클릭시 변경 사이트로 이동
	*/
	@RequestMapping("/passCertification")
	public String passCertification(Model model) {
		return "passCertification";
	}
	
	
	/** Method   : passWordChange 
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 :  비밀번호 찾기 로그인인증완료/ 비밀번호 변경완료 메인화면으로 이동
	*/
	@RequestMapping("/passFinsh")
	public String passFinsh(Model model) {
		return "openPage";
	}
	
}