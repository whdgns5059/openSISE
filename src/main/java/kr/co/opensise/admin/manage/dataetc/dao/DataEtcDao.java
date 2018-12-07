package kr.co.opensise.admin.manage.dataetc.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.opensise.admin.manage.dataetc.model.HumanStatisticVo;
import kr.co.opensise.admin.manage.dataetc.model.MarketVo;
import kr.co.opensise.admin.manage.dataetc.model.MarketDetailVo;
import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;

@Repository
public class DataEtcDao implements DataEtcDaoInf {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	@Override
	public int insertHuman_statistic(List<HumanStatisticVo> human_statisticList) {
		return template.insert("dataEtc.insertHumanStatistic", human_statisticList);
	}

	@Override
	public int insertMarket(List<MarketVo> marketList) {
		return template.insert("dataEtc.insertMarket",marketList);
	}

	@Override
	public int insertMarketDetail(List<MarketDetailVo> marketDetailList) {
		return template.insert("dataEtc.insertMarketDetail",marketDetailList);
	}

}
