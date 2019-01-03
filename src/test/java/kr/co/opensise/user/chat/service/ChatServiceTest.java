package kr.co.opensise.user.chat.service;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;

import kr.co.opensise.member.Login.model.MemberVo;
import kr.co.opensise.setup.RootSetup;

public class ChatServiceTest extends RootSetup{

	@Resource(name="chatService")
	private ChatServiceInf chatService;

	@Test
	public void selectMemberByNoTest() {
		/***given***/
		int mem_no = 1;
		
		/***when***/
		MemberVo memberVo = chatService.selectMember(mem_no);
		

		/***then***/
		assertEquals(1, memberVo.getMem_no());
	}
}
