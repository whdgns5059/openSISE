package kr.co.opensise.admin.manage.dataetc.service;

import java.util.List;

import kr.co.opensise.admin.manage.dataetc.model.BusVo;
import kr.co.opensise.admin.manage.dataetc.model.HumanStatisticVo;
import kr.co.opensise.admin.manage.dataetc.model.MarketVo;
import kr.co.opensise.admin.manage.dataetc.model.RouteVo;
import kr.co.opensise.admin.manage.dataetc.model.StationVo;
import kr.co.opensise.admin.manage.dataetc.model.MarketDetailVo;

public interface DataEtcServiceInf {

	int insertHuman_statistic(List<HumanStatisticVo> human_statisticList);
	
	int insertMarket(List<MarketVo> marketList);
	int insertMarketDetail(List<MarketDetailVo> marketDetailList);
	
	int insertBus(List<BusVo> busList);
	int insertRoute(List<RouteVo> routeList);
	int insertStation(List<StationVo> stationList);
	
	

}
