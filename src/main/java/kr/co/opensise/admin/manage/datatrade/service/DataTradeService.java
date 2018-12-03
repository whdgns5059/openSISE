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

}
