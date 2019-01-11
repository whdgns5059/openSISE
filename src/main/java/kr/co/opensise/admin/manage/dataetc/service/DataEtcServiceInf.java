package kr.co.opensise.admin.manage.dataetc.service;

import java.util.List;
import java.util.Map;

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
	/**
	* Method : selectInsti_attr
	* 작성자 : ASUS
	* 변경이력 :
	* @param iattr_insti
	* @return
	* Method 설명 :시설테이블 중 제목부분리스트(중복제거)
	*/
	public List<InstiAttrVo> selectInsti_attr(int iattr_insti);
	public List<InstiAttrVo> selectInstiAttr(int iattr_insti);
//	public List<List<InstiAttrVo>> selectInstiAttr(int iattr_insti);
	public int insertInstiattr(InstiAttrVo instiAttrVo);
	/**
	* Method : deleteInstiattr
	* 작성자 : ASUS
	* 변경이력 :
	* @param numList
	* @return
	* Method 설명 :기타데이터 시설 삭제
	*/
	public int deleteInstiattr(int iattr_no);
	
	public List<MarketVo> marketList();
}
