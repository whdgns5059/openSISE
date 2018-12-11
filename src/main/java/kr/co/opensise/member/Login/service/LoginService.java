package kr.co.opensise.member.Login.service;

import java.util.List;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.opensise.member.Login.dao.LoginDaoInf;
import kr.co.opensise.member.Login.model.MemberVo;

@Service
public class LoginService implements LoginServiceInf{

	@Resource(name="loginDao")
	private LoginDaoInf loginDao ;
	
	/**  
	* Method   :  selectMember
	* 작성자 :  김주연
	* 변경이력 :  
	* @param  mem_email
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
	* 작성자 :  김주연
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
	 * Method : check_nm 
	 * 작성자 : 김주연
	 * 변경이력 :
	 * 
	 * @param mem_nm
	 * @return 
	 * Method 설명 : 회원가입(닉네임 중복검사)
	 */
	@Override
	public int check_nm(String mem_nm) {
		// TODO Auto-generated method stub
		return loginDao.check_nm(mem_nm);
	}

	/**  
	* Method   : jobList 
	* 작성자 :  김주연
	* 변경이력 :  
	* @param 
	* @return  
	* Method 설명 :  직업종류 출력
	*/
	@Override
	public List<MemberVo> jobList() {
		return loginDao.jobList();
	}

	/**  
	* Method   : ageList 
	* 작성자 :  김주연
	* 변경이력 :  
	* @param 
	* @return  
	* Method 설명 :  연령대 출력
	
		public List<MemberVo> ageList(){
			return loginDao.ageList();
		}
	*/
	/**  
	* Method   : interestLiset 
	* 작성자 :  김주연
	* 변경이력 :  
	* @param 
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
	* 작성자 :  김주연
	* 변경이력 :  
	* @param 
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

	/**  
	* Method   : searchUser 
	* 작성자 :  김주연
	* 변경이력 :  
	* @param 
	* @return  
	* Method 설명 :  회원 한명의 정보 출력
	
	public MemberVo searchUser(String mem_email) {
		// TODO Auto-generated method stub
		return loginDao.searchUser(mem_email);
	}
	*/
}
