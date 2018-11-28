package kr.co.opensise.setup;

import static org.junit.Assert.*;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:kr/co/opensise/spring/root-context.xml"})
public class RootSetup {

	@Ignore
	@Test
	public void test() {
		fail("Not yet implemented");
	}

}
