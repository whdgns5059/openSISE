package kr.co.opensise.user.detail.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;
import kr.co.opensise.user.detail.dao.DetailDaoInf;
import kr.co.opensise.user.detail.model.AvgTradeVo;
import kr.co.opensise.user.detail.model.PostVo;
import kr.co.opensise.user.detail.model.ReplyVo;

@Service
public class DetailService implements DetailServiceInf{

	@Resource(name="detailDao")
	private DetailDaoInf detailDao;
	
	@Override
	public Map<String, Object> getDetailInfo(ArticleVo articleVo, String dl_ty) {
		
		Map<String, Object> detailMap = new HashMap<String, Object>();
		
		//select를 위한 articleVo는 그대로 가면 됨.., DealVo 생성
		DealVo dealVo = new DealVo();
		dealVo.setDl_gu(articleVo.getArtcl_gu());
		dealVo.setDl_dong(articleVo.getArtcl_dong());
		dealVo.setDl_zip(articleVo.getArtcl_zip());
		dealVo.setDl_rd(articleVo.getArtcl_rd());
		dealVo.setDl_ty(dl_ty);
		
		ArticleVo selectArticleVo = detailDao.selectArticle(articleVo);
		detailMap.put("selectArticleVo", selectArticleVo);
		
		List<String> selectAreas = detailDao.selectAreas(articleVo);
		detailMap.put("selectAreas", selectAreas);
		
		List<PostVo> selectReview = detailDao.selectReview(articleVo);
		detailMap.put("selectReview", selectReview);

		return detailMap;
	}

	@Override
	public ArticleVo selectArticleVo(ArticleVo articleVo) {
		return detailDao.selectArticle(articleVo);
	}

	@Override
	public Map<String, Object> getDetailTradeInfo(ArticleVo articleVo, String dl_ty, float dl_excv_area) {
		
		Map<String, Object> tradeInfoMap = new HashMap<>();
		
		//dealVo 생성..
		DealVo dealVo = new DealVo();
		dealVo.setDl_gu(articleVo.getArtcl_gu());
		dealVo.setDl_dong(articleVo.getArtcl_dong());
		dealVo.setDl_zip(articleVo.getArtcl_zip());
		dealVo.setDl_rd(articleVo.getArtcl_rd());
		dealVo.setDl_ty(dl_ty);
		dealVo.setDl_excv_area(dl_excv_area);
		
		//selectAvgPrice : 1년간 해당 평수의 거래 평균 
		AvgTradeVo avgTradeVo = detailDao.selectAvgPrice(dealVo);
		
		//selectRecentTrade : 가장 최근 거래 내역 s
		List<DealVo> recentTradeVo = detailDao.selectRecentTrade(dealVo);
		
		//electDealListByArea : 해당 평수의 모든 거래 내역
		List<DealVo> dealListByArea = detailDao.selectDealListByArea(dealVo);
		
		//montylyAvf : 월별 평균 거래가
		List<DealVo> monthlyAvg = detailDao.selectMonthlyAng(dealVo);
		
		tradeInfoMap.put("avgTradeVo",avgTradeVo);
		tradeInfoMap.put("recentTradeVo", recentTradeVo);
		tradeInfoMap.put("dealListByArea", dealListByArea);
		tradeInfoMap.put("monthlyAvg", monthlyAvg);
		
		return tradeInfoMap;
	}

	@Override
	public int insertReview(PostVo postVo) {
		return detailDao.insertReview(postVo);
	}

	@Override
	public int insertReply(ReplyVo replyVo) {
		return detailDao.insertReply(replyVo);
	}

	@Override
	public List<ReplyVo> selectReply(int post_no) {
		return detailDao.selectReply(post_no);
	}

	@Override
	public int deleteReply(int rpl_no) {
		return detailDao.deleteReply(rpl_no);
	}

	@Override
	public PostVo selectReviewByNo(String post_no) {
		return detailDao.selectReviewByNo(post_no);
	}

	@Override
	public int deleteReview(String post_no) {
		detailDao.deleteReviewChild(post_no);
		return detailDao.deleteReview(post_no);
	}

	
	



}





























