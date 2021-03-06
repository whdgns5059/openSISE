package kr.co.opensise.member.login.web;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.web.servlet.ModelAndView;

import kr.co.opensise.member.Login.dao.LoginDaoInf;
import kr.co.opensise.member.Login.model.MemberVo;
import kr.co.opensise.member.Login.service.LoginServiceInf;
import kr.co.opensise.setup.ControllerSetup;

public class LoginControllerTest extends ControllerSetup{

	@Resource(name="loginService")
	LoginServiceInf loginService;
	
	@Test
	public void Logintest() throws Exception {
		MvcResult mvcResult = mockMvc.perform(post("/login/openLogin").param("mem_email", "brown").param("mem_pass", "111")).andReturn();
		ModelAndView mav = mvcResult.getModelAndView();
		
		String viewName = mav.getViewName();
		assertEquals("openPage", viewName);
	}
	
	@Test
	public void Logintest1() {
		List<MemberVo> memberJobLiset = loginService.jobList();
		
		assertEquals(8 , memberJobLiset.size() );
		
	}

}
