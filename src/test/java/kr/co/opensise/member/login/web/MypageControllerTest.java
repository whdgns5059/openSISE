package kr.co.opensise.member.login.web;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.web.servlet.ModelAndView;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;
import kr.co.opensise.setup.ControllerSetup;

public class MypageControllerTest extends ControllerSetup{

	private Logger log = LoggerFactory.getLogger(MypageControllerTest.class);

	@Before
	public void sessionListAdd() throws Exception {

		/***given***/
		String artcl_gu = "서구";
		String artcl_dong = "월평동";
		String artcl_zip  = "311-1";
		String artcl_rd  = "청사로";
		String dl_ty = "매매";
		
		ArticleVo articleVo = new ArticleVo();
		articleVo.setArtcl_gu(artcl_gu);
		articleVo.setArtcl_dong(artcl_dong);
		articleVo.setArtcl_zip(artcl_zip);
		articleVo.setArtcl_rd(artcl_rd);
		articleVo.setArtcl_dl_ty(dl_ty);
	
		List<ArticleVo> selectList = new ArrayList<>();
		selectList.add(articleVo);
		
		session = new MockHttpSession();
		session.setAttribute("selectList",selectList);
		/***when***/

		/***then***/
		
	}
	
	@Test
	public void recentlyViewTest() throws Exception {
		
		/***given***/
		
		/***when***/
		
		List<ArticleVo> selectList = (List<ArticleVo>) session.getAttribute("selectList");
		
		
		/***then***/
		for(ArticleVo articleVo : selectList) {
			
			log.info(articleVo.toString());
			
		}
		
		assertEquals(1, selectList.size());
		
		
	}

}
