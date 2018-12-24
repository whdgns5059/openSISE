package kr.co.opensise.admin.manage.dataetc.dao;

import java.util.List;

import kr.co.opensise.admin.manage.dataetc.model.BusVo;
import kr.co.opensise.admin.manage.dataetc.model.HumanStatisticVo;
import kr.co.opensise.admin.manage.dataetc.model.InstiAttrVo;
import kr.co.opensise.admin.manage.dataetc.model.InstiVo;
import kr.co.opensise.admin.manage.dataetc.model.MarketVo;
import kr.co.opensise.admin.manage.dataetc.model.RouteVo;
import kr.co.opensise.admin.manage.dataetc.model.StationVo;
import kr.co.opensise.admin.manage.dataetc.model.MarketDetailVo;

public interface DataEtcDaoInf {
	
	public int insertHuman_statistic(List<HumanStatisticVo> human_statisticList);
	
	public int insertMarket(List<MarketVo> marketList);
	public int insertMarketDetail(List<MarketDetailVo> marketDetailList);
	
	public int deleteBus();
	public int deleteRoute();
	public int deleteStation();
	public int insertBus(List<BusVo> busList);
	public int insertRoute(List<RouteVo> routeList);
	public int insertStation(List<StationVo> stationList);
	
	public int insertInsti(InstiVo instiVo);
	public List<InstiVo> selectInsti();
	public List<InstiAttrVo> selectInsti_attr(int iattr_insti);
	public List<InstiAttrVo> selectInstiAttr(int iattr_insti);
	public int insertInstiattr(InstiAttrVo instiAttrVo);
	public int deleteInstiattr(int groupno);
	
}
