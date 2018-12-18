package kr.co.opensise.admin.manage.dataetc.web;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.util.List;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.web.servlet.ModelAndView;

import kr.co.opensise.admin.manage.dataetc.model.InstiAttrVo;
import kr.co.opensise.admin.manage.dataetc.model.InstiVo;
import kr.co.opensise.setup.ControllerSetup;

public class DataEtcControllerTest extends ControllerSetup {
	
	private Logger log = LoggerFactory.getLogger(DataEtcControllerTest.class);

	@Test
	public void insertInstitest() throws Exception {
		
		/***Given***/
		MvcResult mvcResult = mockMvc.perform(post("/manage/dataEtc/insertInsti").param("insti", "병원")).andReturn();
		ModelAndView mav = mvcResult.getModelAndView();
		/***When***/
		
		String insti = (String) mav.getModel().get("insti");
		List<InstiVo> instiList = (List<InstiVo>) mav.getModel().get("instiList");
		/***Then***/
		
		for(InstiVo iVo : instiList) {
			log.info("결과 : {}", iVo.toString());
		}
		
		assertEquals("병원", insti);
		assertEquals(5, instiList.size());
		
	}
	
	@Test
	public void selectInstitest() throws Exception {
		/***Given***/
		MvcResult mvcResult = mockMvc.perform(post("/manage/dataEtc/selectInsti").param("instiHere", "1")).andReturn();
		ModelAndView mav = mvcResult.getModelAndView();
		
		/***When***/
		List<InstiAttrVo> insti_attrList = (List<InstiAttrVo>) mav.getModel().get("insti_attrList");
		List<List<InstiAttrVo>> instiAttrList = (List<List<InstiAttrVo>>) mav.getModel().get("instiAttrList");
		
		String comp = "";
		String title="";
		String same = "";
		for(int i=0;i<instiAttrList.size();i++) {
			for(int k=0;k<instiAttrList.get(i).size();k++) {
				comp = (instiAttrList.get(i).get(k).getIattr_key()).trim();
//				log.info("비교 {}", comp);
				for(int j=0;j<insti_attrList.size();j++) {
					title = insti_attrList.get(j).getIattr_key();
//					log.info("타이틀 {}",title);
					if(comp.equals(title)) {
						same = insti_attrList.get(j).getIattr_key();
						log.info("같을때 {}",same);
						break;
					}else if(comp==null || comp.equals("")){
						log.info("빈칸");
					}
				}
			}
		}
		
		/***Then***/
	}

}
