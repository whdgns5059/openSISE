package kr.co.opensise.admin.manage.dataetc.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.opensise.admin.manage.dataetc.model.BusVo;
import kr.co.opensise.admin.manage.dataetc.model.HumanStatisticVo;
import kr.co.opensise.admin.manage.dataetc.model.InstiAttrVo;
import kr.co.opensise.admin.manage.dataetc.model.InstiVo;
import kr.co.opensise.admin.manage.dataetc.model.MarketVo;
import kr.co.opensise.admin.manage.dataetc.model.RouteVo;
import kr.co.opensise.admin.manage.dataetc.model.StationVo;
import kr.co.opensise.admin.manage.dataetc.model.MarketDetailVo;
import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;

@Repository
public class DataEtcDao implements DataEtcDaoInf {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	//인구통계
	@Override
	public int insertHuman_statistic(List<HumanStatisticVo> human_statisticList) {
		return template.insert("dataEtc.insertHumanStatistic", human_statisticList);
	}

	//물가
	@Override
	public int insertMarket(List<MarketVo> marketList) {
		return template.insert("dataEtc.insertMarket",marketList);
	}

	@Override
	public int insertMarketDetail(List<MarketDetailVo> marketDetailList) {
		return template.insert("dataEtc.insertMarketDetail",marketDetailList);
	}

	//교통
	@Override
	public int insertBus(List<BusVo> busList) {
		return template.insert("dataEtc.insertBus",busList);
	}

	@Override
	public int insertRoute(List<RouteVo> routeList) {
		return template.insert("dataEtc.insertRoute", routeList);
	}

	@Override
	public int insertStation(List<StationVo> stationList) {
		return template.insert("dataEtc.insertStation", stationList);
	}

	@Override
	public int deleteBus() {
		return template.delete("dataEtc.deleteBus");
	}

	@Override
	public int deleteRoute() {
		return template.delete("dataEtc.deleteRoute");
	}

	@Override
	public int deleteStation() {
		return template.delete("dataEtc.deleteStation");
	}

	//시설
	@Override
	public int insertInsti(InstiVo instiVo) {
		return template.insert("dataEtc.insertInsti",instiVo);
	}

	@Override
	public List<InstiVo> selectInsti() {
		return template.selectList("dataEtc.selectInstiList");
	}

	@Override
	public List<InstiAttrVo> selectInstiAttr(int iattr_insti) {
		return template.selectList("dataEtc.slelectInstiAttrList", iattr_insti);
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
		return template.selectList("dataEtc.selectInsti_attr", iattr_insti);
	}

	@Override
	public int insertInstiattr(InstiAttrVo instiAttrVo) {
		return template.insert("dataEtc.insertIattr", instiAttrVo);
	}

	/**
	* Method : deleteInstiattr
	* 작성자 : ASUS
	* 변경이력 :
	* @param numList
	* @return
	* Method 설명 : 기타데이터 시설 삭제
	*/
//	@Override
//	public int deleteInstiattr(int iattr_no) {
//		return template.delete("dataEtc.deleteInsti", iattr_no);
//	}

	/**
	* Method : marketList
	* 작성자 : ASUS
	* 변경이력 :
	* @return
	* Method 설명 :market은 최초 한번만 입력되면 되므로 기존 market의 list를 가져온다.
	*/
	@Override
	public List<MarketVo> marketList() {
		return template.selectList("dataEtc.marketList");
	}

	@Override
	public int insertMarketOne(MarketVo mVo) {
		return template.insert("dataEtc.marketListOne", mVo);
	}

	/**
	* Method : hasmonth
	* 작성자 : ASUS
	* 변경이력 :
	* @param hs_date
	* @return
	* Method 설명 : 인구통계 데이타 중복을 방지하기 위해 hs_date list를 가져온다.
	*/
	@Override
	public List<HumanStatisticVo> hasmonth(String hs_date) {
		List<HumanStatisticVo> monthList = template.selectList("dataEtc.hasmonth", hs_date);
		return monthList;
	}

	/**
	* Method : markethasmonth
	* 작성자 : ASUS
	* 변경이력 :
	* @param mkd_date
	* @return
	* Method 설명 : 물가상세 데이타 중복을 방지하기 위해 mkd_date list를 가져온다.
	*/
	@Override
	public List<MarketDetailVo> markethasmonth(String mkd_date) {
		List<MarketDetailVo> mkdmonthList = template.selectList("dataEtc.markethasmonth", mkd_date);
		return mkdmonthList;
	}

	@Override
	public int deleteInsti(int insti_no) {
		return template.delete("dataEtc.deletInsti", insti_no);
	}

}
