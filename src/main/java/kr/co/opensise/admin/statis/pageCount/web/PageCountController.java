package kr.co.opensise.admin.statis.pageCount.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/statis/pageCount")
public class PageCountController {
	
	@RequestMapping("/pageCount")
	public String pageCount() {
		return "statis/pageCount";
	}
}
