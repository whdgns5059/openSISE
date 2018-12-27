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
import kr.co.opensise.user.detail.model.AvgTradeVo;
import kr.co.opensise.user.detail.model.PictureVo;
import kr.co.opensise.user.detail.model.PostVo;
import kr.co.opensise.user.detail.model.ReplyVo;

public class DetailControllerTest extends ControllerSetup{

	private Logger log = LoggerFactory.getLogger(DetailController.class);
	
	@SuppressWarnings("unchecked")
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
	
	
	@SuppressWarnings("unchecked")
	@Test
	public void detailTradeInfoAjaxTest() throws Exception {
		
		/***given***/
		String artcl_gu = "서구";
		String artcl_dong = "월평동";
		String artcl_zip  = "311-1";
		String artcl_rd  = "청사로";
		
		String dl_ty = "매매";
		String dl_excv_area = "59.76";
		
		/***when***/
		MvcResult mvcResult = mockMvc.perform(post("/detail/tradeInfoAjax").param("artcl_gu", artcl_gu).param("artcl_dong",artcl_dong)
							.param("artcl_zip", artcl_zip).param("artcl_rd", artcl_rd).param("dl_ty", dl_ty).param("dl_excv_area", dl_excv_area)).andReturn();
		
		ModelAndView mav = mvcResult.getModelAndView();
		AvgTradeVo avgTradeVo = (AvgTradeVo) mav.getModel().get("avgTradeVo");
		List<DealVo> recentTradeList = (List<DealVo>) mav.getModel().get("recentTradeList");
		List<DealVo> dealListByArea = (List<DealVo>) mav.getModel().get("dealListByArea");
		List<DealVo> monthlyAvg = (List<DealVo>) mav.getModel().get("monthlyAvg");
		String dl_tyRes = (String) mav.getModel().get("dl_ty");
		
		log.info("최근 거래가 {}", recentTradeList.get(0).getDl_price());
		
		/***then***/
		assertEquals(16914.0, avgTradeVo.getAvg_price() , 1e-8);
		assertEquals(4, recentTradeList.size());
		assertEquals(863, dealListByArea.size());
		assertEquals("매매", dl_tyRes);
		assertEquals(131, monthlyAvg.size());
		
		
	}
	
	@Test
	public void insertReplyTest() throws Exception {
		
		/***given***/
		
		MvcResult mvcResult = mockMvc.perform(post("/detail/insertReply").param("rpl_cntnt", "컨트롤러테스트").param("rpl_post", "5")).andReturn();
		ModelAndView mav = mvcResult.getModelAndView();
		
		/***when***/
		String post_no = (String) mav.getModel().get("post_no");

		/***then***/
		assertEquals("5", post_no);
		
	}

	@Test
	public void reviewUpdateTest() throws Exception {
		
		
		/***given***/
		MvcResult mvcResult = mockMvc.perform(post("/detail/updateReview").param("post_no", "43")).andReturn();
		ModelAndView mav = mvcResult.getModelAndView();
		
		/***when***/
		PostVo postVo = (PostVo) mav.getModel().get("postVo");
		List<PictureVo> picList = (List<PictureVo>) mav.getModel().get("picList");

		/***then***/
		log.info("postVo : {}", postVo);
		for(PictureVo picVo : picList) {
			
			log.info("picVo : {}", picVo);
			
		}
		
		assertEquals(3, picList.size());
				
		
		
		
		
	}
	
	
	
}









































