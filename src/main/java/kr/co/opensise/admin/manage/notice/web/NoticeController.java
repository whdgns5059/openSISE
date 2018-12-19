package kr.co.opensise.admin.manage.notice.web;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.opensise.admin.manage.dataetc.service.DataEtcServiceInf;
import kr.co.opensise.admin.manage.dataetc.web.DataEtcController;
import kr.co.opensise.admin.manage.notice.model.PostVo;
import kr.co.opensise.admin.manage.notice.service.NoticeService;
import kr.co.opensise.admin.manage.notice.service.NoticeServiceInf;

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
	
	@RequestMapping("/insertView")
	public String insertView() {
		return "";
	}

}
