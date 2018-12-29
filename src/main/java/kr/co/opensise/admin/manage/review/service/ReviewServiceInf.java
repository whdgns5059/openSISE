package kr.co.opensise.admin.manage.review.service;

import java.util.List;
import java.util.Map;

import kr.co.opensise.admin.manage.review.model.ReviewVo;

public interface ReviewServiceInf {
	
	/**  
	* Method   : allReviewList 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @return  
	* Method 설명 :  삭제되지 않은 모든 리뷰 출력
	*/
	public List<ReviewVo> allReviewList();
	
	
	/**  
	* Method   : cateReviewList 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param searchMap
	* @return  
	* Method 설명 :  분류별 리뷰 검색
	*/
	public List<ReviewVo> cateReviewList(Map<String, Object> searchMap);
	

}
