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
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param userId
	* @return  
	* Method 설명 :  회원 한명의 정보 출력
	*/
	@Override
	public MemberVo selectMember(String mem_email) {
		// TODO Auto-generated method stub
		return loginDao.selectMember(mem_email);
	}
}
