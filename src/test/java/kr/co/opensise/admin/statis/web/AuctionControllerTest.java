package kr.co.opensise.admin.statis.web;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import org.junit.Test;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.web.servlet.ModelAndView;

import kr.co.opensise.setup.ControllerSetup;

public class AuctionControllerTest extends ControllerSetup {

	@Test
	public void auction() throws Exception {
		
		/***given***/
		MvcResult mvcResult = mockMvc.perform(get("/auction/auction")).andReturn();
		ModelAndView mav = mvcResult.getModelAndView(); 
		/***when***/

		/***then***/
		assertEquals("auction/auction", mav.getViewName());
		
	}

}
