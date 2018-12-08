package kr.co.opensise.member.Login.service;

import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import kr.co.opensise.member.Login.dao.LoginDaoInf;
import kr.co.opensise.member.Login.model.MemberVo;

@Service
public class LoginService implements LoginServiceInf{

	@Resource(name="loginDao")
	private LoginDaoInf loginDao ;
	
	/**  
	* Method   :  
	* 작성자 :  
	* 변경이력 :  
	* @return  
	* Method 설명 : 오픈시세  암호화 및 로그인
	*/
	@Override
	public MemberVo selectMember(String mem_email) {
		// TODO Auto-generated method stub
		return loginDao.selectMember(mem_email);
	}

	/**  
	* Method   : signup 
	* 작성자 :  
	* 변경이력 :  
	* @param memberVo
	* @return  
	* Method 설명 :  회원가입
	*/
	@Override
	public int signup(MemberVo memberVo) {
		return loginDao.signup(memberVo);
	}
	

	/**
	 * Method : updateUser 
	 * 작성자 : 
	 * 변경이력 :
	 * 
	 * @param UserVo
	 * @return Method 설명 : 회원가입(닉네임 중복검사)
	 */
	@Override
	public int check_nm(String mem_nm) {
		// TODO Auto-generated method stub
		return loginDao.check_nm(mem_nm);
	}

	/**  
	* Method   : jobList 
	* 작성자 :  
	* 변경이력 :  
	* @param memberVo
	* @return  
	* Method 설명 :  직업종류 출력
	*/
	@Override
	public List<MemberVo> jobList() {
		return loginDao.jobList();
	}

	
	/**  
	* Method   : interestLiset 
	* 작성자 :  
	* 변경이력 :  
	* @param memberVo
	* @return  
	* Method 설명 :  관심사 리스트 출력
	*/
	@Override
	public List<MemberVo> interestLiset() {
		// TODO Auto-generated method stub
		return loginDao.interestLiset();
	}

	/**  
	* Method   : create_key 
	* 작성자 :  
	* 변경이력 :  
	* @param memberVo
	* @return  
	* Method 설명 :  회원가입 메일인증키 
	*/
	@Override
	public String create_key() {
		String key = "";
		Random rd = new Random();

		for (int i = 0; i < 8; i++) {
			key += rd.nextInt(10);
		}
		return key;
	}


	
}
