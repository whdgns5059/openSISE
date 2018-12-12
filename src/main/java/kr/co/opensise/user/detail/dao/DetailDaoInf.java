package kr.co.opensise.user.detail.dao;

import java.util.List;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;

public interface DetailDaoInf {
	
	ArticleVo selectArticle(ArticleVo articleVo);
	
	List<DealVo> selectDealList(DealVo dealVo);

	List<String> selectAreas(ArticleVo articleVo);
	

}
