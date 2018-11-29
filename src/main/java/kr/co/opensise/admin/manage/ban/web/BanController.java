package kr.co.opensise.admin.manage.ban.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manage/ban")
public class BanController {
	
	@RequestMapping("/ban")
	public String ban() {
		return "manage/ban";
	}

}
