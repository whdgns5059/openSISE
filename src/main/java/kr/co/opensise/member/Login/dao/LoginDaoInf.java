package kr.co.opensise.member.Login.dao;

import kr.co.opensise.member.Login.model.MemberVo;

public interface LoginDaoInf {

	/**
	 * Method : searchUser 
	 * �ۼ��� : 
	 * �����̷� :
	 * 
	 * @param userId
	 * @return Method ���� : ȸ�� �� ����� ������ ���
	 */
	public MemberVo selectMember(String MEM_EMAIL);
	
}
