package kr.co.opensise.admin.manage.datatrade.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.setup.RootSetup;

public class DataTradeDaoTest extends RootSetup{

	private Logger log = LoggerFactory.getLogger(DataTradeDaoTest.class);
	
	@Resource(name="dataTradeDao")
	private DataTradeDaoInf dataTradeDao;
	
	@Test
	public void selectCoordNullArticleTest() {
		
		/***given***/
		
		/***when***/
		List<ArticleVo> articleList =dataTradeDao.selectCoordNullArticle();

		/***then***/
		assertEquals(2, articleList.size());
		
	}
	
	@Test
	public void updateLatLngArticle() {
		
		/***given***/
		List<ArticleVo> nullList = dataTradeDao.selectCoordNullArticle();
		int result = 0;
		/***when***/


		for(ArticleVo aVo : nullList) {
			log.info(aVo.toString());
			aVo.setArtcl_lat("30");
			aVo.setArtcl_lng("120");
			log.info(aVo.toString());

			result += dataTradeDao.updataLatLngArticle(aVo);
		}
		/***then***/
		assertEquals(2, result);
	}

}
