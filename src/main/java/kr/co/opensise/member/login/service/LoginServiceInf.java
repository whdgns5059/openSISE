package kr.co.opensise.member.Login.service;

import kr.co.opensise.member.Login.model.MemberVo;

public interface LoginServiceInf {

	/**  
	* Method   : searchUser 
	* 작성자 : 김주연
	* 변경이력 :  
	* @param MEM_EMAIL
	* @return  
	* Method 설명 :  회원 한 사람의 정보를 출력
	*/
	public MemberVo selectMember(String mem_email);
}
