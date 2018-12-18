package kr.co.opensise.member.login.dao;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;

import kr.co.opensise.member.Login.dao.LoginDaoInf;
import kr.co.opensise.member.Login.model.MemberVo;
import kr.co.opensise.setup.RootSetup;

public class LoginDaoTest extends RootSetup{

	@Resource(name="loginDao")
	private LoginDaoInf loginDao;
	
	@Test
	public void memDeleteTest() {
		
		MemberVo memVo = new MemberVo();
		memVo.setMem_email("yooda978@naver.com");
		memVo.setMem_pass("yooda978");
		
		int result = loginDao.memDelete(memVo);
		
		assertEquals(1, result);
		
	}

}
