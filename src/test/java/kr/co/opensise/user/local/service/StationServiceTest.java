package kr.co.opensise.user.local.service;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.opensise.admin.manage.dataetc.model.StationVo;
import kr.co.opensise.setup.RootSetup;

public class StationServiceTest extends RootSetup{

	private Logger log = LoggerFactory.getLogger(StationServiceTest.class);

	@Resource(name="stationService")
	private StationServiceInf stationService;

	@Test
	public void selectStationListTest() {
		
		/***given***/
		StationVo sttnVo = new StationVo();
		sttnVo.setSttn_lat("36.358498");
		sttnVo.setSttn_lng("127.36105");
		
		
		/***when***/
		List<StationVo> stationList = stationService.selectStationList(sttnVo);
		

		/***then***/
		
		for(StationVo stationVo : stationList) {
			log.info("stationVo : {}", stationVo.toString());
		}
		
		assertEquals(170, stationList.size());
		
	}
}
