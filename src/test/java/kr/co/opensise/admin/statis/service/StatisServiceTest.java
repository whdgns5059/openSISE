package kr.co.opensise.admin.statis.service;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.opensise.admin.statis.model.MemberVo;
import kr.co.opensise.admin.statis.model.Page_statisticVo;
import kr.co.opensise.admin.statis.model.VisitorVo;
import kr.co.opensise.setup.RootSetup;
import kr.co.opensise.util.CommonUtilTest;

public class StatisServiceTest extends RootSetup{
	private Logger log = LoggerFactory.getLogger(CommonUtilTest.class);

	@Resource(name="statisService")
	private StatisServiceInf statisService;
	
	
	@Test
	public void signInAgeGndr() {
		Map<String, List<MemberVo>> memVoAgeGndr = statisService.signInAgeGndr();
		
		for(MemberVo memVo : memVoAgeGndr.get("M")) {
			log.info("memVo : {}",memVo);
		}
	}
	
	@Test
	public void insertPS() {
		/***Given***/
		Map<String, Page_statisticVo> uriCounts = new HashMap<String, Page_statisticVo>();
		//uriCounts.put("/main/main", new Page_statisticVo("메인페이지", "/main/main", 2));
		//uriCounts.put("/detail/info", new Page_statisticVo("건물상세", "/detail/info", 3));

		/***When***/
		int insertCnt = statisService.insertPS(uriCounts);

		/***Then***/
		assertEquals(0, insertCnt);
		
	}
	
	
	
	
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	


