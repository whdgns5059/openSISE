package kr.co.opensise.user.index.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/index")
public class IndexController {
	
	@RequestMapping("/openPage")
	public String index() {
		
		return "openPage";
	}
	
	
}
