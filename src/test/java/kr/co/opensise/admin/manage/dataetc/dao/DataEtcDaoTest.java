package kr.co.opensise.admin.manage.dataetc.dao;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.opensise.admin.manage.dataetc.model.BusVo;
import kr.co.opensise.setup.RootSetup;

public class DataEtcDaoTest extends RootSetup{

	private Logger log = LoggerFactory.getLogger(DataEtcDaoTest.class);
	
	@Resource(name="dataEtcDao")
	private DataEtcDaoInf dataEtcDao;
	
	@Test
	public void insertBusDaoTest() {
		
		/***given***/
		BusVo busVo = new BusVo();
		busVo.setBus_cd("30300001");
		busVo.setBus_no("1");
		busVo.setBus_tp("5");
		
		BusVo busVo1 = new BusVo();
		busVo1.setBus_cd("30300002");
		busVo1.setBus_no("2");
		busVo1.setBus_tp("1");
		
		List<BusVo> busList = new ArrayList<BusVo>();
		busList.add(busVo);
		busList.add(busVo1);
		log.info("buslist : {}",busList);
		
		/***when***/
		int insertBus = 0;
		insertBus = dataEtcDao.insertBus(busList);

		/***then***/
		assertEquals(2, insertBus);
		
	}

}
