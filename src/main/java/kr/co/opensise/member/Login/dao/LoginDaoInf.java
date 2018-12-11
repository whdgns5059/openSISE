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
	
	/**  
	* Method   : ageList 
	* 작성자 :  김주연
	* 변경이력 :  
	* @param 
	* @return  
	* Method 설명 :  연령대 출력
	
		public List<MemberVo> ageList();
	*/	
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
	
	

	/**  
	* Method   : searchUser 
	* 작성자 : 김주연 
	* 변경이력 :  
	* @param mem_email
	* @return  
	* Method 설명 :  회원 한 사람의 정보를 출력
	
	public MemberVo searchUser(String mem_email);
	*/
}
