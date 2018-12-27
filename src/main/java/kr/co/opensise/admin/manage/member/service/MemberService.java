package kr.co.opensise.admin.manage.member.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.opensise.admin.manage.member.dao.MemberDaoInf;
import kr.co.opensise.admin.manage.member.model.ManagementVo;

@Service
public class MemberService implements MemberServiceInf{

	@Resource(name="memberDao")
	private MemberDaoInf memberDao;

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
		// TODO Auto-generated method stub
		return memberDao.memberList(managementVo);
	}
}
