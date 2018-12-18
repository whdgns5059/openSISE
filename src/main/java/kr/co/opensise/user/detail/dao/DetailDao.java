package kr.co.opensise.user.detail.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;
import kr.co.opensise.user.detail.model.AvgTradeVo;
import kr.co.opensise.user.detail.model.PostVo;
import kr.co.opensise.user.detail.model.ReplyVo;

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

	@Override
	public AvgTradeVo selectAvgPrice(DealVo dealVo) {
		return template.selectOne("detail.selectAvgPrice", dealVo);
	}

	@Override
	public List<DealVo> selectRecentTrade(DealVo dealVo) {
		return template.selectList("detail.selectRecentTrade", dealVo);
	}

	@Override
	public List<DealVo> selectDealListByArea(DealVo dealVo) {
		return template.selectList("detail.selectDealListByArea", dealVo);
	}

	@Override
	public int insertReview(PostVo postVo) {
		return template.insert("detail.insertReview", postVo);
	}

	@Override
	public List<PostVo> selectReview(ArticleVo articleVo) {
		return template.selectList("detail.selectReview", articleVo);
		
	}

	@Override
	public List<DealVo> selectMonthlyAng(DealVo dealVo) {
		return template.selectList("detail.selectMonthlyAvg", dealVo);
	}

	@Override
	public int insertReply(ReplyVo replyVo) {
		return template.insert("detail.insertReply", replyVo);
	}

	@Override
	public List<ReplyVo> selectReply(int post_no) {
		return template.selectList("detail.selectReply", post_no );
	}


}
