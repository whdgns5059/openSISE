package kr.co.opensise.admin.manage.dataetc.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.opensise.admin.manage.dataetc.dao.DataEtcDaoInf;
import kr.co.opensise.admin.manage.dataetc.model.BusVo;
import kr.co.opensise.admin.manage.dataetc.model.HumanStatisticVo;
import kr.co.opensise.admin.manage.dataetc.model.InstiAttrVo;
import kr.co.opensise.admin.manage.dataetc.model.InstiVo;
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


	/**
	* Method : selectInstiAttr
	* 작성자 : ASUS
	* 변경이력 :
	* @param iattr_insti
	* @return
	* Method 설명 :시설물별로 list를 만들어 화면에 보여주기 위해 map에 담기
	*/
	@Override
	public List<List<InstiAttrVo>> selectInstiAttr(int iattr_insti) {
		
		//시설물 리스트 가지고 오기
		List<InstiAttrVo> instiAttrList = dataEtcDao.selectInstiAttr(iattr_insti);
		
		//시설물별로 저장할 리스트들을 담을 BigList
		List<List<InstiAttrVo>> bList = new ArrayList<List<InstiAttrVo>>();
		
		//시설물 구별을 위해 시설물이름을 모아놓은 SmallList
		List<InstiAttrVo> sList = null;
		
		for(int i=0;i<instiAttrList.size();i++) {
			if(instiAttrList.get(i).getLevel()==1) {
				if(sList !=null) {
					bList.add(sList);
				}
				sList = new ArrayList<InstiAttrVo>();
			}
			
			sList.add(instiAttrList.get(i));
		}
		
		bList.add(sList);
		
		return bList;
	}

	@Override
	public int insertInstiattr(InstiAttrVo instiAttrVo) {
		return dataEtcDao.insertInstiattr(instiAttrVo);
	}
}
