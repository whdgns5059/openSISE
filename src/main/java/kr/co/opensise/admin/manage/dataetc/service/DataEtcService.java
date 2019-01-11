package kr.co.opensise.admin.manage.dataetc.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.opensise.admin.manage.dataetc.dao.DataEtcDaoInf;
import kr.co.opensise.admin.manage.dataetc.model.BusVo;
import kr.co.opensise.admin.manage.dataetc.model.HumanStatisticVo;
import kr.co.opensise.admin.manage.dataetc.model.InstiAttrVo;
import kr.co.opensise.admin.manage.dataetc.model.InstiVo;
import kr.co.opensise.admin.manage.dataetc.model.MarketDetailVo;
import kr.co.opensise.admin.manage.dataetc.model.MarketVo;
import kr.co.opensise.admin.manage.dataetc.model.RouteVo;
import kr.co.opensise.admin.manage.dataetc.model.StationVo;

@Service
public class DataEtcService implements DataEtcServiceInf {

	@Resource(name="dataEtcDao")
	private DataEtcDaoInf dataEtcDao;

	@Override
	public int insertHuman_statistic(List<HumanStatisticVo> human_statisticList) {
		return dataEtcDao.insertHuman_statistic(human_statisticList);
	}

	@Override
	public int insertMarket(List<MarketVo> marketList) {
		return dataEtcDao.insertMarket(marketList);
	}

	@Override
	public int insertMarketDetail(List<MarketDetailVo> marketDetailList) {
		return dataEtcDao.insertMarketDetail(marketDetailList);
	}

	@Override
	public int insertBus(List<BusVo> busList) {
		dataEtcDao.deleteRoute();
		dataEtcDao.deleteStation();
		dataEtcDao.deleteBus();
		return dataEtcDao.insertBus(busList);
	}

	@Override
	public int insertRoute(List<RouteVo> routeList) {
		return dataEtcDao.insertRoute(routeList);
	}

	@Override
	public int insertStation(List<StationVo> stationList) {
		return dataEtcDao.insertStation(stationList);
	}

	@Override
	public int insertInsti(InstiVo instiVo) {
		return dataEtcDao.insertInsti(instiVo);
	}

	@Override
	public List<InstiVo> selectInsti() {
		return dataEtcDao.selectInsti();
	}

	/**
	* Method : selectInsti_attr
	* 작성자 : ASUS
	* 변경이력 :
	* @param iattr_insti
	* @return
	* Method 설명 :시설테이블 중 제목부분리스트(중복제거)
	*/
	@Override
	public List<InstiAttrVo> selectInsti_attr(int iattr_insti) {
		return dataEtcDao.selectInsti_attr(iattr_insti);
	}


	@Override
	public int insertInstiattr(InstiAttrVo instiAttrVo) {
		return dataEtcDao.insertInstiattr(instiAttrVo);
	}

	@Override
	public List<InstiAttrVo> selectInstiAttr(int iattr_insti) {
		return dataEtcDao.selectInstiAttr(iattr_insti);
	}

	@Override
	public int deleteInstiattr(int iattr_no) {
		return dataEtcDao.deleteInstiattr(iattr_no);
	}

	@Override
	public List<MarketVo> marketList() {
		return dataEtcDao.marketList();
	}

}
