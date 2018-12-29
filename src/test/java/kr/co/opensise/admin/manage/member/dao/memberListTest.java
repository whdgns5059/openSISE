package kr.co.opensise.admin.manage.member.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.co.opensise.admin.manage.member.model.ManagementVo;
import kr.co.opensise.setup.RootSetup;

public class memberListTest extends RootSetup {

	@Resource
	private MemberDaoInf memberDao; 
	
	@Test
	public void test() {
		ManagementVo manageVo = new ManagementVo();
		
		List<ManagementVo> memList = memberDao.memberList(manageVo);
		assertEquals("", memList.get(0).getJob_nm());
	}

}
