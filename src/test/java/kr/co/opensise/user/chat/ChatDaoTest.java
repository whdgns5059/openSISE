package kr.co.opensise.user.chat;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;

import kr.co.opensise.member.Login.model.MemberVo;
import kr.co.opensise.setup.RootSetup;
import kr.co.opensise.user.chat.dao.ChatDaoInf;

public class ChatDaoTest extends RootSetup{

	@Resource(name="chatDao")
	private ChatDaoInf chatDao;
	
	@Test
	public void selectMemberByNoTest() {
		/***given***/
		int mem_no = 1;
		
		/***when***/
		MemberVo memberVo = chatDao.selectMember(mem_no);
		

		/***then***/
		assertEquals(1, memberVo.getMem_no());
	}

}
