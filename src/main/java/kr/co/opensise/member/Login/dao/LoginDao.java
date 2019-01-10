package kr.co.opensise.member.Login.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.opensise.admin.manage.member.model.PageVO;
import kr.co.opensise.member.Login.model.MemberVo;
import kr.co.opensise.member.Login.model.SteamVo;

@Repository
public class LoginDao implements LoginDaoInf{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	/**  
	* Method   :  selectMember
	* 작성자 :  김주연
	* 변경이력 :  
	* @param mem_email
	* @return  
	* Method 설명 : 오픈시세  암호화 및 로그인
	*/
	@Override
	public MemberVo selectMember(String mem_email) {
		MemberVo user = template.selectOne("member.selectAllMember", mem_email);
		return user;
	}
	
	@Override
	public int kakao(MemberVo memberVo) {
		int kakaoLogin = template.insert("member.kakao", memberVo);
		return kakaoLogin;
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
		int signUpselection = template.insert("member.signUpSelection", memberVo); 
		System.out.println("signUpselection : " + signUpselection);
		return signUpselection;
	}
		
		/**
		 * Method : check_nm 
		 * 작성자 : 김주연
		 * 변경이력 :
		 * @param mem_nm
		 * @return Method 설명 : 회원가입(닉네임 중복검사)
		 */
		@Override
		public int check_nm(String mem_nm) {
			int chk_nm = template.selectOne("member.check_nm", mem_nm);
			return chk_nm;
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
			int chk_email = template.selectOne("member.check_mail", mem_email);
			return chk_email;
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
		List<MemberVo> memberJob = template.selectList("member.job");
		return memberJob;
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
		List<MemberVo> interestList = template.selectList("member.interest");
		return interestList;
	}
	
	
	@Override
	public List<MemberVo> interestInsert(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	
	@Override
	public int delete() {
		int deleteCnt = template.delete("member.delete");
		return deleteCnt;
	}

	

	/**  
	* Method   : searchUser 
	* 작성자 : 김주연 
	* 변경이력 :  
	* @param mem_email
	* @return  
	* Method 설명 :  회원 한 사람의 정보를 출력
	*/
	@Override
	public MemberVo searchUser(String mem_email) {
		MemberVo member = template.selectOne("member.selectMember", mem_email);
		System.out.println("member : " + member.getMem_email());
		return member;
	}
	
	
	/**  
	* Method   : searchUser 
	* 작성자 : 김주연 
	* 변경이력 :  
	* @param mem_email
	* @return  
	* Method 설명 :  회원 한 사람의 정보 수정
	*/
	@Override
	public int myInfoUpdate(MemberVo memberVo) {
		// TODO Auto-generated method stub
		int updateMemCnt = template.update("member.updateUser", memberVo);
		
		return updateMemCnt;
	}

	
	/**  
	* Method   : interestLiset 
	* 작성자 :  김주연
	* 변경이력 :  
	* @param 
	* @return  
	* Method 설명 :  찜 리스트 출력
	*/
	@Override
	public List<SteamVo> steamList(int favor_mem) {
		List<SteamVo> steam = template.selectList("member.steam", favor_mem);
		return steam;
	}
	
	
	/**  
	* Method   : steamListUpdate 
	* 작성자 :  김주연
	* 변경이력 :  
	* @param 
	* @return  
	* Method 설명 :  찜 리스트 삭제
	*/
	@Override
	public int steamListUpdate(int favor_no) {
		int steamUpdate = template.delete("member.favorDelete", favor_no);
		return steamUpdate;
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
	public int memDelete(MemberVo memberVo) {
		int memberDelete = template.update("member.memDelete", memberVo);
		return memberDelete;
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
		int passChange = template.update("member.passChange", memberVo);
		return passChange;
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
		int mailFinsh = template.update("member.mailFinsh", memberVo);
		return mailFinsh;
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
		int declaration = template.update("member.declaration", memberVo);
		return declaration;
	}


	

	

	

	
	

	
	
		
}

































