package kr.co.opensise.admin.manage.dataetc.dao;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.opensise.admin.manage.dataetc.model.BusVo;
import kr.co.opensise.admin.manage.dataetc.model.InstiAttrVo;
import kr.co.opensise.admin.manage.dataetc.model.InstiVo;
import kr.co.opensise.admin.manage.dataetc.model.MarketVo;
import kr.co.opensise.setup.RootSetup;
import kr.co.opensise.user.detail.dao.DetailDao;

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
	
	@Test
	public void insertInstiDaoTest() {
		/***Given***/
		String insti = "도서관";
		InstiVo instiVo = new InstiVo();
		instiVo.setInsti_nm(insti);
		
		/***When***/
		int insertInsti = dataEtcDao.insertInsti(instiVo);

		/***Then***/
		assertEquals("도서관", instiVo.getInsti_nm());
	}
	
	@Test
	public void selectInstiListDaoTest() {
		/***Given***/
		
		/***When***/
		List<InstiVo> instiList = dataEtcDao.selectInsti();
		/***Then***/
		assertEquals("도서관", instiList.get(0).getInsti_nm());
	}
	
	@Test
	public void selectInstiAttrListDaoTest() {
		/***Given***/
		int iattr_insti=1;
		/***When***/
		List<InstiAttrVo> instiAttrList = dataEtcDao.selectInstiAttr(iattr_insti);
		/***Then***/
		assertEquals(6, instiAttrList.size());
	}
	
	@Test
	public void insertIattrDaoTest() {
		/***Given***/
		InstiAttrVo instiAttrVo = new InstiAttrVo();
		instiAttrVo.setIattr_insti(2);
		instiAttrVo.setIattr_key("병원명");
		instiAttrVo.setIattr_val("을지대병원");
		
		/***When***/
		int insertInstiattr = dataEtcDao.insertInstiattr(instiAttrVo);
		
		/***Then***/
		assertEquals(1, insertInstiattr);
	}
	
	@Test
	public void insertMarketOne() {
		
		/***given***/
		MarketVo mVo = new MarketVo();
		mVo.setMk_nm("테스트");
		mVo.setMk_dong("아무동");
		mVo.setMk_classf("청소시간");
	
		/***when***/
		
		int result = dataEtcDao.insertMarketOne(mVo);

		/***then***/
		assertEquals(result, 1);
		
		
	}

}
