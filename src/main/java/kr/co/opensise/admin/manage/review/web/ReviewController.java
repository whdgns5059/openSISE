package kr.co.opensise.admin.manage.review.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manage/review")
public class ReviewController {
	
	@RequestMapping("/review")
	public String review() {
		return "manage/review";
	}

}
