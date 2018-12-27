package kr.co.opensise.admin.manage.review.web;

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

		return "manage/review";
	}

	@RequestMapping(value="/search", method = {RequestMethod.POST})
	public String searchList(@RequestParam("searchNm") String searchNm, @RequestParam("selBox") String selBox,
			Model model) {
		Map<String, String> searchMap = new HashMap<>();
		searchMap.put("searchNm", searchNm);
		searchMap.put("selBox", selBox);

		List<ReviewVo> cateSearchList = reviewService.cateReviewList(searchMap);
		model.addAttribute("cateList", cateSearchList);

		return "admin/manage/reviewAjax/cateReviewAjax";
	}

}
