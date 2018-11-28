package kr.co.opensise.admin.statis.interest.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/statis/interest")
public class InterestController {
	
	@RequestMapping("/interest")
	public String interest() {
		return "statis/interest";
	}
}
