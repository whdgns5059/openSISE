package kr.co.opensise.admin.manage.dataetc.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manage/dataEtc")
public class DataEtcController {
	
	@RequestMapping("/dataEtc")
	public String dataEtc() {
		return "manage/dataEtc";
	}

}
