package kr.co.opensise.user.detail.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;
import kr.co.opensise.admin.statis.model.FavoriteVo;
import kr.co.opensise.user.detail.model.AvgStatVo;
import kr.co.opensise.user.detail.model.AvgTradeVo;
import kr.co.opensise.user.detail.model.PictureVo;
import kr.co.opensise.user.detail.model.PostVo;
import kr.co.opensise.user.detail.model.ReplyVo;
import kr.co.opensise.user.detail.model.ReportVo;

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

	@Override
	public int deleteReply(int rpl_no) {
		return template.delete("detail.deleteReply", rpl_no);
	}

	@Override
	public PostVo selectReviewByNo(String post_no) {
		return template.selectOne("detail.selectReviewByNo", post_no);
	}

	@Override
	public int deleteReview(String post_no) {
		return template.delete("detail.deleteReview", post_no);
	}

	@Override
	public int deleteReviewChild(String post_no) {
		return template.delete("detail.deleteReviewChild", post_no);
	}

	@Override
	public int insertPicture(PictureVo pictureVo) {
		return template.insert("detail.insertPicture", pictureVo);
	}

	@Override
	public List<PictureVo> selectReviewPic(PostVo postVo) {
		return template.selectList("detail.selectReviewPic", postVo);
	}

	@Override
	public AvgStatVo selectPriceStat(DealVo dealVo) {
		return template.selectOne("detail.selectPriceStat", dealVo);
	}

	@Override
	public Float selectMarketStat(String dong) {
		return template.selectOne("detail.selectMarketStat", dong);
	}

	@Override
	public Float selectHumanStat(String dong) {
		return template.selectOne("detail.selectHumanStat", dong);
	}

	@Override
	public int insertFavor(FavoriteVo favorVo) {
		return template.insert("detail.insertFavor", favorVo);
	}

	@Override
	public FavoriteVo selectFavor(FavoriteVo favorVo) {
		return template.selectOne("detail.selectFavor", favorVo);
	}

	@Override
	public int deleteFavor(int favor_no) {
		return template.delete("detail.deleteFavor", favor_no);
	}

	@Override
	public int selectFavorCount(FavoriteVo favorVo) {
		return template.selectOne("detail.selectFavorCount", favorVo);
	}

	@Override
	public int insertReport(ReportVo rptVo) {
		return template.insert("detail.insertReport", rptVo);
	}

	@Override
	public int deletePic(String pic_no) {
		return template.delete("detail.deletePic", pic_no);
	}

	@Override
	public int updateReview(PostVo postVo) {
		return template.update("detail.updateReview", postVo);
	}
	
	


}
