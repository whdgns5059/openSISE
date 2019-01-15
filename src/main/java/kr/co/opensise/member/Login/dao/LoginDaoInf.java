package kr.co.opensise.member.Login.dao;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.co.opensise.admin.manage.member.model.PageVO;
import kr.co.opensise.member.Login.model.MemberVo;
import kr.co.opensise.member.Login.model.SteamVo;

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
	* Method   : inter 
	* 작성자 :  김주연
	* 변경이력 :  
	* @param memberVo
	* @return  
	* Method 설명 :  관심사 등록
	*/
	public int inter(MemberVo memberVo);
	
	/**
	 * Method : updateUser 
	 * 작성자 : 
	 * 변경이력 :
	 * 
	 * @param UserVo
	 * @return Method 설명 : 카카오 회원 등록
	 */
	public int kakao(MemberVo memberVo);
	
	
	
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
	 * Method : check_mail 
	 * 작성자 : 김주연
	 * 변경이력 :
	 * @param mem_email
	 * @return Method 설명 : 회원가입(이메일 중복검사)
	 */
	public int check_mail(String mem_email);
	
	
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
	* Method   : interestLiset 
	* 작성자 :  
	* 변경이력 :  
	* @param memberVo
	* @return  
	* Method 설명 :  회원가입시 관심사 리스트 출력
	*/
	public List<MemberVo> interestLiset();
	
	
	/**  
	* Method   : interestInsert 
	* 작성자 :  김주연
	* 변경이력 :  
	* @param 
	* @return  
	* Method 설명 :  회원가입시 관심사 등록
		*/	
	public List<MemberVo> interestInsert(MemberVo memberVo);

	
	
	
	
	public int delete();
	
	

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
	* Method   : searchUser 
	* 작성자 : 김주연 
	* 변경이력 :  
	* @param mem_email
	* @return  
	* Method 설명 :  회원 한 사람의 정보 수정
	*/
	public int myInfoUpdate(MemberVo memberVo);
	
	/**  
	* Method   :  
	* 작성자 : 김주연 
	* 변경이력 :  
	* @param 
	* @return  
	* Method 설명 :  보안설정(비밀번호 변경)
	* */
	public int passChange(MemberVo memberVo);
	
	
	/**  
	* Method   :  
	* 작성자 : 김주연 
	* 변경이력 :  
	* @param 
	* @return  
	* Method 설명 :  회원탈퇴
	*/
	public int memDelete(MemberVo memberVo);
	
	
	/**  
	* Method   :  
	* 작성자 : 김주연 
	* 변경이력 :  
	* @param 
	* @return  
	* Method 설명 :  비밀번호 찾기
	* */
	public int mailFinsh(MemberVo memberVo);
	
	/**  
	* Method   :  
	* 작성자 : 김주연 
	* 변경이력 :  
	* @param 
	* @return  
	* Method 설명 :  신고요청에따른 신고처리
	* */
	public int declaration(MemberVo memberVo);


}
