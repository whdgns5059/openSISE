package kr.co.opensise.admin.manage.datatrade.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;

@Repository
public class DataTradeDao implements DataTradeDaoInf{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	

	@Override
	public int insertArticleList(List<ArticleVo> articleList) {
		return template.insert("dataTrade.insertArticleList", articleList);
	}


	@Override
	public int insertDealList(List<DealVo> dealList) {
		return template.insert("dataTrade.insertDealList", dealList);
	}


	@Override
	public List<ArticleVo> selectCoordNullArticle() {
		return template.selectList("dataTrade.selectCoordNullArticle");
	}


	@Override
	public int updataLatLngArticle(ArticleVo articleVo) {
		return template.update("dataTrade.updateLatLngArticle", articleVo);
	}


	@Override
	public int deleteArticle(ArticleVo articleVo) {
		return template.delete("dataTrade.deleteArticle", articleVo);
	}


	@Override
	public int deleteDeal(DealVo dealVo) {
		return template.delete("dataTrade.deleteDeal", dealVo);
	}

	

}
