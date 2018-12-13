package kr.co.opensise.user.detail.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;
import kr.co.opensise.setup.RootSetup;
import kr.co.opensise.user.detail.dao.DetailDaoInf;
import kr.co.opensise.user.detail.model.AvgTradeVo;

public class DetailDaoTest extends RootSetup{

	private Logger log = LoggerFactory.getLogger(DetailDaoTest.class);
	
	@Resource(name="detailDao")
	private DetailDaoInf detailDao;
	
	@Test
	public void selectArticleTest() {
		/***given***/
		ArticleVo articleVo = new ArticleVo();
		articleVo.setArtcl_gu("서구");
		articleVo.setArtcl_dong("월평동");
		articleVo.setArtcl_zip("311-1");
		articleVo.setArtcl_rd("청사로");
		
		/***when***/
		ArticleVo result = detailDao.selectArticle(articleVo);
		log.info(result.toString());
		/***then***/
		assertEquals("36.360773619481314", result.getArtcl_lat());
	}
	
	@Test
	public void selectDealListTest() {
		/***given***/
		DealVo dealVo = new DealVo();
		dealVo.setDl_gu("서구");
		dealVo.setDl_dong("월평동");
		dealVo.setDl_zip("311-1");
		dealVo.setDl_rd("청사로");
		dealVo.setDl_ty("매매");
		
		/***when***/
		List<DealVo> result = detailDao.selectDealList(dealVo);
		
		for(DealVo dVo : result) {
			log.info(dVo.toString());
		}

		/***then***/
		assertEquals(7, result.size());
	}
	
	@Test
	public void selectAreasTest() {
		
		/***given***/
		ArticleVo articleVo = new ArticleVo();
		articleVo.setArtcl_gu("서구");
		articleVo.setArtcl_dong("월평동");
		articleVo.setArtcl_zip("311-1");
		articleVo.setArtcl_rd("청사로");
		
		/***when***/
		List<String> result = detailDao.selectAreas(articleVo);

		for(String str : result) {
			log.info("평수 : {}", str);
		}
		
		/***then***/
		assertEquals(2, result.size());
		
		
	}

	@Test
	public void selectAvgPriceTest() {
		
		/***given***/
		DealVo dealVo = new DealVo();
		dealVo.setDl_gu("서구");
		dealVo.setDl_dong("월평동");
		dealVo.setDl_zip("311-1");
		dealVo.setDl_rd("청사로");
		dealVo.setDl_ty("매매");
		dealVo.setDl_excv_area(59.76f);
		
		/***when***/
		AvgTradeVo avgTrade = detailDao.selectAvgPrice(dealVo);

		/***then***/
		assertEquals(16914.0, avgTrade.getAvg_price() , 1e-8);
		
	}
	
	@Test
	public void selectRecentTradeTest() {
		/***given***/
		DealVo dealVo = new DealVo();
		dealVo.setDl_gu("서구");
		dealVo.setDl_dong("월평동");
		dealVo.setDl_zip("311-1");
		dealVo.setDl_rd("청사로");
		dealVo.setDl_ty("매매");
		dealVo.setDl_excv_area(59.76f);
		/***when***/
		List<DealVo> recentDealVo = detailDao.selectRecentTrade(dealVo);
		
		/***then***/
		assertEquals(4, recentDealVo.size());
	}
	
	
	@Test
	public void selectDealListByArea() {
		
		/***given***/
		DealVo dealVo = new DealVo();
		dealVo.setDl_gu("서구");
		dealVo.setDl_dong("월평동");
		dealVo.setDl_zip("311-1");
		dealVo.setDl_rd("청사로");
		dealVo.setDl_ty("매매");
		dealVo.setDl_excv_area(59.76f);
		
		/***when***/
		List<DealVo> result = detailDao.selectDealListByArea(dealVo);

		/***then***/
		assertEquals(516, result.size());
		
		
		
	}
	
}



























