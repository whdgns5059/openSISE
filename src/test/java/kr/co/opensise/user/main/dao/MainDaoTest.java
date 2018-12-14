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
		
		FilterVo filterVo = new FilterVo();
		filterVo.setSearchName("월평동");
		filterVo.setBuilding("apt");
		

		List<BuildingSaleVo> buildingSaleList = mainDao.buildingSaleList(filterVo);
		
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
	
	@Test 
	public void searchFilterSingleListTest() {
		FilterVo filterVo = new FilterVo();
		filterVo.setBuilding("apt");
		filterVo.setDl_ty("전세");
		filterVo.setSearchName("갈마동");
		
		List<BuildingSaleVo> buildFilterList = null;
		
		if(filterVo.getBuilding().equals("multi")) {
			buildFilterList = mainDao.buildingSingleFilterList(filterVo);
		}else {
			buildFilterList = mainDao.buildingFilterList(filterVo);
		}
		
		assertEquals(0, buildFilterList.size());
	}

}
