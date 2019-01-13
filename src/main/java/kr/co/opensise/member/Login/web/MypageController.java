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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.statis.model.FavoriteVo;
import kr.co.opensise.member.Login.model.MemberVo;
import kr.co.opensise.member.Login.model.SteamVo;
import kr.co.opensise.member.Login.service.LoginServiceInf;
import kr.co.opensise.member.encrypt.sha.KISA_SHA256;

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
//		if(session.getAttribute("nowLogin") != null ) {
			MemberVo user = (MemberVo) session.getAttribute("nowLogin");
			MemberVo member = null;
			if(user.getMem_email() == null) {
				member = loginService.searchUser(user.getMem_nm());
			}else {
				member = loginService.searchUser(user.getMem_email());
			}
			logger.info("memVO :" + member);
			model.addAttribute("member", member);
			
//		}else if (session.getAttribute("nowLogin") == null) {
//			String user2 = (String) session.getAttribute("nowLogin");
//			MemberVo member2 = loginService.searchUser(user2);
//			
//			model.addAttribute("memberVo", member2);
//		}
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
	public String InfoUpdate(Model model, MemberVo memVo) {
		logger.info("mem_email :" + memVo.getMem_email());
		logger.info("mem_nm :" + memVo.getMem_nm());
		MemberVo memberVo = null;
		if(memVo.getMem_email().equals("")|| memVo.getMem_email() == null) {
			memberVo = loginService.searchUser(memVo.getMem_nm());
		}else {
			memberVo = loginService.searchUser(memVo.getMem_email());
		}
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
		
		MemberVo member = null;
		if(memberVo.getMem_email().equals("")|| memberVo.getMem_email() == null) {
			member = loginService.searchUser(memberVo.getMem_nm());
		}else {
			member = loginService.searchUser(memberVo.getMem_email());
		}
		
		model.addAttribute("member", member);
		return "myinfo";
	}
	
	/**  
	* Method   :  steamList
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 : 찜목록 출력
	*/
	@RequestMapping(value="/steamList")
	public String steamList(Model model,  HttpSession session) {
		MemberVo memberVo = (MemberVo)session.getAttribute("nowLogin");
		List<SteamVo> steamVo = loginService.steamList(memberVo.getMem_no());
		
		model.addAttribute("steamVo",steamVo);
		
		return "steamList";
	}
	
	/**  
	* Method   :  steamListUpdate
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 : 찜목록 저장 클릭시 삭제처리
	*/
	@RequestMapping(value="/steamListUpdate", method = {RequestMethod.GET})
	public String steamListUpdate(Model model, @RequestParam("favor_no") int favor_no, HttpSession session) {
		loginService.steamListUpdate(favor_no);
	
		MemberVo memberVo = (MemberVo)session.getAttribute("nowLogin");
		List<SteamVo> steamVo = loginService.steamList(memberVo.getMem_no());
		
		model.addAttribute("steamVo",steamVo);
		
		return "steamList";
	}
	
	/** Method   : recentlyViewed 
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 :  최근 본 매물이동 
	*/
	@SuppressWarnings("unchecked")
	@RequestMapping("/recentlyviewed")
	public String recentlyViewed() {
		
		return "recentlyViewed";
	}
	
	
	/** Method   : recentlyViewed 
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 :  최근 본 매물삭제 
	*/
	@RequestMapping("/recently")
	public String recently(HttpSession session, ArticleVo articleVo, @RequestParam("artcl_index") int index ) {
		List<ArticleVo> searchList = (List<ArticleVo>) session.getAttribute("searchList");

		searchList.remove(index);
		
		return "recentlyViewed";
	}
	
	
	
	
	/**  
	* Method   :  selectMypage
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 : 탈퇴시 해당회원 이메일 조회
	*/
	@RequestMapping("/memWithdrawal")
	public String withdrawal(Model model, HttpSession session) {
		MemberVo user = (MemberVo) session.getAttribute("nowLogin");
		MemberVo member = loginService.searchUser(user.getMem_email());
		
		
		model.addAttribute("memberVo", member);
		
		return "withdrawal";
	}
	
	/**  
	* Method   :  selectMypage
	* 작성자 :  김주연
	* 변경이력 :  memberVo
	* @return  
	* Method 설명 : 탈퇴 처리
	*/
	@RequestMapping(value="/Withdrawal", method = {RequestMethod.POST})
	public String memwithdrawal(MemberVo memberVo, @RequestParam("mem_pass") String mem_pass, HttpServletRequest request, Model model) {
		
		String encryptPass = KISA_SHA256.encrypt(mem_pass);
		memberVo.setMem_pass(encryptPass);
		
		int user = loginService.memDelete(memberVo);
		model.addAttribute("memberVo", user);
		
		if (user != 0 ) {
			HttpSession session = request.getSession();
			session.invalidate();
			
			return "openPage";
		} else {
			return "openPage";
		}
	}
	
	/** Method   : passWordChange 
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 :  보안설정으로 이동
	*/
	@RequestMapping("/passwordChange")
	public String passwordChange(Model model, HttpSession session){
		MemberVo user = (MemberVo) session.getAttribute("nowLogin");
		MemberVo member = loginService.searchUser(user.getMem_email());
		
		model.addAttribute("memberVo", member);
		
		return "passWordChange";
	}
	
	
	
	/** Method   : passWordChange 
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 :  보안설정(비밀번호 변경)
	*/
	@RequestMapping(value="/passChange", method = {RequestMethod.POST})
	public String passChange(MemberVo memberVo, HttpServletRequest request, Model model, HttpSession session, @RequestParam("mem_pass") String mem_pass) {
		String encryptpass = KISA_SHA256.encrypt(mem_pass);
		MemberVo mem = (MemberVo) session.getAttribute("nowLogin");
		
		if(!(encryptpass.equals(mem.getMem_pass())) && !(mem_pass.equals(""))) {
			model.addAttribute("msgNo","현재비밀번호가 일치하지않습니다.확인후 재시도해주세요");
			return "passWordChange";
		}else if(encryptpass.equals(mem.getMem_pass())){
			String encrypt = KISA_SHA256.encrypt(memberVo.getMem_pass());
			memberVo.setMem_pass(encrypt);
			String encryptPass = KISA_SHA256.encrypt(memberVo.getMem_new_pass());
			memberVo.setMem_new_pass(encryptPass);
			
			int user = loginService.passChange(memberVo);
			
			MemberVo users = (MemberVo) session.getAttribute("nowLogin");
			model.addAttribute("memberVo", users);
			model.addAttribute("msgOk","변경이완료되었습니다");
			
			return "passWordChange";
			
		}else {
			return "openPage";
		}
		
		
		
	}
}
	



