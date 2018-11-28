package kr.co.opensise.admin.statis.member.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/statis/member")
public class MemberStatisController {
	
	@RequestMapping("/member")
	public String member() {
		return "statis/member";
	}
}
