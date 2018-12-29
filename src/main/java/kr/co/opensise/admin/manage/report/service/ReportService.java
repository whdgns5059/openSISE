package kr.co.opensise.admin.manage.report.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.opensise.admin.manage.report.dao.ReportDaoInf;
import kr.co.opensise.user.detail.model.ReportVo;
import kr.co.opensise.user.detail.model.Report_classfVo;

@Service
public class ReportService implements ReportServiceInf {
	
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
	public int updateReport(ReportVo reportVo) {
		return reportDao.updateReport(reportVo);
	}


}
