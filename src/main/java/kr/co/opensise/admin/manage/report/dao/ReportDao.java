package kr.co.opensise.admin.manage.report.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.opensise.admin.manage.review.model.PageVo;
import kr.co.opensise.user.detail.model.PostVo;
import kr.co.opensise.user.detail.model.ReportVo;
import kr.co.opensise.user.detail.model.Report_classfVo;

@Repository
public class ReportDao implements ReportDaoInf {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;

	@Override
	public List<Report_classfVo> getRptCf() {
		List<Report_classfVo> rpt_cfVoList = template.selectList("mng_report.getRptCf");
		return rpt_cfVoList;
	}

	@Override
	public int insertRptCf(String rpt_cf_nm) {
		int insertCnt = template.insert("mng_report.insertRptCf",rpt_cf_nm);
		return insertCnt;
	}

	@Override
	public int updateRptCf(Report_classfVo rpt_cfVo) {
		int updateCnt = template.update("mng_report.updateRptCf",rpt_cfVo);
		return updateCnt;
	}

	@Override
	public int deleteRptCf(int rpt_classf) {
		int deleteeCnt = template.delete("mng_report.deleteRptCf",rpt_classf);
		return deleteeCnt;
	}

	@Override
	public List<ReportVo> getReport() {
		List<ReportVo> reportVoList = template.selectList("mng_report.getReport");
		return reportVoList;
	}
	
	@Override
	public int reportCnt() {
		int reportCnt = template.selectOne("mng_report.reportCnt");
		return reportCnt;
	}
	
	@Override
	public List<ReportVo> searchReport(PageVo pageVo) {
		List<ReportVo> reportVoList = template.selectList("mng_report.searchReport", pageVo);
		return reportVoList;
	}

	@Override
	public int updateReport(ReportVo reportVo) {
		int updateCnt = template.update("mng_report.updateReport",reportVo);
		return updateCnt;
	}

	@Override
	public int updatePost(PostVo postVo) {
		int updateCnt = template.update("mng_report.updatePost",postVo);
		return updateCnt;
	}

	
}
