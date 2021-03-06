package kr.co.opensise.member.Login.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.opensise.member.Login.dao.LoginDaoInf;
import kr.co.opensise.member.Login.model.MemberVo;
import kr.co.opensise.member.Login.model.SteamVo;

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

	
	@Override
	public int kakao(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return loginDao.kakao(memberVo);
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
	* Method   : signup 
	* 작성자 :  김주연
	* 변경이력 :  
	* @param memberVo
	* @return  
	* Method 설명 :  회원가입
	*/
	@Override
	public int inter(MemberVo memberVo) {
		return loginDao.inter(memberVo);
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
	 * Method : check_mail 
	 * 작성자 : 김주연
	 * 변경이력 :
	 * 
	 * @param mem_email
	 * @return 
	 * Method 설명 : 회원가입(이메일 중복검사)
	 */
	@Override
	public int check_mail(String mem_email) {
		// TODO Auto-generated method stub
		return loginDao.check_mail(mem_email);
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
	* Method   : interestLiset 
	* 작성자 :  김주연
	* 변경이력 :  
	* @param 
	* @return  
	* Method 설명 : 회원가입시 관심사 리스트 출력
	*/
	@Override
	public List<MemberVo> interestLiset() {
		// TODO Auto-generated method stub
		return loginDao.interestLiset();
	}
	
	/**  
	* Method   : interestInsert 
	* 작성자 :  김주연
	* 변경이력 :  
	* @param 
	* @return  
	* Method 설명 : 회원가입시 관심사 등록
	*/
	@Override
	public List<MemberVo> interestInsert(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return loginDao.interestInsert(memberVo);
	}
	

	/**  
	* Method   : searchUser 
	* 작성자 :  김주연
	* 변경이력 :  
	* @param 
	* @return  
	* Method 설명 :  회원 한명의 정보 출력
	*/
	public MemberVo searchUser(String mem_email) {
		return loginDao.searchUser(mem_email);
	}
	
	
	/**  
	* Method   : searchUser 
	* 작성자 :  김주연
	* 변경이력 :  
	* @param 
	* @return  
	* Method 설명 :  회원 한명의 정보 수정
	*/
		@Override
		public int myInfoUpdate(MemberVo memberVo) {
			// TODO Auto-generated method stub
			return loginDao.myInfoUpdate(memberVo);
		}

		
		/**  
		* Method   : searchUser 
		* 작성자 :  김주연
		* 변경이력 :  
		* @param favor_mem
		* @return  
		* Method 설명 :  찜리스트 출력
		*/
	@Override
	public List<SteamVo> steamList(int favor_mem) {
		// TODO Auto-generated method stub
		return loginDao.steamList(favor_mem);
	}
	
	/**  
	* Method   : steamListUpdate 
	* 작성자 : 김주연 
	* 변경이력 :  
	* @param favor_no
	* @return  
	* Method 설명 :  찜리스트 삭제
	*/
	public int steamListUpdate(int favor_no) {
		return loginDao.steamListUpdate(favor_no);
	}

	
	/**  
	* Method   :  
	* 작성자 : 김주연 
	* 변경이력 :  
	* @param 
	* @return  
	* Method 설명 :  보안설정(비밀번호 변경)
	* */
	@Override
	public int passChange(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return loginDao.passChange(memberVo);
	}	
	
	/**  
	* Method   :  
	* 작성자 : 김주연 
	* 변경이력 :  
	* @param 
	* @return  
	* Method 설명 :  회원탈퇴
	*/
	@Override
	public int memDelete(MemberVo memverVo) {
		// TODO Auto-generated method stub
		return loginDao.memDelete(memverVo);
	}

	
	/**  
	* Method   :  
	* 작성자 : 김주연 
	* 변경이력 :  
	* @param 
	* @return  
	* Method 설명 :  비밀번호 찾기
	* */
	public int mailFinsh(MemberVo memberVo) {
		return loginDao.mailFinsh(memberVo);
	}

	/**  
	* Method   :  
	* 작성자 : 김주연 
	* 변경이력 :  
	* @param 
	* @return  
	* Method 설명 :  신고요청에따른 신고처리
	* */
	@Override
	public int declaration(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return loginDao.declaration(memberVo);
	}
	
}
