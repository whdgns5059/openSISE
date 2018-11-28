package kr.co.opensise.admin.manage.notice.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manage/notice")
public class NoticeController {
	
	@RequestMapping("/notice")
	public String notice() {
		return "manage/notice";
	}

}
