package kr.co.opensise.user.main.service;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;

import kr.co.opensise.setup.RootSetup;
import kr.co.opensise.user.main.model.BuildingSaleVo;
import kr.co.opensise.user.main.model.FilterVo;

public class MainServiceTest extends RootSetup {
	
	@Resource(name="mainService")
	private MainServiceInf mainService;

	@Test
	public void searchListTest() {
		
		FilterVo filterVo = new FilterVo();
		filterVo.setSearchName("월평동");
		filterVo.setBuilding("apt");

		List<BuildingSaleVo> buildingSaleList = mainService.buildingSaleList(filterVo);
		
		assertEquals(1019, buildingSaleList.size());
		
		
		
	}

}
