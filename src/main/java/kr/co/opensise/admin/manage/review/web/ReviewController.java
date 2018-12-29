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

import kr.co.opensise.admin.manage.review.model.ReviewVo;
import kr.co.opensise.admin.manage.review.service.ReviewServiceInf;

@Controller
@RequestMapping("/manage/review")
public class ReviewController {

	Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Resource
	private ReviewServiceInf reviewService;

	@RequestMapping("/review")
	public String review(Model model) {

		// 모든 회원의 삭제하지 않은 리뷰 출력
		List<ReviewVo> reviewAllList = reviewService.allReviewList();
		model.addAttribute("reviewAllList", reviewAllList);
		model.addAttribute("reviewSize", reviewAllList.size());

		return "manage/review";
	}

	@RequestMapping(value="/search", method = {RequestMethod.POST})
	public String searchList(@RequestParam("searchNm") String searchNm, @RequestParam("selBox") String selBox, Model model) {
		Map<String, Object> searchMap = new HashMap<>();
		if(selBox.equals("all") || selBox.equals("email")) {
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
		}
		List<ReviewVo> cateSearchList = reviewService.cateReviewList(searchMap);
		model.addAttribute("cateList", cateSearchList);
		model.addAttribute("cateSize", cateSearchList.size());

		return "admin/manage/reviewAjax/cateReviewAjax";
	}

}
