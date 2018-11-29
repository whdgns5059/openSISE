package kr.co.opensise.user.local.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/local")
public class LocalController {
	
	@RequestMapping("/local")
	public String local() {
		return "local";
	}

}
