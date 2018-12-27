package kr.co.opensise.user.index.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.opensise.admin.manage.notice.service.NoticeServiceInf;
import kr.co.opensise.user.detail.model.PostVo;

@Controller
@RequestMapping("/index")
public class IndexController {
	
	@Resource(name="noticeService")
	private NoticeServiceInf noticeService;
	
	
	@RequestMapping("/openPage")
	public String index(Model model) {
		
		// 사이트의 시작은 openPage이기 때문에 방문자의 기준으로 잡습니다.
//		Cookie firstVisit = new Cookie("firstVisit","Y");
//		firstVisit.setMaxAge(60*30); // 기간을 30분으로 지정
//		Cookie visitTime = new Cookie("visitTime", ""+System.currentTimeMillis());
//		visitTime.setMaxAge(60*30); // 기간을 30분으로 지정
		
		//공지사항 타이틀 나열
		List<PostVo> noticeList =  noticeService.selectNoticeList();
		
		model.addAttribute("noticeList", noticeList);
		return "openPage";
	}
	
	
}
