package kr.co.opensise.user.main.service;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;

import kr.co.opensise.setup.RootSetup;
import kr.co.opensise.user.main.model.BuildingSaleVo;

public class MainServiceTest extends RootSetup {
	
	@Resource(name="mainService")
	private MainServiceInf mainService;

	@Test
	public void searchListTest() {
		String searchName = "월평동";
		String building = "apt";
		
		Map<String, String> searchMap = new HashMap<String, String>();

		searchMap.put("searchName", searchName);
		searchMap.put("building", building);
		List<BuildingSaleVo> buildingSaleList = mainService.buildingSaleList(searchMap);
		
		assertEquals(1019, buildingSaleList.size());
		
		
		
	}

}
