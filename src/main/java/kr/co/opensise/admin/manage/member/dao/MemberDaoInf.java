package kr.co.opensise.admin.manage.member.dao;

import java.util.List;

import kr.co.opensise.admin.manage.member.model.ManagementVo;
import kr.co.opensise.admin.manage.member.model.PageVO;

public interface MemberDaoInf {
	
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
	public List<ManagementVo> selectUserPageList(PageVO page);
	
	/**  
	* Method   : getUserCnt 
	* 작성자 : 김주연 
	* 변경이력 :  
	* @return  
	* Method 설명 : 사용자 전체 건수 조회 
	*/
	int getUserCnt();
}
