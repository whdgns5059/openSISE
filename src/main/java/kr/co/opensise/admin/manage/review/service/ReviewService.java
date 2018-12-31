package kr.co.opensise.admin.manage.review.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.opensise.admin.manage.review.dao.ReviewDaoInf;
import kr.co.opensise.admin.manage.review.model.PageVo;
import kr.co.opensise.admin.manage.review.model.ReviewVo;

@Service
public class ReviewService implements ReviewServiceInf {
	@Resource
	private ReviewDaoInf reviewDao;

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
		int cateCnt = (int) Math.ceil((double) totalCateReivewCnt / pageVo.getPageSize());
		return cateCnt;
	}

}
