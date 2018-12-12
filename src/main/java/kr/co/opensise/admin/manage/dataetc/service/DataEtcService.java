package kr.co.opensise.admin.manage.dataetc.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.opensise.admin.manage.dataetc.dao.DataEtcDaoInf;
import kr.co.opensise.admin.manage.dataetc.model.BusVo;
import kr.co.opensise.admin.manage.dataetc.model.HumanStatisticVo;
import kr.co.opensise.admin.manage.dataetc.model.MarketVo;
import kr.co.opensise.admin.manage.dataetc.model.RouteVo;
import kr.co.opensise.admin.manage.dataetc.model.StationVo;
import kr.co.opensise.admin.manage.dataetc.model.MarketDetailVo;

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
//		dataEtcDao.deleteBus();
		return dataEtcDao.insertBus(busList);
	}

	@Override
	public int insertRoute(List<RouteVo> routeList) {
//		dataEtcDao.deleteRoute();
		return dataEtcDao.insertRoute(routeList);
	}

	@Override
	public int insertStation(List<StationVo> stationList) {
//		dataEtcDao.deleteStation();
		return dataEtcDao.insertStation(stationList);
	}


}
