package kr.co.opensise.admin.manage.notice.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.opensise.admin.manage.dataetc.web.DataEtcController;
import kr.co.opensise.admin.manage.notice.model.PageVo;
import kr.co.opensise.admin.manage.notice.service.NoticeServiceInf;
import kr.co.opensise.user.detail.model.PostVo;

@Controller
@RequestMapping("/manage/notice")
public class NoticeController {
	
	private Logger log = LoggerFactory.getLogger(DataEtcController.class);
	
	@Resource(name="noticeService")
	private NoticeServiceInf noticeService;
	
	@RequestMapping("/notice")
	public String notice(PageVo pageVo,Model model) {
		if(pageVo.getPage()==0 || pageVo.getPageSize()==0) {
			pageVo.setPage(1);
			pageVo.setPageSize(10);
		}
		
		Map<String, Object> noticeList =  noticeService.selectNoticeList(pageVo);
		
		int page = pageVo.getPage();
		
		int pageCnt = noticeService.noticeCnt();
		log.info("pageCnt:{}",pageCnt);
		
		model.addAllAttributes(noticeList);
		model.addAttribute("page", page);
		model.addAttribute("pageCnt", pageCnt);
		return "manage/notice";
	}
	
	@RequestMapping("/insertView")
	public String insertView() {
		return "manage/noticeInsert";
	}
	
	@RequestMapping("/insertPost")
	public String insertPost(PageVo pageVo,@RequestParam("post_ttl") String post_ttl,
					@RequestParam("POST_CNTNT") String POST_CNTNT, Model model) {
		PostVo noticeVo = new PostVo();
		noticeVo.setPost_ttl(post_ttl);
		noticeVo.setPost_cntnt(POST_CNTNT);
		
		noticeService.insertNotice(noticeVo);
		
		Map<String, Object> noticeList =  noticeService.selectNoticeList(pageVo);
		
		int page = pageVo.getPage();
		
		int pageCnt = (int) noticeList.get("pageCnt");
		
		model.addAllAttributes(noticeList);
		model.addAttribute("page", page);
		model.addAttribute("pageCnt", pageCnt);
		
		return "redirect:/manage/notice/notice";
	}
	
	@RequestMapping("/updateNotice")
	public String updateNotice(PageVo pageVo,@RequestParam("post_no") String post_noS, @RequestParam("post_ttl") String post_ttl,
							@RequestParam("post_cntnt") String post_cntnt,Model model) {
//		log.info("여기로 오는가?");
		
		int post_no = Integer.parseInt(post_noS);
		
		PostVo noticeVo = noticeService.selectNotice(post_no);
		
		noticeVo.setPost_ttl(post_ttl);
		noticeVo.setPost_cntnt(post_cntnt);
		
		noticeService.updateNotice(noticeVo);
		
//		log.info("수정된 vo : {}",noticeVo);
		
		Map<String, Object> noticeList =  noticeService.selectNoticeList(pageVo);
		
		int page = pageVo.getPage();
		
		int pageCnt = (int) noticeList.get("pageCnt");
		
		model.addAllAttributes(noticeList);
		model.addAttribute("page", page);
		model.addAttribute("pageCnt", pageCnt);
		
		
		return "jsonView";
	}
	
	@RequestMapping("/deleteNotice")
	public String deleteNotice(PageVo pageVo,@RequestParam("post_no") String post_noS,Model model) {
		int post_no = Integer.parseInt(post_noS);
		
		noticeService.deleteNotice(post_no);
		
		Map<String, Object> noticeList =  noticeService.selectNoticeList(pageVo);
		
		model.addAllAttributes(noticeList);
		
		return "redirect:/manage/notice/notice";
	}

}
