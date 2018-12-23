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

@Controller
@RequestMapping("/local")
public class LocalController {
	
	
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
	public String popStatis() {
		
		
		return "user/localAjax/popStatis";
	}
	
	@RequestMapping("/nearFaci")
	public String nearFaci() {
		return "user/localAjax/nearFaci";
	} 
	
	@RequestMapping("/market")
	public String market(@RequestParam("dong") String dong, Model model) {
		
		String dongSub = dong.substring(0, 1);
		
		List<MarketDetailVo> avgMkdList = MarketService.selectAvgMkd(dongSub);
		List<MarketDetailVo> mkdList = MarketService.selectMkd(dongSub);
	
		model.addAttribute("avgMkdList", avgMkdList);
		model.addAttribute("mkdList", mkdList);
		
		return "user/localAjax/market";
	}

	@RequestMapping("/etc")
	public String etc() {
		return "user/localAjax/etc";
	}
	
	
	
	
	//인구분석 
	@RequestMapping("/totalPop")
	public String totalPop() {
		return "user/localAjax/pop/totalPop";
	}

	@RequestMapping("/genderPop")
	public String genderPop() {
		return "user/localAjax/pop/genderPop";
	}

	@RequestMapping("/agePop")
	public String agePop() {
		return "user/localAjax/pop/agePop";
	}
	
	
}
