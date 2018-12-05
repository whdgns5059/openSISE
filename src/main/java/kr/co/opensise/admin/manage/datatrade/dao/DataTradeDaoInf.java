package kr.co.opensise.admin.manage.datatrade.dao;

import java.util.List;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;

public interface DataTradeDaoInf {
	
	int insertArticleList(List<ArticleVo> articleList);

	int insertDealList(List<DealVo> dealList);
	
	
}