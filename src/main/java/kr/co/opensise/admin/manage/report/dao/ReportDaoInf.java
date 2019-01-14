package kr.co.opensise.admin.manage.report.dao;

import java.util.List;

import kr.co.opensise.admin.manage.review.model.PageVo;
import kr.co.opensise.user.detail.model.PostVo;
import kr.co.opensise.user.detail.model.ReportVo;
import kr.co.opensise.user.detail.model.Report_classfVo;

/**
* ReportDaoInf.java
*
* @author Bella
* @version 1.0
* @see
*
* <pre>
* << 개정이력(Modification Information) >>
*
* 수정자 수정내용
* ------ ------------------------
* Bella 최초 생성
*
* </pre>
*/
/**
* ReportDaoInf.java
*
* @author Bella
* @version 1.0
* @see
*
* <pre>
* << 개정이력(Modification Information) >>
*
* 수정자 수정내용
* ------ ------------------------
* Bella 최초 생성
*
* </pre>
*/
public interface ReportDaoInf {

	/**
	* Method : getRptCf
	* 작성자 : Bella
	* 변경이력 :
	* @return
	* Method 설명 : 신고분류 리스트
	*/
	List<Report_classfVo> getRptCf();
	
	/**
	* Method : insertRptCf
	* 작성자 : Bella
	* 변경이력 :
	* @param rpt_cf_nm
	* @return
	* Method 설명 : 신고분류 생성
	*/
	int insertRptCf(String rpt_cf_nm);
	
	/**
	* Method : updateRptCf
	* 작성자 : Bella
	* 변경이력 :
	* @param rpt_cfVo
	* @return
	* Method 설명 : 신고분류 수정
	*/
	int updateRptCf(Report_classfVo rpt_cfVo);
	
	/**
	* Method : deleteRptCf
	* 작성자 : Bella
	* 변경이력 :
	* @param rpt_classf
	* @return
	* Method 설명 : 신고분류 삭제
	*/
	int deleteRptCf(int rpt_classf);
	
	/**
	* Method : getReport
	* 작성자 : Bella
	* 변경이력 :
	* @return
	* Method 설명 : 신고 리스트
	*/
	List<ReportVo> getReport();

	/**
	* Method : reportCnt
	* 작성자 : Bella
	* 변경이력 :
	* @return
	* Method 설명 : 전체 신고 리스트 개수
	*/
	int reportCnt();
	
	/**
	* Method : searchReport
	* 작성자 : Bella
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 신고 리스트 검색 결과
	*/
	List<ReportVo> searchReport(PageVo pageVo);
	
	/**
	* Method : updateReport
	* 작성자 : Bella
	* 변경이력 :
	* @param reportVo
	* @return
	* Method 설명 : 신고 처리여부 수정
	*/
	int updateReport(ReportVo reportVo);
	
	/**
	* Method : updatePost
	* 작성자 : Bella
	* 변경이력 :
	* @param postVo
	* @return
	* Method 설명 : 신고 처리가 되면 리뷰는 삭제로 바뀜
	*/
	int updatePost(PostVo postVo);
	
	
	
	
	
	
	
	
	
	
	
}




