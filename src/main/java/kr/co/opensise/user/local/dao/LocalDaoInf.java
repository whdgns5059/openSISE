package kr.co.opensise.user.local.dao;

import java.util.List;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;

public interface LocalDaoInf {
	
	ArticleVo selectArticle(ArticleVo articleVo);
	
	List<DealVo> selectDealList(DealVo dealVo);

}
