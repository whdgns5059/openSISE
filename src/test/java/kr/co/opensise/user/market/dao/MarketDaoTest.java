package kr.co.opensise.user.market.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.opensise.admin.manage.dataetc.model.MarketDetailVo;
import kr.co.opensise.setup.RootSetup;

public class MarketDaoTest extends RootSetup{

	private Logger log = LoggerFactory.getLogger(MarketDaoTest.class);
	
	@Resource(name="marketDao")
	private MarketDaoInf marketDao;
	
	@Test
	public void selectAvgMkdTest() {
		
		/***given***/
		String dong = "노은";

		/***when***/
		List<MarketDetailVo> mkd_list = marketDao.selectAvgMkd(dong);

		/***then***/
		for(MarketDetailVo mkd : mkd_list) {
			
			log.info(mkd.toString());
			
		}
		
		assertEquals(2, mkd_list.size());
		
	}
	
	@Test
	public void selectMkdTest() {
	
		/***given***/
		String dong = "월평";
		/***when***/
		List<MarketDetailVo> mkd_list = marketDao.selectMkd(dong);

		/***then***/
		assertEquals(30, mkd_list.size());
		
	}

}
