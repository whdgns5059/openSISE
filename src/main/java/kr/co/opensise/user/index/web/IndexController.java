package kr.co.opensise.user.index.web;

import javax.servlet.http.Cookie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/index")
public class IndexController {
	
	@RequestMapping("/openPage")
	public String index() {
		
		// 첫 방문인지 여부 Y:첫방문 N:첫방문 아님
		Cookie firstVisit = new Cookie("firstVisit","Y");
		firstVisit.setMaxAge(60*30); // 기간을 30분으로 지정
		Cookie visitTime = new Cookie("visitTime", ""+System.currentTimeMillis());
		visitTime.setMaxAge(60*30); // 기간을 30분으로 지정
		
		return "openPage";
	}
	
	
}
