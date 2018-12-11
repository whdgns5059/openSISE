package kr.co.opensise.member.Login.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.opensise.member.Login.model.MemberVo;

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
	* Method 설명 :  관심사 리스트 출력
	*/
	@Override
	public List<MemberVo> interestLiset() {
		List<MemberVo> interestLiset = template.selectList("member.interest");		
		return interestLiset;
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
		return member;
	}
	
	
	
	
	
	
	
	
	
	
	
		
		
		
		
}

































