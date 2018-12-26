package kr.co.opensise.admin.manage.member.service;

import java.util.List;

import kr.co.opensise.admin.manage.member.model.ManagementVo;

public interface MemberServiceInf {
	
	
	/**  
	* Method   : memberList 
	* 작성자 :  김주연
	* 변경이력 :  
	* @param 
	* @return  
	* Method 설명 :  회원 리스트 출력
	*/
	public List<ManagementVo> memberList (ManagementVo managementVo);
}
