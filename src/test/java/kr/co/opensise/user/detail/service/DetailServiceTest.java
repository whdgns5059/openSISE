package kr.co.opensise.user.detail.service;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;
import kr.co.opensise.setup.RootSetup;
import kr.co.opensise.user.detail.model.AvgTradeVo;

public class DetailServiceTest extends RootSetup{

	@Resource(name="detailService")
	private DetailServiceInf detailService;
	
	
	@SuppressWarnings("unchecked")
	@Test
	public void getDetailInfoTest() {
		
		/***given***/
		String gu = "서구";
		String dong = "월평동";
		String zip = "311-1";
		String rd = "청사로";
		String dl_ty = "매매";
		
		ArticleVo articleVo = new ArticleVo();
		articleVo.setArtcl_gu(gu);
		articleVo.setArtcl_dong(dong);
		articleVo.setArtcl_zip(zip);
		articleVo.setArtcl_rd(rd);
	
		
		/***when***/
		Map<String, Object> detailMap = detailService.getDetailInfo(articleVo, dl_ty);
		ArticleVo selectArticleVo = (ArticleVo) detailMap.get("selectArticleVo");
		List<String> selectAreas = (List<String>) detailMap.get("selectAreas");
		
		/***then***/
		assertEquals("36.360773619481314", selectArticleVo.getArtcl_lat());
		assertEquals(2, selectAreas.size());
		
		
	}
	
	@Test
	public void getDetailTradeInfoTest() {
		
		/***given***/
		String gu = "서구";
		String dong = "월평동";
		String zip = "311-1";
		String rd = "청사로";
		String dl_ty = "매매";
		float dl_excv_area = 51.03f;
			
		ArticleVo articleVo = new ArticleVo();
		articleVo.setArtcl_gu(gu);
		articleVo.setArtcl_dong(dong);
		articleVo.setArtcl_zip(zip);
		articleVo.setArtcl_rd(rd);
		
		/***when***/
		Map<String, Object> detailTradeInfoMap = detailService.getDetailTradeInfo(articleVo, dl_ty, dl_excv_area);
		
		AvgTradeVo avgTradeVo = (AvgTradeVo) detailTradeInfoMap.get("avgTradeVo");
		List<DealVo> recentTradeVo = (List<DealVo>) detailTradeInfoMap.get("recentTradeVo");
		List<DealVo> dealListbyArea = (List<DealVo>) detailTradeInfoMap.get("dealListByArea");

		/***then***/
		assertEquals(15150.0, avgTradeVo.getAvg_price() , 1e-8);
		assertEquals(1, recentTradeVo.size());
		assertEquals(76, dealListbyArea.size());
		
		
	}

}






























