package kr.co.opensise.user.local.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.opensise.admin.manage.dataetc.model.MarketDetailVo;
import kr.co.opensise.user.market.service.MarketService;
import kr.co.opensise.user.market.service.MarketServiceInf;
import kr.co.opensise.user.local.model.HumanStatisVo;
import kr.co.opensise.user.local.service.LocalServiceInf;

@Controller
@RequestMapping("/local")
public class LocalController {
	@Resource
	private LocalServiceInf localService;
	
	
	@Resource(name="marketService")
	private MarketServiceInf MarketService;
	
	@RequestMapping("/local")
	public String local(@RequestParam("gu") String gu , @RequestParam("dong") String dong, Model model) {
		model.addAttribute("gu", gu);
		model.addAttribute("dong",dong);
		return "local";
	}
	

	//상단 분류
	@RequestMapping("/popStatis")
	public String popStatis(@RequestParam("dong")String dong, Model model) {
		
		//전체 인구 통계
		List<HumanStatisVo>allHumanStatisList = localService.humanAllStatistic(dong);
		model.addAttribute("allHumanStatis",allHumanStatisList);
		
		//전체 인구 통계 최댓값
		int allHumanStatisMaxValue = localService.humanAllStatisMaxValue(dong);
		model.addAttribute("allHumanMaxValue", allHumanStatisMaxValue);
		
		model.addAttribute("dong", dong);
		
		return "user/localAjax/popStatis";
	}
	
	@RequestMapping("/nearFaci")
	public String nearFaci( @RequestParam("dong") String dong, Model model) {
		return "user/localAjax/nearFaci";
	} 
	
	@RequestMapping("/market")
	public String market(@RequestParam("dong") String dong, Model model) {
		
		String dongSub = dong.substring(0, 1);
		
		List<MarketDetailVo> avgMkdList = MarketService.selectAvgMkd(dongSub);
		List<MarketDetailVo> mkdList = MarketService.selectMkd(dongSub);
	
		model.addAttribute("avgMkdList", avgMkdList);
		model.addAttribute("mkdList", mkdList);
		model.addAttribute("dong", dong);
		
		return "user/localAjax/market";
	}

	@RequestMapping("/etc")
	public String etc( @RequestParam("dong") String dong, Model model) {
		return "user/localAjax/etc";
	}
	
	
	
	
	//인구분석 
	@RequestMapping("/totalPop")
	public String totalPop(@RequestParam("dong") String dong, Model model) {
		
		//전체 인구 통계
		List<HumanStatisVo>allHumanStatisList = localService.humanAllStatistic(dong);
		model.addAttribute("allHumanStatis",allHumanStatisList);
		
		//전체 인구 통계 최댓값
		int allHumanStatisMaxValue = localService.humanAllStatisMaxValue(dong);
		model.addAttribute("allHumanMaxValue", allHumanStatisMaxValue);
		
		model.addAttribute("dong", dong);
		
		return "user/localAjax/pop/totalPop";
	}

	@RequestMapping("/genderPop")
	public String genderPop(@RequestParam("dong") String dong, Model model) {
		
		// 성별 인구 통계 
		List<HumanStatisVo> genderHumanStatisList = localService.humanGndrStatistic(dong);
		model.addAttribute("gndrHumanStatis", genderHumanStatisList);
		
		// 성별 인구 통계 최댓값
		int genderHumanStatisMaxValue = localService.humanGndrStatisMaxValue(dong);
		model.addAttribute("gndrHumanStatisMaxValue", genderHumanStatisMaxValue);
		
		model.addAttribute("dong", dong);
		
		return "user/localAjax/pop/genderPop";
	}

	@RequestMapping("/agePop")
	public String agePop(@RequestParam("dong") String dong, Model model) {
		
		//연령별 인구 통계
		List<HumanStatisVo> ageHumanStatisList = localService.humanAgeStatistic(dong);
		model.addAttribute("ageHumanStatisList", ageHumanStatisList);
		
		//연령별 인구 통계 최댓값
		int ageHumanStatisMaxValue = localService.humanAgeStatisMaxValue(dong);
		model.addAttribute("ageHumanStatisMaxValue", ageHumanStatisMaxValue);
		
		model.addAttribute("dong", dong);
		
		return "user/localAjax/pop/agePop";
	}
	
	
}
