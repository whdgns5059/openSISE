package kr.co.opensise.admin.manage.member.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manage/member")
public class MemberManageController {
	
	@RequestMapping("/member")
	public String member() {
		return "manage/member";
	}

}
