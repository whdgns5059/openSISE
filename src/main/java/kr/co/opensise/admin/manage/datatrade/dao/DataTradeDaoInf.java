package kr.co.opensise.admin.manage.datatrade.dao;

import java.util.List;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;

public interface DataTradeDaoInf {
	
	int insertData(List<ArticleVo> dataTradeList);
	
}
