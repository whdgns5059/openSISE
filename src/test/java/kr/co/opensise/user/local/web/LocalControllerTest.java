package kr.co.opensise.user.local.web;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;

import java.util.List;

import org.junit.Test;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.web.servlet.ModelAndView;

import kr.co.opensise.admin.manage.dataetc.model.MarketDetailVo;
import kr.co.opensise.setup.ControllerSetup;

public class LocalControllerTest extends ControllerSetup{

	@SuppressWarnings("unchecked")
	@Test
	public void marketTest() throws Exception {
		
	
		/***given***/
		MvcResult mvcResult = mockMvc.perform(get("/local/market").param("dong", "월평동")).andReturn();
		ModelAndView mav = mvcResult.getModelAndView();
		
		/***when***/
		List<MarketDetailVo> mkdList = (List<MarketDetailVo>) mav.getModel().get("mkdList");
		List<MarketDetailVo> avgMkdList = (List<MarketDetailVo>) mav.getModel().get("avgMkdList");

		/***then***/
		assertEquals(30, mkdList.size());
		assertEquals(1, avgMkdList.size());

		
	}

}
