package kr.co.opensise.user.detail.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;
import kr.co.opensise.setup.RootSetup;
import kr.co.opensise.user.detail.dao.DetailDaoInf;

public class DetailDaoTest extends RootSetup{

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
		
		/***when***/
		List<DealVo> result = detailDao.selectDealList(dealVo);

		/***then***/
		assertEquals(16, result.size());
	}

}
