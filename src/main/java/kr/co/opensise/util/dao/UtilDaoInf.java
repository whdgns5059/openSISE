package kr.co.opensise.util.dao;

import java.util.List;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.statis.model.FavoriteVo;
import kr.co.opensise.admin.statis.model.MemberVo;

public interface UtilDaoInf {
	
	List<MemberVo> selRanMem();
	
	List<ArticleVo> selRanArt();
	
	int insertFavorList(List<FavoriteVo> favList);
	
}
