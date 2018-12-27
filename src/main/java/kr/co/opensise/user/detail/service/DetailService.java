package kr.co.opensise.user.detail.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;
import kr.co.opensise.admin.statis.model.FavoriteVo;
import kr.co.opensise.user.detail.dao.DetailDaoInf;
import kr.co.opensise.user.detail.model.AvgStatVo;
import kr.co.opensise.user.detail.model.AvgTradeVo;
import kr.co.opensise.user.detail.model.PictureVo;
import kr.co.opensise.user.detail.model.PostVo;
import kr.co.opensise.user.detail.model.ReplyVo;
import kr.co.opensise.user.detail.model.ReportVo;
import kr.co.opensise.util.CommonUtil;

@Service
public class DetailService implements DetailServiceInf{

	@Resource(name="detailDao")
	private DetailDaoInf detailDao;
	
	@Override
	public Map<String, Object> getDetailInfo(ArticleVo articleVo, String dl_ty) {
		
		Map<String, Object> detailMap = new HashMap<String, Object>();
	
		articleVo.setArtcl_dl_ty(dl_ty);
		
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
		
		//selectRecentTrade : 가장 최근 거래 내역 
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
	public int insertReview(PostVo postVo, List<MultipartFile> parts, String path) {

		int insertResult = detailDao.insertReview(postVo);
		
		int post_no = postVo.getPost_no();
		
		insertFile(parts, path, post_no);
		
		
		return insertResult;
		
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

	@Override
	public List<PictureVo> selectReviewPic(PostVo postVo) {
		return detailDao.selectReviewPic(postVo);
	}

	@Override
	public Map<String, Float> selectStat(DealVo dealVo) {
		
		ArticleVo articleVo = new ArticleVo();
		articleVo.setArtcl_gu(dealVo.getDl_gu());
		articleVo.setArtcl_dong(dealVo.getDl_dong());
		articleVo.setArtcl_zip(dealVo.getDl_zip());
		articleVo.setArtcl_rd(dealVo.getDl_rd());
		
		
		ArticleVo selArticleVo = detailDao.selectArticle(articleVo);
		dealVo.setArtcl_bc(selArticleVo.getArtcl_bc());
		
		AvgStatVo priceStatVo= detailDao.selectPriceStat(dealVo);
		
		if(priceStatVo == null) {
			priceStatVo = new AvgStatVo(0f,0f,0f);
		}
		
		Float priceStat = 0f;

		if(dealVo.getDl_ty().equals("매매")) {
			priceStat = priceStatVo.getPrice_stat();
			priceStat /= 30;

		}else if(dealVo.getDl_ty().equals("전세")) {
			priceStat = priceStatVo.getDepos_stat();
			priceStat /= 30;

		}else if(dealVo.getDl_ty().equals("월세")) {
			priceStat = priceStatVo.getRnt_stat();

		}
		
		
		
		
		String dl_dong = dealVo.getDl_dong();
		String dong = dl_dong.substring(0, 2);
		
		Float marketStat = detailDao.selectMarketStat(dong);
		if(marketStat == null) {
			marketStat = 0f;
		}
		if(marketStat > 5f) {
			marketStat = 5f;
		}
		if(marketStat < -5f) {
			marketStat = -5f;
		}
		Float humanStat = detailDao.selectHumanStat(dong);
		if(humanStat == null) {
			humanStat = 0f;
		}
		if(humanStat > 5f) {
			humanStat = 5f;
		}
		if(humanStat < -5f) {
			humanStat = -5f;
		}
	
		Float trafficStat = detailDao.selectTrafficStat(dealVo);
		if(trafficStat == null) {
			trafficStat= 0f;
		}
		if(trafficStat> 5f) {
			trafficStat= 5f;
		}
		if(trafficStat< -5f) {
			trafficStat= -5f;
		}
		
		
		
		Map<String, Float> statMap = new HashMap<>();

		statMap.put("priceStat", priceStat);
		statMap.put("marketStat", marketStat);
		statMap.put("humanStat", humanStat);
		statMap.put("trafficStat", trafficStat);
		
		
		
		
		return statMap;
		
		
		
	}

	@Override
	public int insertFavor(FavoriteVo favorVo) {
		return detailDao.insertFavor(favorVo);
	}

	@Override
	public int deleteFavor(int favor_no) {
		return detailDao.deleteFavor(favor_no);
	}

	@Override
	public FavoriteVo selectFavor(FavoriteVo favorVo) {
		return detailDao.selectFavor(favorVo);
	}

	@Override
	public int selectFavorCount(FavoriteVo favorVo) {
		return detailDao.selectFavorCount(favorVo);
	}

	@Override
	public List<DealVo> selectTotalDealList(DealVo dealVo) {
		return detailDao.selectDealListByArea(dealVo);
	}

	@Override
	public int insertReport(ReportVo rptVo) {
		return detailDao.insertReport(rptVo);
	}

	@Override
	public int deletePic(String pic_no) {
		return detailDao.deletePic(pic_no);
	}

	@Override
	public int updateReview(PostVo postVo, List<MultipartFile> parts, String path) { 
		
		int result = detailDao.updateReview(postVo);
		
		if(!(parts.size() == 0 || parts == null || parts.isEmpty())) {
			insertFile(parts, path, postVo.getPost_no());
		}
		
		return result;
	}

	
	

	
	
	
	
	
	
	//파일 인서트 메소드...
	private void insertFile(List<MultipartFile> parts, String path, int post_no) {
		for(MultipartFile part : parts) {
			
			String uuidName = UUID.randomUUID().toString();
			String originalName = part.getOriginalFilename();
			String fileExt = CommonUtil.getFileExt(originalName);
			
			if(!(part.getSize() == 0 || part.isEmpty() || part.getOriginalFilename().equals(""))) {
				
				PictureVo pictureVo = new PictureVo();
				pictureVo.setPic_file_path("/reviewImg/"+uuidName+fileExt);
				pictureVo.setPic_file_nm(originalName);
				pictureVo.setPic_post(post_no);
				pictureVo.setPic_uuid(uuidName);
				
				File file = new File(path + File.separator + uuidName + fileExt);
				
				try {
					part.transferTo(file);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			
				int picInsert = detailDao.insertPicture(pictureVo);
				
				
			}
		}
	}


}





























