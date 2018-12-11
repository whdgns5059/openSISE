package kr.co.opensise.admin.statis.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.opensise.admin.statis.model.MemberVo;
import kr.co.opensise.admin.statis.service.StatisServiceInf;

@Controller
@RequestMapping("/statis")
public class StatisController {
	
	@Resource(name="statisService")
	private StatisServiceInf statisService;
	
	/**
	* Method : member
	* 작성자 : Bella
	* 변경이력 :
	* @return
	* Method 설명 : 회원통계
	*/
	@RequestMapping(value="/member", method=RequestMethod.GET)
	public String member(Model model) {
		
		List<MemberVo> memVoInList = statisService.signInDaily();
		model.addAttribute("memVoInList", memVoInList);
		List<MemberVo> memVoOutList = statisService.signOutDaily();
		model.addAttribute("memVoOutList", memVoOutList);
		List<MemberVo> memVoInMonthly = statisService.signInMonthly();
		model.addAttribute("memVoInMonthly", memVoInMonthly);
		List<MemberVo> memVoOutMonthly = statisService.signOutMonthly();
		model.addAttribute("memVoOutMonthly", memVoOutMonthly);
		
		return "statis/member"; 
	}
	
	/**
	* Method : favor
	* 작성자 : Bella
	* 변경이력 :
	* @return
	* Method 설명 : 인기건물
	*/
	@RequestMapping(value="/favor", method=RequestMethod.GET)
	public String favor() {
		return "statis/favor";
	}
	
	/**
	* Method : interest
	* 작성자 : Bella
	* 변경이력 :
	* @return
	* Method 설명 : 관심사통계
	*/
	@RequestMapping(value="/interest", method=RequestMethod.GET)
	public String interest() {
		return "statis/interest";
	}
	
	/**
	* Method : visitor
	* 작성자 : Bella
	* 변경이력 :
	* @return
	* Method 설명 : 방문자수
	*/
	@RequestMapping(value="/visitor", method=RequestMethod.GET)
	public String visitor() {
		return "statis/visitor";
	}
	
	/**
	* Method : pageCount
	* 작성자 : Bella
	* 변경이력 :
	* @return
	* Method 설명 : 페이지사용량
	*/
	@RequestMapping(value="/pageCount", method=RequestMethod.GET)
	public String pageCount() {
		return "statis/pageCount";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
