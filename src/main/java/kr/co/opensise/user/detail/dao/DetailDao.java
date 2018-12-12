package kr.co.opensise.user.detail.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;

@Repository
public class DetailDao implements DetailDaoInf{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	@Override
	public ArticleVo selectArticle(ArticleVo articleVo) {
		return template.selectOne("detail.selectArticle", articleVo);
	}

	@Override
	public List<DealVo> selectDealList(DealVo dealVo) {
		return template.selectList("detail.selectDealList", dealVo);
	}

	@Override
	public List<String> selectAreas(ArticleVo articleVo) {
		return template.selectList("detail.selectAreas", articleVo);
	}


}
