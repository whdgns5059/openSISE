package kr.co.opensise.user.local.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.co.opensise.admin.manage.dataetc.model.StationVo;
import kr.co.opensise.setup.RootSetup;

public class StationDaoTest extends RootSetup{
	
	@Resource(name="stationDao")
	private StationDaoInf stationDao;

	@Test
	public void selectStationListTest() {
		
		/***given***/
		StationVo sttnVo = new StationVo();
		sttnVo.setSttn_lat("36.358498");
		sttnVo.setSttn_lng("127.36105");
		
		
		/***when***/
		List<StationVo> stationList = stationDao.selectStationList(sttnVo);
		

		/***then***/
		assertEquals(170, stationList.size());
		
	}

}
