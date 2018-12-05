package kr.co.opensise.member.signup.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/signup")
public class SignupDetail {
	
	@RequestMapping("/signup")
	public String signup() {
		return "signup";
	}

	@RequestMapping("/signupDetail")
	public String signupDetail() {
		return "signupDetail";
	}

}
