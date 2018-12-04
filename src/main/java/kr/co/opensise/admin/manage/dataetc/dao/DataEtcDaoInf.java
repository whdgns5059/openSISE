package kr.co.opensise.admin.manage.dataetc.dao;

import java.util.List;

import kr.co.opensise.admin.manage.dataetc.model.Human_statisticVo;

public interface DataEtcDaoInf {
	
	int insertHuman_statistic(List<Human_statisticVo> human_statisticList);
	
}
