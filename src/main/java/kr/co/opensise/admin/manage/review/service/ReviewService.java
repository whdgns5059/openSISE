package kr.co.opensise.admin.manage.review.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.co.opensise.admin.manage.review.dao.ReviewDaoInf;
import kr.co.opensise.admin.manage.review.model.PageVo;
import kr.co.opensise.admin.manage.review.model.PictureVo;
import kr.co.opensise.admin.manage.review.model.ReportHistoryVo;
import kr.co.opensise.admin.manage.review.model.ReviewVo;

@Service
public class ReviewService implements ReviewServiceInf {
	@Resource
	private ReviewDaoInf reviewDao;
	
	Logger logger = LoggerFactory.getLogger(ReviewService.class);

	@Override
	public Map<String, Object> allReviewList(PageVo pageVo) {
		// TODO Auto-generated method stub
		List<ReviewVo> reviewList = reviewDao.allReviewList(pageVo);
		
		int totalReviewCnt = reviewDao.reviewCnt();
		
		Map<String, Object> resultMap = new HashMap<>();
		
		resultMap.put("pageReviewList", reviewList);
		resultMap.put("pageCnt", (int) Math.ceil((double) totalReviewCnt / pageVo.getPageSize()));
		
		return resultMap;
	}

	@Override
	public int cateReviewCnt(PageVo pageVo) {
		// TODO Auto-generated method stub
		int totalCateReivewCnt = reviewDao.cateReviewCnt(pageVo) ;
		logger.debug("service totalCateCnt : " + totalCateReivewCnt);
		int cateCnt = (int) Math.ceil((double) totalCateReivewCnt / pageVo.getPageSize());
		logger.debug("service cateCnt : " + cateCnt);
		return cateCnt;
	}

	@Override
	public int deleteReivew(ReviewVo reviewVo) {
		// TODO Auto-generated method stub
		return reviewDao.deleteReivew(reviewVo);
	}

	@Override
	public List<ReportHistoryVo> reportList(ReviewVo reviewVo) {
		// TODO Auto-generated method stub
		return reviewDao.reportList(reviewVo);
	}

	@Override
	public List<PictureVo> pictureList(ReviewVo reviewVo) {
		// TODO Auto-generated method stub
		return reviewDao.pictureList(reviewVo);
	}

}
