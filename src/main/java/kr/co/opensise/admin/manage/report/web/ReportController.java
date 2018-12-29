package kr.co.opensise.admin.manage.report.web;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.opensise.admin.manage.dataetc.web.DataEtcController;
import kr.co.opensise.admin.manage.report.service.ReportServiceInf;
import kr.co.opensise.user.detail.model.Report_classfVo;

@Controller
@RequestMapping("/manage")
public class ReportController {
	
	private Logger log = LoggerFactory.getLogger(ReportController.class);
	
	@Resource(name="reportService")
	private ReportServiceInf reportService;
	
	@RequestMapping("/report")
	public String report() {
		
		
		
		return "manage/report";
	}
	
	@RequestMapping("/rptClassfForm")
	public String rptClassf(Model model) {
		// 신고분류 리스트 뿌리기
		List<Report_classfVo> rpt_cfVoList = reportService.getRptCf();
		model.addAttribute("rpt_cfVoList", rpt_cfVoList);
		
		return "admin/manage/reportAjax/rptClassfForm";
	}
	
	@RequestMapping(value="/insertAjax", method=RequestMethod.POST)
	public String insertAjax(Model model, @RequestParam("rpt_cf_nm") String rpt_cf_nm) {
		// 신고분류 생성
		int insertCnt = reportService.insertRptCf(rpt_cf_nm);
		model.addAttribute("insertCnt", insertCnt);
		
		return "admin/manage/reportAjax/rptClassfForm";
	}

}
