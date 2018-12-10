package kr.co.opensise.admin.statis.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.opensise.admin.statis.model.MemberVo;
import kr.co.opensise.setup.RootSetup;
import kr.co.opensise.util.CommonUtilTest;

public class InsertMemTest extends RootSetup{
	private Logger log = LoggerFactory.getLogger(CommonUtilTest.class);

	@Resource(name="statisDao")
	private StatisDao statisDao;
	
	@Test
	public void signInDaily() {
		List<MemberVo> memVoList = statisDao.signInDaily();
		log.info("memVoList : {}", memVoList);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
