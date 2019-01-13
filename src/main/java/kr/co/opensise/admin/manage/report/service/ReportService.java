package kr.co.opensise.admin.manage.report.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.co.opensise.admin.manage.report.dao.ReportDaoInf;
import kr.co.opensise.admin.manage.report.web.ReportController;
import kr.co.opensise.admin.manage.review.model.PageVo;
import kr.co.opensise.user.detail.model.ReportVo;
import kr.co.opensise.user.detail.model.Report_classfVo;

@Service
public class ReportService implements ReportServiceInf {
	
	private Logger log = LoggerFactory.getLogger(ReportService.class);
	
	@Resource(name="reportDao")
	private ReportDaoInf reportDao;

	@Override
	public List<Report_classfVo> getRptCf() {
		return reportDao.getRptCf();
	}

	@Override
	public int insertRptCf(String rpt_cf_nm) {
		return reportDao.insertRptCf(rpt_cf_nm);
	}

	@Override
	public int updateRptCf(Report_classfVo rpt_cfVo) {
		return reportDao.updateRptCf(rpt_cfVo);
	}

	@Override
	public int deleteRptCf(int rpt_classf) {
		return reportDao.deleteRptCf(rpt_classf);
	}

	@Override
	public List<ReportVo> getReport() {
		return reportDao.getReport();
	}
	
	@Override
	public Map<String, Object> searchReport(PageVo pageVo) {
		// 신고 리스트 검색 결과
		List<ReportVo> reportVoList = reportDao.searchReport(pageVo);
		
		// 전체 신고 리스트 개수
		int reportCnt = reportDao.reportCnt();
		
		// 신고 리스트와 페이징 갯수 넣기
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("reportVoList", reportVoList);
		resultMap.put("pageCnt", (int) Math.ceil((double) reportCnt / pageVo.getPageSize()));
		
		return resultMap;
	}

	@Override
	public int updateReport(ReportVo reportVo) {
		return reportDao.updateReport(reportVo);
	}



}
