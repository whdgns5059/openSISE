package kr.co.opensise.admin.manage.datatrade.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;
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
	
	@Test
	public void deleteDeal() {
		/***given***/
		DealVo dealVo = new DealVo();
		dealVo.setDl_gu("서구");
		dealVo.setDl_dong("관저동");
		dealVo.setDl_zip("999");
		dealVo.setDl_rd("관저북로");
		
		/***when***/
		int result = dataTradeDao.deleteDeal(dealVo);
		
		
		/***then***/
		assertEquals(1, result);
	}

	@Test
	public void deleteArticle() {
		/***given***/
		ArticleVo articleVo = new ArticleVo();
		articleVo.setArtcl_gu("서구");
		articleVo.setArtcl_dong("관저동");
		articleVo.setArtcl_zip("999");
		articleVo.setArtcl_rd("관저북로");
		/***when***/
		int result = dataTradeDao.deleteArticle(articleVo);

		/***then***/
		assertEquals(1, result);
	}
	
}
