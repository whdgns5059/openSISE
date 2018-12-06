package kr.co.opensise.member.Login.dao;

import kr.co.opensise.member.Login.model.MemberVo;

public interface LoginDaoInf {

	/**
	 * Method : searchUser 
	 * 작성자 : 
	 * 변경이력 :
	 * 
	 * @param userId
	 * @return Method 설명 : 회원 한 사람의 정보를 출력
	 */
	public MemberVo selectMember(String MEM_EMAIL);
	
}
