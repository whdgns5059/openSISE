package kr.co.opensise.admin.statis.visitor.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/statis/visitor")
public class VisitorController {
	
	@RequestMapping("/visitor")
	public String visitor() {
		return "statis/visitor";
	}
}
