package kr.co.opensise.admin.manage.dataetc.service;

import java.util.List;

import kr.co.opensise.admin.manage.dataetc.model.BusVo;
import kr.co.opensise.admin.manage.dataetc.model.HumanStatisticVo;
import kr.co.opensise.admin.manage.dataetc.model.InstiAttrVo;
import kr.co.opensise.admin.manage.dataetc.model.InstiVo;
import kr.co.opensise.admin.manage.dataetc.model.MarketVo;
import kr.co.opensise.admin.manage.dataetc.model.RouteVo;
import kr.co.opensise.admin.manage.dataetc.model.StationVo;
import kr.co.opensise.admin.manage.dataetc.model.MarketDetailVo;

public interface DataEtcServiceInf {

	public int insertHuman_statistic(List<HumanStatisticVo> human_statisticList);
	
	public int insertMarket(List<MarketVo> marketList);
	public int insertMarketDetail(List<MarketDetailVo> marketDetailList);
	
	public int insertBus(List<BusVo> busList);
	public int insertRoute(List<RouteVo> routeList);
	public int insertStation(List<StationVo> stationList);
	
	public int insertInsti(InstiVo instiVo);
	public List<InstiVo> selectInsti();
	public List<InstiAttrVo> selectInstiAttr(int iattr_insti);
}
