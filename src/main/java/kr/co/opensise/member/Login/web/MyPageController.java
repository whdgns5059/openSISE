package kr.co.opensise.member.mypage.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	@RequestMapping("/myinfo")
	public String mypage() {
		return "myinfo";
	}
	
	@RequestMapping("/favor")
	public String favor() {
		return "favor";
	}
	
	@RequestMapping("/recent")
	public String recent() {
		return "recent";
	}
	
	@RequestMapping("/interest")
	public String interest() {
		return "interest";
	}
	
	@RequestMapping("/security")
	public String security() {
		return "security";
	}

	@RequestMapping("/exit")
	public String exit() {
		return "exit";
	}
	
}
