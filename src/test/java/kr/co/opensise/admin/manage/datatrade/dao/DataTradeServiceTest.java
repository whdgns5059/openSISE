package kr.co.opensise.admin.manage.datatrade.dao;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;
import kr.co.opensise.admin.manage.datatrade.service.DataTradeServiceInf;
import kr.co.opensise.setup.RootSetup;

public class DataTradeServiceTest extends RootSetup{
	
	@Resource(name="dataTradeService")
	private DataTradeServiceInf dataTradeService;

	@Test
	public void deleteArticleDealTest() {
		/***given***/
		ArticleVo articleVo = new ArticleVo();
		articleVo.setArtcl_gu("동구");
		articleVo.setArtcl_dong("가양동");
		articleVo.setArtcl_zip("33-4");
		articleVo.setArtcl_rd("동서대로1778번길");
		DealVo dealVo = new DealVo();
		dealVo.setDl_gu(articleVo.getArtcl_gu());
		dealVo.setDl_dong(articleVo.getArtcl_dong());
		dealVo.setDl_zip(articleVo.getArtcl_zip());
		dealVo.setDl_rd(articleVo.getArtcl_rd());
		
		/***when***/
		int result = dataTradeService.deleteArticleDeal(articleVo, dealVo);
		
		/***then***/
		assertEquals(1, result);
	}

}
