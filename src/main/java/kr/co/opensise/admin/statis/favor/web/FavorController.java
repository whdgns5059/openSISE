package kr.co.opensise.admin.statis.favor.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/statis/favor")
public class FavorController {

	@RequestMapping("/favor")
	public String favor() {
		return "statis/favor";
	}
	
}
