package kr.co.opensise.admin.manage.member.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.opensise.admin.manage.member.model.ManagementVo;
import kr.co.opensise.admin.manage.member.model.PageVO;
import kr.co.opensise.admin.manage.member.service.MemberServiceInf;

@Controller
@RequestMapping("/admin")
public class MemberManageController {
	
	Logger logger = LoggerFactory.getLogger(MemberManageController.class);
	
	@Resource(name = "memberService")
	private MemberServiceInf memberService;
	
	
	/**  
	* Method   :  memberList
	* 작성자 :  김주연
	* 변경이력 :  
	* @return  
	* Method 설명 : 회원 목록 출력
	*/
	@RequestMapping("/member")
	public String memberList(Model model, ManagementVo managementVo) {
		List<ManagementVo> mamagement = memberService.memberList(managementVo);
		model.addAttribute("memberList", mamagement);
		
		PageVO pageVo = new PageVO();
		pageVo.setPage(1);
		pageVo.setPageSize(10);
		Map<String, Object> resultMap = memberService.selectUserPageList(pageVo);
		logger.info("map-userPageList : " + resultMap.get("pageUserList"));
		logger.info("map-pageCnt : " + resultMap.get("pageCnt"));
		model.addAllAttributes(resultMap);
		
		return "memberList";
	}
	
	
	@RequestMapping("/userPageListAjax")
	public String userPageListAjax(Model model, PageVO pageVo) {
		
		Map<String, Object> resultMap = memberService.selectUserPageList(pageVo);
		logger.info("map-userPageList : " + resultMap.get("pageUserList"));
		logger.info("map-pageCnt : " + resultMap.get("pageCnt"));
		model.addAllAttributes(resultMap);
		

		//servlet-context.xml에 json resolve로 매핑
		return "jsonView";
	}
	
	

}
