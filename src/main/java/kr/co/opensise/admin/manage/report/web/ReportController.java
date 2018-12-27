package kr.co.opensise.admin.manage.report.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.opensise.admin.manage.dataetc.web.DataEtcController;

@Controller
@RequestMapping("/manage")
public class ReportController {
	
	private Logger log = LoggerFactory.getLogger(ReportController.class);
	
	@RequestMapping("/report")
	public String report() {
		
		
		
		return "manage/report";
	}

}
