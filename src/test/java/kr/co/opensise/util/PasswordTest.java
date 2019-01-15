package kr.co.opensise.util;

import static org.junit.Assert.*;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.opensise.member.encrypt.sha.KISA_SHA256;

public class PasswordTest {

	Logger logger = LoggerFactory.getLogger(PasswordTest.class);
	
	@Test
	public void test() {
		String pass = "1234";
		String encryptPass = KISA_SHA256.encrypt("111");
		
		logger.info("encryptPass : "+ encryptPass);
		
		assertEquals("f6e0a1e2ac41945a9aa7ff8a8aaacebc12a3bcc981a929ad5cf81a9e11ae", "f6e0a1e2ac41945a9aa7ff8a8aaacebc12a3bcc981a929ad5cf81a9e11ae");
	}

}
