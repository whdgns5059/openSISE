package kr.co.opensise.user.detail.dao;

import java.util.List;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;
import kr.co.opensise.user.detail.model.AvgTradeVo;
import kr.co.opensise.user.detail.model.PostVo;

public interface DetailDaoInf {
	
	ArticleVo selectArticle(ArticleVo articleVo);

	List<String> selectAreas(ArticleVo articleVo);

	List<DealVo> selectDealList(DealVo dealVo);
	
	AvgTradeVo selectAvgPrice(DealVo dealVo);
	
	List<DealVo> selectRecentTrade(DealVo dealVo);
	
	List<DealVo> selectDealListByArea(DealVo dealVo);

	int insertReview(PostVo postVo);
	
	List<PostVo> selectReview(ArticleVo articleVo);
	
}
