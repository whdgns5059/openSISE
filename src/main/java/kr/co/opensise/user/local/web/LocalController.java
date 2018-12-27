package kr.co.opensise.user.local.web;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.opensise.admin.manage.dataetc.model.MarketDetailVo;
import kr.co.opensise.user.market.service.MarketServiceInf;
import kr.co.opensise.user.local.model.HumanStatisVo;
import kr.co.opensise.user.local.service.LocalServiceInf;

@RequestMapping("/local")
@Controller
public class LocalController {
	
	Logger logger = LoggerFactory.getLogger(LocalController.class);
	
	@Resource(name="localService")
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
		
		String changeDong = dong.substring(0,1);
		
		//전체 인구 통계
		List<HumanStatisVo>allHumanStatisList = localService.humanAllStatistic(changeDong);
		model.addAttribute("allHumanStatis",allHumanStatisList);
		
		//전체 인구 통계 최댓값
		int allHumanStatisMaxValue = localService.humanAllStatisMaxValue(changeDong);
		model.addAttribute("allHumanMaxValue", allHumanStatisMaxValue);
		
		//전체 인구 통계 최솟값
		int allHumanStatisMinValue = localService.humanAllStatisMinValue(changeDong);
		model.addAttribute("allHumanMinValue", allHumanStatisMinValue);
		
		logger.info("minValue : " + allHumanStatisMinValue);
		
	
		
		//날짜 검색
		List<HumanStatisVo> hsDateSearch = localService.hsDateSearch();
		model.addAttribute("hsDate", hsDateSearch);
		
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
	
	@RequestMapping("/station")
	public String station( @RequestParam("dong") String dong, Model model) {
		return "user/localAjax/station";
	}
	
	
	//인구분석 
	@RequestMapping("/totalPop")
	public String totalPop(@RequestParam("dong") String dong, Model model) {
		
		String changeDong = dong.substring(0,1);
		
		//전체 인구 통계
		List<HumanStatisVo>allHumanStatisList = localService.humanAllStatistic(changeDong);
		model.addAttribute("allHumanStatis",allHumanStatisList);
		
		//전체 인구 통계 최댓값
		int allHumanStatisMaxValue = localService.humanAllStatisMaxValue(changeDong);
		model.addAttribute("allHumanMaxValue", allHumanStatisMaxValue);
		
		//전체 인구 통계 최솟값
		int allHumanStatisMinValue = localService.humanAllStatisMinValue(changeDong);
		model.addAttribute("allHumanMinValue", allHumanStatisMinValue);
		
		//날짜 검색
		List<HumanStatisVo> hsDateSearch = localService.hsDateSearch();
		model.addAttribute("hsDate", hsDateSearch);
		
		model.addAttribute("dong", dong);
		
		return "user/localAjax/pop/totalPop";
	}

	@RequestMapping("/genderPop")
	public String genderPop(@RequestParam("dong") String dong, Model model) {
		
		String changeDong = dong.substring(0,1);
		
		// 성별 인구 통계 
		List<HumanStatisVo> genderHumanStatisList = localService.humanGndrStatistic(changeDong);
		model.addAttribute("gndrHumanStatis", genderHumanStatisList);
		
		// 성별 인구 통계 최댓값
		int genderHumanStatisMaxValue = localService.humanGndrStatisMaxValue(changeDong);
		model.addAttribute("gndrHumanStatisMaxValue", genderHumanStatisMaxValue);
		
		// 성별 인구 통계 최솟값
		int genderHumanStatisMinValue = localService.humanGndrStatisMinValue(changeDong);
		model.addAttribute("gndrHumanStatisMinValue", genderHumanStatisMinValue);
		
		//남녀 총 성비
		List<HumanStatisVo> gndrHumanStatisCircle = localService.humanGndrStatisCricle(changeDong);
		model.addAttribute("gndrHumanStatisCircle",gndrHumanStatisCircle);
		
		logger.info("genderMinValue : " + genderHumanStatisMinValue);
		
		//날짜 검색
		List<HumanStatisVo> hsDateSearch = localService.hsDateSearch();
		model.addAttribute("hsDate", hsDateSearch);
		
		model.addAttribute("dong", dong);
		
		return "user/localAjax/pop/genderPop";
	}

	@RequestMapping("/agePop")
	public String agePop(HumanStatisVo humanVo, Model model) {
		
		logger.info("dong : " + humanVo.getDong());
		String changeDong = (humanVo.getDong()).substring(0,2);
		logger.info("changeDong : " + changeDong);
		humanVo.setDong(changeDong);
		
		//연령 리스트
		List<HumanStatisVo> ageList = localService.ageList();
		model.addAttribute("ageList", ageList);
		
		
		//연령별 인구 통계
		List<HumanStatisVo> ageHumanStatisList = localService.humanAgeStatistic(humanVo);
		model.addAttribute("ageHumanStatisList", ageHumanStatisList);
		
		//연령별 인구 통계 최댓값
		int ageHumanStatisMaxValue = localService.humanAgeStatisMaxValue(humanVo);
		model.addAttribute("ageHumanStatisMaxValue", ageHumanStatisMaxValue);
		logger.info("ageHumanSatisMaxValue : " + ageHumanStatisMaxValue);
		
		//연령별 인구 통계 최솟값
		int ageHumanStatisMinValue = localService.humanAgeStatisMinValue(humanVo);
		model.addAttribute("ageHumanStatisMinValue", ageHumanStatisMinValue);
		logger.info("ageHumanSatisMinValue : " + ageHumanStatisMinValue );
		
		//날짜 검색
		List<HumanStatisVo> hsDateSearch = localService.hsDateSearch();
		model.addAttribute("hsDate", hsDateSearch);
		
		model.addAttribute("dong", humanVo.getDong());
		
		return "user/localAjax/pop/agePop";
	}
	
	@RequestMapping("ageAjaxPop")
	public String ageAjaxPop(HumanStatisVo humanVo, Model model) {
		
		logger.info("dong : " + humanVo.getDong());
		String changeDong = (humanVo.getDong()).substring(0,2);
		logger.info("changeDong : " + changeDong);
		humanVo.setDong(changeDong);
		
		//연령 리스트
		List<HumanStatisVo> ageList = localService.ageList();
		model.addAttribute("ageList", ageList);
		
		
		//연령별 인구 통계
		List<HumanStatisVo> ageHumanStatisList = localService.humanAgeStatistic(humanVo);
		model.addAttribute("ageHumanStatisList", ageHumanStatisList);
		
		//연령별 인구 통계 최댓값
		int ageHumanStatisMaxValue = localService.humanAgeStatisMaxValue(humanVo);
		model.addAttribute("ageHumanStatisMaxValue", ageHumanStatisMaxValue);
		logger.info("ageHumanSatisMaxValue : " + ageHumanStatisMaxValue);
		
		//연령별 인구 통계 최솟값
		int ageHumanStatisMinValue = localService.humanAgeStatisMinValue(humanVo);
		model.addAttribute("ageHumanStatisMinValue", ageHumanStatisMinValue);
		logger.info("ageHumanSatisMinValue : " + ageHumanStatisMinValue );
		
		//날짜 검색
		List<HumanStatisVo> hsDateSearch = localService.hsDateSearch();
		model.addAttribute("hsDate", hsDateSearch);
		
		//연령별 비율 그래프
		List<HumanStatisVo> ageCircle = localService.ageCircle(humanVo);
		model.addAttribute("ageCircle", ageCircle);
		
		model.addAttribute("dong", humanVo.getDong());
		
		
		return "user/localAjax/pop/ageAjaxPop";
	}
	
	
}
