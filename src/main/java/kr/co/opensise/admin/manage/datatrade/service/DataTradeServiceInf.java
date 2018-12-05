package kr.co.opensise.admin.manage.datatrade.service;

import java.util.List;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;

public interface DataTradeServiceInf {

	int insertArticleList(List<ArticleVo> articleList);

	int insertDealList(List<DealVo> dealList);
	
	List<ArticleVo> selectCoordNullArticle();

	int updataLatLngArticle(ArticleVo articleVo);

}
