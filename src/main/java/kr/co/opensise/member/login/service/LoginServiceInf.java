package kr.co.opensise.member.Login.service;

import kr.co.opensise.member.Login.model.MemberVo;

public interface LoginServiceInf {

	/**  
	* Method   : searchUser 
	* �ۼ��� : ���ֿ�
	* �����̷� :  
	* @param MEM_EMAIL
	* @return  
	* Method ���� :  ȸ�� �� ����� ������ ���
	*/
	public MemberVo selectMember(String mem_email);
}
