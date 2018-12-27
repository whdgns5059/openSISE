package kr.co.opensise.admin.manage.notice.web;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.opensise.admin.manage.dataetc.service.DataEtcServiceInf;
import kr.co.opensise.admin.manage.dataetc.web.DataEtcController;
import kr.co.opensise.admin.manage.notice.service.NoticeService;
import kr.co.opensise.admin.manage.notice.service.NoticeServiceInf;
import kr.co.opensise.user.detail.model.PostVo;

@Controller
@RequestMapping("/manage/notice")
public class NoticeController {
	
	private Logger log = LoggerFactory.getLogger(DataEtcController.class);
	
	@Resource(name="noticeService")
	private NoticeServiceInf noticeService;
	
	@RequestMapping("/notice")
	public String notice(Model model) {
		List<PostVo> noticeList =  noticeService.selectNoticeList();
		
		model.addAttribute("noticeList", noticeList);
		return "manage/notice";
	}
	
//	@RequestMapping("/postDetail")
//	public String postDetail(@RequestParam("post_no") String post_noS,Model model) {
//		int post_no =Integer.parseInt(post_noS);
//		PostVo postVo = noticeService.selectNotice(post_no);
//		
//		model.addAttribute("postVo", postVo);
//		return "manage/notice";
//	}
	
	@RequestMapping("/insertView")
	public String insertView() {
		return "manage/noticeInsert";
	}
	
	@RequestMapping("/insertPost")
	public String insertPost(@RequestParam("post_ttl") String post_ttl,
					@RequestParam("POST_CNTNT") String POST_CNTNT, Model model) {
		PostVo noticeVo = new PostVo();
		noticeVo.setPost_ttl(post_ttl);
		noticeVo.setPost_cntnt(POST_CNTNT);
		
		noticeService.insertNotice(noticeVo);
		
		List<PostVo> noticeList =  noticeService.selectNoticeList();
		
		model.addAttribute("noticeList", noticeList);
		
		return "manage/notice";
	}

}
