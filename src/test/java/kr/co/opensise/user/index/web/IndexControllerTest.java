package kr.co.opensise.user.index.web;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import org.junit.Test;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.web.servlet.ModelAndView;

import kr.co.opensise.setup.ControllerSetup;

public class IndexControllerTest extends ControllerSetup {

	@Test
	public void indexText() throws Exception {
		
		/***given***/
		MvcResult mvcResult = mockMvc.perform(get("/index/index")).andReturn();
		ModelAndView mav = mvcResult.getModelAndView();
		/***when***/

		/***then***/
		assertEquals("index", mav.getViewName());
		
	}

}
