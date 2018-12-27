package kr.co.opensise.admin.manage.member.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.opensise.admin.manage.member.model.ManagementVo;

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

}
