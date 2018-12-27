package kr.co.opensise.admin.manage.member.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.opensise.admin.manage.member.model.ManagementVo;
import kr.co.opensise.admin.manage.member.service.MemberServiceInf;

@Controller
@RequestMapping("/admin")
public class MemberManageController {
	
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
		System.out.println("???????" + mamagement);
		model.addAttribute("memberList", mamagement);
		
		return "memberList";
	}
	
	

}
