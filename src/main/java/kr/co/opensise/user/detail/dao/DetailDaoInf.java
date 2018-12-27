package kr.co.opensise.user.detail.dao;

import java.util.List;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;
import kr.co.opensise.admin.statis.model.FavoriteVo;
import kr.co.opensise.user.detail.model.AvgStatVo;
import kr.co.opensise.user.detail.model.AvgTradeVo;
import kr.co.opensise.user.detail.model.PictureVo;
import kr.co.opensise.user.detail.model.PostVo;
import kr.co.opensise.user.detail.model.ReplyVo;
import kr.co.opensise.user.detail.model.ReportVo;

public interface DetailDaoInf {
	
	ArticleVo selectArticle(ArticleVo articleVo);

	List<String> selectAreas(ArticleVo articleVo);

	List<DealVo> selectDealList(DealVo dealVo);
	
	AvgTradeVo selectAvgPrice(DealVo dealVo);
	
	List<DealVo> selectRecentTrade(DealVo dealVo);
	
	List<DealVo> selectDealListByArea(DealVo dealVo);

	int insertReview(PostVo postVo);
	
	List<PostVo> selectReview(ArticleVo articleVo);
	
	List<DealVo> selectMonthlyAng(DealVo dealVo);
	
	int insertReply(ReplyVo replyVo);
	
	List<ReplyVo> selectReply(int post_no);

	int deleteReply(int rpl_no);

	PostVo selectReviewByNo(String post_no);

	int deleteReview(String post_no);
	
	int deleteReviewChild(String post_no);

	int insertPicture(PictureVo pictureVo);

	List<PictureVo> selectReviewPic(PostVo postVo);

	AvgStatVo selectPriceStat(DealVo dealVo);

	Float selectMarketStat(String dong);

	Float selectHumanStat(String dong);

	int insertFavor(FavoriteVo favorVo);
	
	int deleteFavor(int favor_no);
	
	FavoriteVo selectFavor(FavoriteVo favorVo);
	
	int selectFavorCount(FavoriteVo favorVo);

	int insertReport(ReportVo rptVo);

	int deletePic(String pic_no);

	int updateReview(PostVo postVo);

	Float selectTrafficStat(DealVo dealVo);
}
