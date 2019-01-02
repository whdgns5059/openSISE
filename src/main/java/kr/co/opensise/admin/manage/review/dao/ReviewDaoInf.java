package kr.co.opensise.admin.manage.review.dao;

import java.util.List;
import java.util.Map;

import kr.co.opensise.admin.manage.review.model.PageVo;
import kr.co.opensise.admin.manage.review.model.PictureVo;
import kr.co.opensise.admin.manage.review.model.ReportHistoryVo;
import kr.co.opensise.admin.manage.review.model.ReviewVo;

public interface ReviewDaoInf {
	
	/**  
	* Method   : allReviewList 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @return  
	* Method 설명 :  삭제되지 않은 모든 리뷰 출력
	*/
	public List<ReviewVo> allReviewList(PageVo pageVo);
	
	/**  
	* Method   : cateReviewList 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param searchMap
	* @return  
	* Method 설명 :  분류별 리뷰 검색
	*/
	public int cateReviewCnt(PageVo pageVo);
	
	/**  
	* Method   : reviewCnt
	* 작성자 :1003yd
	* 변경이력 :  
	* @return 
	* Method 설명 : reivew 갯수 count 
	*/
	public int reviewCnt();
	
	
	/**  
	* Method   : deleteReivew
	* 작성자 :1003yd
	* 변경이력 :  
	* @param reviewVo
	* @return 
	* Method 설명 : 관리자의 리뷰 강제 삭제
	*/
	public int deleteReivew(ReviewVo reviewVo);
	
	/**  
	* Method   : reportList
	* 작성자 :1003yd
	* 변경이력 :  
	* @param reviewVo
	* @return 
	* Method 설명 : 해당 리뷰의 신고이력 검색 
	*/
	public List<ReportHistoryVo> reportList(ReviewVo reviewVo);
	
	/**  
	* Method   : pictureList
	* 작성자 :1003yd
	* 변경이력 :  
	* @param reviewVo
	* @return 
	* Method 설명 : 해당 리뷰의 첨부파일 검색
	*/
	public List<PictureVo> pictureList(ReviewVo reviewVo);

}
