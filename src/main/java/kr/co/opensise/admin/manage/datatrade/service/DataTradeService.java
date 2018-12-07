package kr.co.opensise.admin.manage.datatrade.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.opensise.admin.manage.datatrade.dao.DataTradeDaoInf;
import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;

@Service
public class DataTradeService implements DataTradeServiceInf {

	@Resource(name="dataTradeDao")
	private DataTradeDaoInf dataTradeDao;
	
	@Override
	public int insertArticleList(List<ArticleVo> articleList) {
		return dataTradeDao.insertArticleList(articleList);
	}

	@Override
	public int insertDealList(List<DealVo> dealList) {
		return dataTradeDao.insertDealList(dealList);
	}

	@Override
	public List<ArticleVo> selectCoordNullArticle() {
		return dataTradeDao.selectCoordNullArticle();
	}

	@Override
	public int updataLatLngArticle(ArticleVo articleVo) {
		return dataTradeDao.updataLatLngArticle(articleVo);
	}

	@Override
	public int deleteArticleDeal(ArticleVo articleVo, DealVo dealVo) {
		
		int dealResult = dataTradeDao.deleteDeal(dealVo);
		int articleResult = dataTradeDao.deleteArticle(articleVo);
		
		return articleResult;
	}
	
	

}
