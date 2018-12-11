package kr.co.opensise.user.main.dao;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;

import kr.co.opensise.setup.RootSetup;
import kr.co.opensise.user.main.model.BuildingSaleVo;
import kr.co.opensise.user.main.model.FilterVo;

public class MainDaoTest  extends RootSetup{
	
	@Resource(name ="mainDao")
	private MainDaoInf mainDao;
	
	@Test
	public void searchListTest() {
		String searchName = "월평동";
		String building = "apt";
		
		Map<String, String> searchMap = new HashMap<String, String>();

		searchMap.put("searchName", searchName);
		searchMap.put("building", building);
		List<BuildingSaleVo> buildingSaleList = mainDao.buildingSaleList(searchMap);
		
		assertEquals(1019, buildingSaleList.size());
		
				
	}
	
	@Test
	public void searchFilterListTest() {
		FilterVo filterVo = new FilterVo();
		filterVo.setBuilding("apt");
		filterVo.setDl_ty("전세");
		filterVo.setSearchName("월평동");
		
		List<BuildingSaleVo> buildFilterList = mainDao.buildingFilterList(filterVo);
		
		assertEquals(15, buildFilterList.size());
	}

}
