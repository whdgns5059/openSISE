package kr.co.opensise.user.local.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/local")
public class LocalController {
	
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
	public String market() {
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
