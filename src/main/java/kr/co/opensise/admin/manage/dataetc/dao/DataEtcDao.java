package kr.co.opensise.admin.manage.dataetc.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.opensise.admin.manage.dataetc.model.Human_statisticVo;
import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;

@Repository
public class DataEtcDao implements DataEtcDaoInf {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	@Override
	public int insertHuman_statistic(List<Human_statisticVo> human_statisticList) {
		return template.insert("dataEtc.insertHumanStatistic", human_statisticList);
	}

}
