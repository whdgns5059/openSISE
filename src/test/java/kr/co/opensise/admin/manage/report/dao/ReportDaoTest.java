package kr.co.opensise.admin.manage.report.dao;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.opensise.admin.manage.review.model.PageVo;
import kr.co.opensise.admin.statis.model.FavoriteVo;
import kr.co.opensise.admin.statis.model.InterestVo;
import kr.co.opensise.admin.statis.model.MemberVo;
import kr.co.opensise.admin.statis.model.Page_statisticVo;
import kr.co.opensise.admin.statis.model.VisitorVo;
import kr.co.opensise.setup.RootSetup;
import kr.co.opensise.user.detail.model.ReportVo;
import kr.co.opensise.user.detail.model.Report_classfVo;
import kr.co.opensise.util.CommonUtilTest;

public class ReportDaoTest extends RootSetup{
	private Logger log = LoggerFactory.getLogger(CommonUtilTest.class);

	@Resource(name="reportDao")
	private ReportDaoInf reportDao;
	
	@Test
	public void getRptCfTest() {
		List<Report_classfVo> rpt_cfVoList = reportDao.getRptCf();
		
		for(Report_classfVo rpt_cfVo : rpt_cfVoList)
			log.info("신고분류 리스트 {} ",rpt_cfVo);
		
	}
	
	@Test
	public void insertRptCfTest() {
		/***Given***/
		String rpt_cf_nm = "종교전파";

		/***When***/
		int insertCnt = reportDao.insertRptCf(rpt_cf_nm);

		/***Then***/
		assertEquals(1, insertCnt);
	}
	
	@Test
	public void updateRptCfTest() {
		/***Given***/
		Report_classfVo rpt_cfVo = new Report_classfVo();
		rpt_cfVo.setRpt_classf(21);
		rpt_cfVo.setRpt_cf_nm("종교적 글");

		/***When***/
		int updateCnt = reportDao.updateRptCf(rpt_cfVo);

		/***Then***/
		assertEquals(1, updateCnt);
		
	}
	
	@Test
	public void deleteRptCfTest() {
		/***Given***/
		int rpt_classf = 21;
		
		/***When***/
		int deleteCnt = reportDao.deleteRptCf(rpt_classf);
		
		/***Then***/
		assertEquals(1, deleteCnt);
		
	}
	
	@Test
	public void getReportTest() {
		List<ReportVo> reportVoList = reportDao.getReport();
		
		for(ReportVo reportVo : reportVoList)
			log.info("신고 리스트 {} ",reportVo);
	}
	
	@Test
	public void searchReportTest() {
		/***Given***/
		PageVo pageVo = new PageVo();
		pageVo.setPage(1);
		pageVo.setPageSize(10);
		pageVo.setSelBox("rpt_ttl");
		pageVo.setSearchNm("소형");

		/***When***/
		List<ReportVo> reportVoList = reportDao.searchReport(pageVo);

		/***Then***/
		for(ReportVo reportVo : reportVoList)
			log.info("결과값 {}",reportVo);
	}
	
	@Test
	public void updateReportTest() {
		/***Given***/
		ReportVo reportVo = new ReportVo();
		reportVo.setRpt_no(22);
		reportVo.setRpt_exst("y");

		/***When***/
		int updateCnt = reportDao.updateReport(reportVo);

		/***Then***/
		assertEquals(1, updateCnt);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
	

	
	
	
	
	
	
	
	
	
	


