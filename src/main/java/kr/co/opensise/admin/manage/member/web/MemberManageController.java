package kr.co.opensise.admin.manage.member.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.opensise.admin.manage.member.model.ManagementVo;
import kr.co.opensise.admin.manage.member.model.PageVO;
import kr.co.opensise.admin.manage.member.service.MemberServiceInf;
import kr.co.opensise.admin.manage.review.model.ReviewVo;
import kr.co.opensise.member.Login.model.MemberVo;
import kr.co.opensise.member.Login.service.LoginServiceInf;

@Controller
@RequestMapping("/admin")
public class MemberManageController {
	
	Logger logger = LoggerFactory.getLogger(MemberManageController.class);
	
	@Resource(name = "memberService")
	private MemberServiceInf memberService;
	
	@Resource(name = "loginService")
	private LoginServiceInf loginService;
	
	/**  
	* Method   :  memberList
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 : 회원 목록 출력
	*/
	@RequestMapping("/member")
	public String memberList(Model model, ManagementVo managementVo) {
		PageVO pageVo = new PageVO();
		pageVo.setPage(1);
		pageVo.setPageSize(10);
		Map<String, Object> resultMap = memberService.selectUserPageList(pageVo);
		model.addAllAttributes(resultMap);
		
		return "memberList";
	}
	
	/**  
	* Method   :  userPageListAjax
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 : 회원 목록 페이징처리
	*/
	@RequestMapping("/userPageListAjax")
	public String userPageListAjax(Model model, PageVO pageVo) {
		Map<String, Object> resultMap = memberService.selectUserPageList(pageVo);
		model.addAllAttributes(resultMap);
		
		return "jsonView";
	}
	
	/**  
	* Method   :  memberList
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 : 회원 신고처리
	*/
	@RequestMapping(value="/declaration", method = {RequestMethod.POST})
	public String declaration(Model model, MemberVo memberVo) {
		// 페이징 처리
		PageVO pageVo = new PageVO();
		pageVo.setPage(1);
		pageVo.setPageSize(10);
		Map<String, Object> resultMap = memberService.selectUserPageList(pageVo);
		// 신고처리
		int member = loginService.declaration(memberVo);
		
		return "redirect:/admin/member";
	}
}
