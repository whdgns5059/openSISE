package kr.co.opensise.admin.manage.review.web;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.opensise.admin.manage.review.model.PageVo;
import kr.co.opensise.admin.manage.review.model.ReportHistoryVo;
import kr.co.opensise.admin.manage.review.model.ReviewVo;
import kr.co.opensise.admin.manage.review.service.ReviewServiceInf;

@Controller
@RequestMapping("/manage/review")
public class ReviewController {

	Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Resource
	private ReviewServiceInf reviewService;

	/**  
	* Method   : review
	* 작성자 :1003yd
	* 변경이력 :  
	* @param model
	* @return 
	* Method 설명 : review 첫 리스트 출력
	*/
	@RequestMapping("/review")
	public String review(Model model) {
		PageVo pageVo = new PageVo();
		pageVo.setPage(1);
		pageVo.setPageSize(10);
		
		Map<String, Object> reviewAllList = reviewService.allReviewList(pageVo);
		List<ReviewVo> reviewList = (List<ReviewVo>) reviewAllList.get("pageReviewList");
		
		model.addAllAttributes(reviewAllList);
		model.addAttribute("reviewSize", reviewList.size());
		

		return "manage/review";
	}

	@RequestMapping(value="/search", method = {RequestMethod.POST})
	public String searchList(PageVo pageVo, Model model) {
		Map<String, Object> searchMap = new HashMap<>();
		/*if(pageVo.getSelBox().equals("all") || pageVo.getSelBox().equals("email")) {
			searchMap.put("searchNm", searchNm);
			searchMap.put("selBox", selBox);
		}else {
			try {
				SimpleDateFormat fmt = new java.text.SimpleDateFormat("yyyy-MM-dd");
				java.util.Date ud = fmt.parse(searchNm);
		        java.sql.Date sd = new java.sql.Date(ud.getTime());
		        String formattedSqlDate = fmt.format(sd);
				searchMap.put("searchNm", formattedSqlDate);
				searchMap.put("selBox", selBox);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}*/
		
		Map<String, Object> reviewAllList = reviewService.allReviewList(pageVo);
		List<ReviewVo> reviewList = (List<ReviewVo>) reviewAllList.get("pageReviewList");
		model.addAllAttributes(reviewAllList);
		model.addAttribute("reviewSize", reviewList.size());
		
		//페이징 처리 Cnt 검색
		int cateCnt = reviewService.cateReviewCnt(pageVo);
		model.addAttribute("cateCnt",cateCnt);
		
	/*	List<ReviewVo> cateSearchList = reviewService.cateReviewList(pageVo);
		model.addAttribute("cateList", cateSearchList);
		model.addAttribute("cateSize", cateSearchList.size());*/
		return "admin/manage/reviewAjax/cateReviewAjax";
	}
	
	/**  
	* Method   : reviewHistory
	* 작성자 :1003yd
	* 변경이력 :  
	* @param reviewVo
	* @param model
	* @return 
	* Method 설명 : 해당 리뷰의 신고 이력 검색
	*/
	@RequestMapping(value="/reviewReportHistory" , method = {RequestMethod.POST})
	public String reviewHistory(ReviewVo reviewVo, Model model) {
		
		List<ReportHistoryVo> reportList = reviewService.reportList(reviewVo);
		model.addAttribute("reportList", reportList);
		model.addAttribute("reportSize", reportList.size());
		
		return "admin/manage/reviewReportHistory";
	}
	
	/**  
	* Method   : deleteReview
	* 작성자 :1003yd
	* 변경이력 :  
	* @param reviewVo
	* @param model
	* @return 
	* Method 설명 : 관리자 리뷰 강제 삭제 
	*/
	@RequestMapping(value="/deleteReivew", method = {RequestMethod.POST})
	public String deleteReview(ReviewVo reviewVo, Model model) {
		logger.info("들어왔냥:" + reviewVo.getPost_no());
		int reviewDelete = reviewService.deleteReivew(reviewVo);
		model.addAttribute("reviewDelete", reviewDelete);
		return "jsonView";
	}
	

}
