package kr.co.opensise.admin.manage.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.opensise.admin.manage.member.dao.MemberDaoInf;
import kr.co.opensise.admin.manage.member.model.ManagementVo;
import kr.co.opensise.admin.manage.member.model.PageVO;

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
	
	

	@Override
	public Map<String, Object> selectUserPageList(PageVO page) {
		// TODO Auto-generated method stub
		// 페이지에 해당하는 유저 리스트(1~10건사이)
		List<ManagementVo> userList = memberDao.selectUserPageList(page);

		// 페이지 내비게이션을 위한 전체 유저 리스트 조회
		int totalUserCnt = memberDao.getUserCnt();

		// 결과를 담는 map
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("pageUserList", userList);
		resultMap.put("pageCnt", (int) Math.ceil((double) totalUserCnt / page.getPageSize()));

		return resultMap;
	}
}
