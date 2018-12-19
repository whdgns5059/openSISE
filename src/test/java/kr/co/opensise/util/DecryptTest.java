package kr.co.opensise.util;

import static org.junit.Assert.*;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.opensise.member.encrypt.seed.KISA_SEED_CBC;
import kr.co.opensise.member.encrypt.sha.KISA_SHA256;

public class DecryptTest {
	Logger logger = LoggerFactory.getLogger(DecryptTest.class);
	
	@Test
	public void decryptTest() {
		String password = "1234";
		//String encrypt = KISA_SHA256.encrypt(password);
		String seedEncrypt = KISA_SEED_CBC.Encrypt(password);
		String decrypt = KISA_SEED_CBC.Decrypt(seedEncrypt);
		
		logger.info(decrypt);
		
	}

}
