package kr.co.opensise.user.local.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;

@Repository
public class LocalDao implements LocalDaoInf{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	@Override
	public ArticleVo selectArticle(ArticleVo articleVo) {
		return template.selectOne("local.selectArticle", articleVo);
	}

	@Override
	public List<DealVo> selectDealList(DealVo dealVo) {
		return template.selectList("local.selectDealList");
	}


}
