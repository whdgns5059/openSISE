package kr.co.opensise.user.detail.service;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;
import kr.co.opensise.setup.RootSetup;

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
		List<DealVo> selectDealVoList = (List<DealVo>) detailMap.get("selectDealVoList");		
		
		
		/***then***/
		assertEquals("36.360773619481314", selectArticleVo.getArtcl_lat());
		assertEquals(7, selectDealVoList.size());
		
		
	}

}
