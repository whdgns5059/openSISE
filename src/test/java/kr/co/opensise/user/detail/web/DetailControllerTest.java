package kr.co.opensise.user.detail.web;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;

import java.util.List;

import org.apache.taglibs.standard.lang.jstl.ArithmeticOperator;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.web.servlet.ModelAndView;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;
import kr.co.opensise.setup.ControllerSetup;

public class DetailControllerTest extends ControllerSetup{

	private Logger log = LoggerFactory.getLogger(DetailController.class);
	
	@Test
	public void detailTest() throws Exception {
		/***given***/
		String artcl_gu = "서구";
		String artcl_dong = "월평동";
		String artcl_zip  = "311-1";
		String artcl_rd  = "청사로";
		
		String dl_ty = "매매";
	
		
		/***when***/
		MvcResult mvcResult = mockMvc.perform(post("/detail/detail").param("artcl_gu", artcl_gu).param("artcl_dong", artcl_dong)
					.param("artcl_zip", artcl_zip).param("artcl_rd", artcl_rd).param("dl_ty", dl_ty)).andReturn();
		
		ModelAndView mav= mvcResult.getModelAndView();
		ArticleVo articleVo = (ArticleVo) mav.getModel().get("selectArticleVo");
		List<DealVo> dealVoList = (List<DealVo>) mav.getModel().get("selectDealVoList");
		List<String> selectAreas = (List<String>) mav.getModel().get("selectAreas");
		

		/***then***/
		log.info(articleVo.toString());
		for(DealVo dVo : dealVoList) {
			log.info(dVo.toString());
		}
		
		assertEquals("36.360773619481314", articleVo.getArtcl_lat());
		assertEquals(2, selectAreas.size());
		
	}

}
