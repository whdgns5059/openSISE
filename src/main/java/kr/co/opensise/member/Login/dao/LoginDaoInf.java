package kr.co.opensise.member.Login.dao;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.co.opensise.member.Login.model.MemberVo;

public interface LoginDaoInf {

	/**  
	* Method   :  
	* 작성자 :  
	* 변경이력 :  
	* @return  
	* Method 설명 : 오픈시세  암호화 및 로그인
	*/
	public MemberVo selectMember(String mem_email);
	
	
	/**
	 * Method : updateUser 
	 * 작성자 : 
	 * 변경이력 :
	 * 
	 * @param UserVo
	 * @return Method 설명 : 회원가입
	 */
	public int signup(MemberVo memberVo);
	
	
	
	
	/**
	 * Method : updateUser 
	 * 작성자 : 
	 * 변경이력 :
	 * 
	 * @param UserVo
	 * @return Method 설명 : 회원가입(닉네임 중복검사)
	 */
	public int check_nm(String mem_nm);
	
	
			
	
	
	/**  
	* Method   : jobList 
	* 작성자 :  
	* 변경이력 :  
	* @param memberVo
	* @return  
	* Method 설명 :  직업종류 출력
	*/
	public List<MemberVo> jobList();
		
<<<<<<< HEAD
		/**  
		* Method   : interestLiset 
		* 작성자 :  
		* 변경이력 :  
		* @param memberVo
		* @return  
		* Method 설명 :  관심사 리스트 출력
		*/
		public List<MemberVo> interestLiset();
		
		
=======
	/**  
	* Method   : interestLiset 
	* 작성자 :  
	* 변경이력 :  
	* @param memberVo
	* @return  
	* Method 설명 :  관심사 리스트 출력
	*/
	public List<MemberVo> interestLiset();
	
	
	public int delete();
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
>>>>>>> 5cda5841165b6fcc8fe4e542c53de1af3ff075af
}
