package kr.co.opensise.member.login.web;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;

import org.junit.Test;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.web.servlet.ModelAndView;

import kr.co.opensise.setup.ControllerSetup;

public class LoginControllerTest extends ControllerSetup{

	@Test
	public void Logintest() throws Exception {
		MvcResult mvcResult = mockMvc.perform(post("/login/openLogin").param("mem_email", "brown").param("mem_pass", "brown")).andReturn();
		ModelAndView mav = mvcResult.getModelAndView();
		
		String viewName = mav.getViewName();
		assertEquals("openPage", viewName);
	}

}
