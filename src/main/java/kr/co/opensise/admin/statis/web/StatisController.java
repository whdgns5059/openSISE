package kr.co.opensise.admin.statis.web;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.opensise.admin.statis.model.FavoriteVo;
import kr.co.opensise.admin.statis.model.InterestVo;
import kr.co.opensise.admin.statis.model.MemberVo;
import kr.co.opensise.admin.statis.model.Page_statisticVo;
import kr.co.opensise.admin.statis.model.VisitorVo;
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
	* @return 회원 통계 페이지로 이동
	* Method 설명 : 회원통계
	*/
	@RequestMapping(value="/member", method=RequestMethod.GET)
	public String member(Model model) {
		// 전체 누적 회원
		int countSignIn = statisService.countSignIn();
		model.addAttribute("countSignIn",countSignIn);
		// 현재 가입되어 있는 회원 수
		int countAllMembers = statisService.countAllMembers();
		model.addAttribute("countAllMembers",countAllMembers);
		// 일별 회원
		List<MemberVo> memVoInList = statisService.signInDaily();
		model.addAttribute("memVoInList", memVoInList);
		List<MemberVo> memVoOutList = statisService.signOutDaily();
		model.addAttribute("memVoOutList", memVoOutList);
		// 달별 회원
		List<MemberVo> memVoInMonthly = statisService.signInMonthly();
		model.addAttribute("memVoInMonthly", memVoInMonthly);
		List<MemberVo> memVoOutMonthly = statisService.signOutMonthly();
		model.addAttribute("memVoOutMonthly", memVoOutMonthly);
		// 연령별/성별
		Map<String, List<MemberVo>> memVoAgeGndr = statisService.signInAgeGndr();
		model.addAttribute("memVoM", memVoAgeGndr.get("M"));
		model.addAttribute("memVoF", memVoAgeGndr.get("F"));
		
		return "statis/member"; 
	}
	
	/**
	* Method : favor
	* 작성자 : Bella
	* 변경이력 :
	* @return 인기건물(찜) 통계 페이지로 이동
	* Method 설명 : 인기건물
	*/
	@RequestMapping(value="/favor", method=RequestMethod.GET)
	public String favor(Model model) {
		// 개별 찜
		List<FavoriteVo> favorEach = statisService.favorEach();
		model.addAttribute("favorEach", favorEach);
		// 동별 찜
		List<FavoriteVo> favorDong = statisService.favorDong();
		model.addAttribute("favorDong", favorDong);
		// 구별 찜
		List<FavoriteVo> favorGu = statisService.favorGu();
		model.addAttribute("favorGu", favorGu);
		
		return "statis/favor";
	}
	
	/**
	* Method : interest
	* 작성자 : Bella
	* 변경이력 :
	* @return 관심사 통계 페이지로 이동
	* Method 설명 : 관심사통계
	*/
	@RequestMapping(value="/interest", method=RequestMethod.GET)
	public String interest(Model model) {
		// 관심사 수 최대치
		int maxCnt = statisService.countAllIntrst();
		model.addAttribute("maxCnt", maxCnt);
		// 전체 회원
		List<InterestVo> intrstAll = statisService.intrstAll();
		model.addAttribute("intrstAll", intrstAll);
		//연령 리스트 가져오기
		List<String> ageList = statisService.ageList();
		model.addAttribute("ageList", ageList);
		
		return "statis/interest";
	}
	
	@RequestMapping(value="/intrstAgeAjax", method=RequestMethod.POST)
	public String intrstAgeAjax(Model model, @RequestParam("mem_age") String mem_age) {
		//연령 리스트 가져오기
		int maxCnt = statisService.countAllIntrst();
		model.addAttribute("maxCnt", maxCnt);
		
		// 해당 연령대의 관심사 리스트
		List<InterestVo> intrstAge = statisService.intrstAge(mem_age);
		model.addAttribute("intrstAge", intrstAge);
		
		return "/admin/statis/ajax/intrstAge";
	}
	
	/**
	* Method : visitor
	* 작성자 : Bella
	* 변경이력 :
	* @return 방문자수 통계 페이지로 이동
	* Method 설명 : 방문자수
	*/
	@RequestMapping(value="/visitor", method=RequestMethod.GET)
	public String visitor(Model model) {
		// 방문 수 최대치
		VisitorVo maxCnt = statisService.maxVisit();
		model.addAttribute("maxCnt", maxCnt);

		// 방문이 많은 요일 순위별
		List<VisitorVo> maxVisitDay = statisService.maxVisitDay();
		model.addAttribute("maxVisitDay", maxVisitDay);
		
		// 날짜별 방문 수
		List<VisitorVo> visitDate = statisService.visitDate();
		model.addAttribute("visitDate",visitDate);
		
		// 요일별/시간별 방문 수
		List<VisitorVo> visitDay = statisService.visitDay();
		model.addAttribute("visitDay",visitDay);
		
		return "statis/visitor";
	}
	
	/**
	* Method : pageCount
	* 작성자 : Bella
	* 변경이력 :
	* @return 페이지사용량 통계 페이지로 이동
	* Method 설명 : 페이지사용량
	*/
	@RequestMapping(value="/pageCount", method=RequestMethod.GET)
	public String pageCount(Model model) {
		
		// 가장 많은 페이지 방문 수
		Page_statisticVo pageMax = statisService.pageMax();
		model.addAttribute("pageMax", pageMax);

		// 페이지별 페이지 방문 수
		List<Page_statisticVo> psPage = statisService.psPage();
		model.addAttribute("psPage", psPage);
		
		return "statis/pageCount";
	}
	
	@RequestMapping(value="/pageCountAjax", method=RequestMethod.POST)
	public String pageCountAjax(Model model, @RequestParam("from") Date from,  @RequestParam("to") Date to){
		
		// 모든 페이지 종류
		List<String> pageCount = statisService.pageCount();
		model.addAttribute("pageCount", pageCount);
		
		// 가장 많은 페이지 방문 수
		Page_statisticVo pageMax = statisService.pageMax();
		model.addAttribute("pageMax", pageMax);
		
		Page_statisticVo psVo = new Page_statisticVo();
		if(from != null && to != null) {
			// 날짜를 DB 접속 전에 원하는 format으로 바꿔주기
			String strFrom = convertDateToString(from);
			String strTo = convertDateToString(to);
			psVo.setFrom(strFrom);
			psVo.setTo(strTo);
			System.out.println("날짜 문자열로 바꾸기 "+psVo);
		}else if(from == null || to == null) {
			// 날짜가 하나라도 null값이면 아예 null로 바꾸어 쿼리의 조건절 발동 재제
			psVo = null;
		}
		
		// 일별 페이지 방문 수
		List<Page_statisticVo> psDate = statisService.psDate(psVo);
		System.out.println("DB 결과값 psDate는 "+psDate);
		
		model.addAttribute("psDate", psDate);
		
		return "/admin/statis/ajax/pageCountAjax";
	}
	
	/**
	* Method : convertDateToString
	* 작성자 : Bella
	* 변경이력 :
	* @param date
	* @return
	* Method 설명 : 날짜를 문자열로 변환하는 메서드
	*/
	public String convertDateToString(Date date) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = dateFormat.format(date);
		
		return strDate;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
