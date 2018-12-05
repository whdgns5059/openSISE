package kr.co.opensise.member.Login.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.opensise.member.Login.dao.LoginDaoInf;
import kr.co.opensise.member.Login.model.MemberVo;

@Service
public class LoginService implements LoginServiceInf{

	@Resource(name="loginDao")
	private LoginDaoInf loginDao ;
	
	/**  
	* Method   : searchUser 
	* �ۼ��� : 1003yd 
	* �����̷� :  
	* @param userId
	* @return  
	* Method ���� :  ȸ�� �Ѹ��� ���� ���
	*/
	@Override
	public MemberVo selectMember(String mem_email) {
		// TODO Auto-generated method stub
		return loginDao.selectMember(mem_email);
	}
}
