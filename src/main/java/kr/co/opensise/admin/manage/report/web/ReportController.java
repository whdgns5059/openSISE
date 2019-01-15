package kr.co.opensise.admin.manage.report.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.opensise.admin.manage.report.service.ReportServiceInf;
import kr.co.opensise.admin.manage.review.model.PageVo;
import kr.co.opensise.user.detail.model.PostVo;
import kr.co.opensise.user.detail.model.ReportVo;
import kr.co.opensise.user.detail.model.Report_classfVo;

@Controller
@RequestMapping("/manage")
public class ReportController {
	
	private Logger log = LoggerFactory.getLogger(ReportController.class);
	
	@Resource(name="reportService")
	private ReportServiceInf reportService;
	
	@GetMapping("/report")
	public String report() {
		return "manage/report";
	}
	
	/**
	* Method : rptClassf
	* 작성자 : Bella
	* 변경이력 :
	* @param model
	* @return
	* Method 설명 : 신고분류 윈도우로 이동
	*/
	@RequestMapping("/rptClassfForm")
	public String rptClassf() {
		return "admin/manage/reportAjax/rptClassfForm";
	}
	
	/**
	* Method : rpt_cfVoList
	* 작성자 : Bella
	* 변경이력 :
	* @param model
	* @return
	* Method 설명 : 신고분류 리스트 뿌리기
	*/
	@GetMapping(value="/rpt_cfVoList")
	public String rpt_cfVoList(Model model) {
		try {
			// 신고분류 리스트 뿌리기
			List<Report_classfVo> rpt_cfVoList = reportService.getRptCf();
			model.addAttribute("rpt_cfVoList",rpt_cfVoList);
		}catch (Exception e){
			log.info(e.toString());
		}
		
		return "jsonView";
	}
	
	/**
	* Method : insertAjax
	* 작성자 : Bella
	* 변경이력 :
	* @param model
	* @param rpt_cf_nm
	* @return
	* Method 설명 : 새 신고분류 생성
	*/
	@PostMapping(value="/insertAjax")
	public String insertAjax(Model model, @RequestParam("rpt_cf_nm") String rpt_cf_nm) {
		try {
			// 신고분류 생성
			int insertCnt = reportService.insertRptCf(rpt_cf_nm);
			model.addAttribute("insertCnt", insertCnt);
		}catch (Exception e){
			log.info(e.toString());
		}
		
		return "jsonView";
	}
	
	/**
	* Method : updateAjax
	* 작성자 : Bella
	* 변경이력 :
	* @param model
	* @param rpt_cfVo
	* @return
	* Method 설명 : 신고분류 수정
	*/
	@PostMapping(value="/updateAjax")
	public String updateAjax(Model model, Report_classfVo rpt_cfVo ) {
		try {
			// 신고분류 수정
			int updateCnt = reportService.updateRptCf(rpt_cfVo);
			model.addAttribute("updateCnt", updateCnt);
		}catch (Exception e){
			log.info(e.toString());
		}
		
		return "jsonView";
	}

	/**
	* Method : deleteAjax
	* 작성자 : Bella
	* 변경이력 :
	* @param model
	* @param rpt_classf
	* @return
	* Method 설명 : 신고분류 삭제
	*/
	@GetMapping(value="/deleteAjax")
	public String deleteAjax(Model model, @RequestParam("rpt_classf") int rpt_classf ) {
		try {
		// 신고분류 삭제
		int deleteCnt = reportService.deleteRptCf(rpt_classf);
		model.addAttribute("deleteCnt", deleteCnt);
		}catch (Exception e){
			log.info(e.toString());
		}
		
		return "jsonView";
	}
	
	/**
	* Method : reportListAjax
	* 작성자 : Bella
	* 변경이력 :
	* @param model
	* @param reportVo
	* @return
	* Method 설명 : 검색 결과에 따른 신고 리스트 결과
	*/
	@PostMapping(value="/reportListAjax")
	public String reportListAjax(Model model, PageVo pageVo) {
		
		try {
		// 신고 리스트 검색 결과
		Map<String, Object> resultMap = reportService.searchReport(pageVo);
		model.addAllAttributes(resultMap);
		}catch (Exception e){
			log.info(e.toString());
		}
		
		return "admin/manage/reportAjax/reportListAjax";
	}
	
	/**
	* Method : reportUpdateAjax
	* 작성자 : Bella
	* 변경이력 :
	* @param model
	* @param reportVo
	* @return
	* Method 설명 : 신고 처리여부 수정
	*/
	@PostMapping(value="/reportUpdateAjax")
	public String reportUpdateAjax(Model model, ReportVo reportVo) {
		
		try {
			int updateCnt = reportService.updateReport(reportVo);
			model.addAttribute("updateCnt",updateCnt);
			
			// 리뷰 삭제여부 수정
			String exst = reportVo.getRpt_exst();
			log.info("삭제여부? {}",exst);
			PostVo postVo = new PostVo();
			postVo.setPost_no(reportVo.getRpt_post());
			log.info("리뷰 번호? {}",reportVo.getRpt_post());
			postVo.setPost_exst(exst);;
			int a = reportService.updatePost(postVo);
			log.info("리뷰 수정 됬니? {}",a);
			
					
		}catch (Exception e){
			log.info(e.toString());
		}
		
		return "jsonView";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
