package kr.co.opensise.admin.manage.report.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manage/report")
public class ReportController {
	
	@RequestMapping("/report")
	public String report() {
		return "manage/report";
	}

}
