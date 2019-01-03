package kr.co.opensise.admin.manage.member.service;

import java.util.List;
import java.util.Map;

import kr.co.opensise.admin.manage.member.model.ManagementVo;
import kr.co.opensise.admin.manage.member.model.PageVO;
import kr.co.opensise.admin.manage.review.model.ReviewVo;

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
	
	/**  
	* Method   : memberList 
	* 작성자 :  김주연
	* 변경이력 :  
	* @param 
	* @return  
	* Method 설명 :  회원 리스트 출력
	*/
	public Map<String, Object> selectUserPageList(PageVO page);
	
	
	/**  
	* Method   : selectUser 
	* 작성자 :  김주연
	* 변경이력 :  
	* @param 
	* @return  
	* Method 설명 :  회원 상세조회
	*/
	public ManagementVo selectUser(String mem_email);
	
}
