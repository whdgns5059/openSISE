package kr.co.opensise.admin.manage.dataetc.dao;

import java.util.List;

import kr.co.opensise.admin.manage.dataetc.model.HumanStatisticVo;
import kr.co.opensise.admin.manage.dataetc.model.MarketVo;
import kr.co.opensise.admin.manage.dataetc.model.MarketDetailVo;

public interface DataEtcDaoInf {
	
	int insertHuman_statistic(List<HumanStatisticVo> human_statisticList);
	int insertMarket(List<MarketVo> marketList);
	int insertMarketDetail(List<MarketDetailVo> marketDetailList);
	
}
