package kr.co.opensise.admin.manage.member.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.opensise.admin.manage.member.model.ManagementVo;
import kr.co.opensise.admin.manage.member.model.PageVO;
import kr.co.opensise.admin.manage.review.model.ReviewVo;

@Repository
public class MemberDao implements MemberDaoInf{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	/**  
	* Method   : memberList 
	* 작성자 :  김주연
	* 변경이력 :  
	* @param 
	* @return  
	* Method 설명 :  회원 리스트 출력
	*/
	@Override
	public List<ManagementVo> memberList(ManagementVo managementVo) {
		List<ManagementVo> memberList = template.selectList("admin.memberList", managementVo);
		return memberList;
	}
	
	/**  
	* Method   : getUserCnt 
	* 작성자 : 김주연
	* 변경이력 :  
	* @return  
	* Method 설명 : 회원리스트 페이징처리
	*/
	@Override
	public List<ManagementVo> selectUserPageList(PageVO page){
		List<ManagementVo> pageUserList = template.selectList("admin.selectUsrPageList", page);
		
		return pageUserList;
	}
	
	/**  
	* Method   : getUserCnt 
	* 작성자 : 김주연
	* 변경이력 :  
	* @return  
	* Method 설명 : 회원 전체 건수 조회 
	*/
	@Override
	public int getUserCnt() {
		int cntUserList = template.selectOne("admin.getUserCnt");
		return cntUserList;
	}

	
	/**  
	* Method   : selectUser 
	* 작성자 :  김주연
	* 변경이력 :  
	* @param 
	* @return  
	* Method 설명 :  회원 상세조회
	*/
	@Override
	public ManagementVo selectUser(String mem_email) {
		ManagementVo member = (ManagementVo)template.selectOne("admin.selectUser", mem_email);
		return member;
	}
	
	/**  
	* Method   : selectUser 
	* 작성자 :  김주연
	* 변경이력 :  
	* @param 
	* @return  
	* Method 설명 :  회원 분류검색
	*/
	@Override
	public List<ManagementVo> memberList(Map<String, String> member) {
		// TODO Auto-generated method stub
		return template.selectList("admin.selectMember", member);
	}
	
	//@Override
	//public List<ReviewVo> cateReviewList(Map<String, String> searchMap) {
		// TODO Auto-generated method stub
	//	return template.selectList("review.cateSearchList", searchMap);
	//}

	
	
	
	
	
}
