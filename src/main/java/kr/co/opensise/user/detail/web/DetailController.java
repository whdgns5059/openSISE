package kr.co.opensise.user.detail.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/detail")
public class DetailController {
	
	@RequestMapping("/detail")
	public String detail() {
		return "detail";
	}

}
