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

import kr.co.opensise.admin.statis.model.FavoriteVo;
import kr.co.opensise.member.Login.model.MemberVo;
import kr.co.opensise.member.Login.model.SteamVo;
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
		logger.info("favor_no : "+ favor_no);
	
		MemberVo memberVo = (MemberVo)session.getAttribute("nowLogin");
		List<SteamVo> steamVo = loginService.steamList(memberVo.getMem_no());
		
		model.addAttribute("steamVo",steamVo);
		
		return "steamList";
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
	
	
	/** Method   : withdrawal 
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 :  회원탈퇴
	*/
	@RequestMapping("/withdrawall")
	public String withdrawal(Model model) {
		return "withdrawal";
	}
	
	
}
	
