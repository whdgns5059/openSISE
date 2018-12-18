package kr.co.opensise.member.Login.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import kr.co.opensise.member.Login.model.MemberVo;
import kr.co.opensise.member.Login.model.SteamVo;

public interface LoginServiceInf {

	/**  
	* Method   :  selectMember
	* 작성자 :  김주연
	* 변경이력 :  
	* @param mem_email
	* @return  
	* Method 설명 : 오픈시세  암호화 및 로그인
	*/
	public MemberVo selectMember(String mem_email);
	
	/**  
	* Method   : signup 
	* 작성자 :  김주연
	* 변경이력 :  
	* @param memberVo
	* @return  
	* Method 설명 :  회원가입
	*/
	public int signup(MemberVo memberVo);
	
	
	/**
	 * Method : check_nm 
	 * 작성자 : 김주연
	 * 변경이력 :
	 * @param mem_nm
	 * @return Method 설명 : 회원가입(닉네임 중복검사)
	 */
	public int check_nm(String mem_nm);
	
	/**  
	* Method   : create_key 
	* 작성자 :  김주연
	* 변경이력 :  
	* @param 
	* @return  
	* Method 설명 :  회원가입 메일인증키 
	*/
	public String create_key();
	
	
	/**  
	* Method   : jobList 
	* 작성자 :  김주연
	* 변경이력 :  
	* @param 
	* @return  
	* Method 설명 :  직업종류 출력
	*/
		public List<MemberVo> jobList();
		
		
		/**  
		* Method   : interestLiset 
		* 작성자 :  김주연
		* 변경이력 :  
		* @param 
		* @return  
		* Method 설명 :  회원가입시 관심사 리스트 출력
		*/
		public List<MemberVo> interestLiset();
		
		/**  
		* Method   : searchUser 
		* 작성자 : 김주연 
		* 변경이력 :  
		* @param mem_email
		* @return  
		* Method 설명 :  회원 한 사람의 정보를 출력
		*/
		public MemberVo searchUser(String mem_email);
		
		
		/**  
		* Method   : updateMember 
		* 작성자 : 김주연 
		* 변경이력 :  
		* @param mem_email
		* @return  
		* Method 설명 :  회원 한 사람 정보 수정
		*/
		public int myInfoUpdate(MemberVo memberVo);

		
		/**  
		* Method   : updateMember 
		* 작성자 : 김주연 
		* 변경이력 :  
		* @param mem_email
		* @return  
		* Method 설명 :  찜리스트 출력
		*/
		public List<SteamVo> steamList(int favor_mem);
		
		/**  
		* Method   : steamListUpdate 
		* 작성자 : 김주연 
		* 변경이력 :  
		* @param mem_email
		* @return  
		* Method 설명 :  찜리스트 삭제
		*/
		public int steamListUpdate(int favor_no); 
		
		
		/**  
		* Method   :  
		* 작성자 : 김주연 
		* 변경이력 :  
		* @param 
		* @return  
		* Method 설명 :  회원탈퇴
		* */
		public int memDelete(MemberVo memberVo);
		
		
}
