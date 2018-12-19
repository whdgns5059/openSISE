package kr.co.opensise.member.login.dao;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.opensise.member.Login.dao.LoginDaoInf;
import kr.co.opensise.member.Login.model.MemberVo;
import kr.co.opensise.member.encrypt.sha.KISA_SHA256;
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
	
	@Test
	public void memPassCheck() {
		String mem_email = "yooda97@naver.com";
		MemberVo memVo = loginDao.selectMember(mem_email);
		String encryptPass = KISA_SHA256.encrypt("1111");
		assertEquals(encryptPass, memVo.getMem_pass());
	}
	
	@Test
	public void memPassEncrypt() {
		Logger logger = LoggerFactory.getLogger(LoginDaoTest.class);
		String encryptPass = KISA_SHA256.encrypt("yooda97");
		logger.info(encryptPass);
		
	}

}
