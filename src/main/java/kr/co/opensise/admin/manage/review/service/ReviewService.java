package kr.co.opensise.admin.manage.review.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.opensise.admin.manage.review.dao.ReviewDaoInf;
import kr.co.opensise.admin.manage.review.model.ReviewVo;

@Service
public class ReviewService implements ReviewServiceInf {
	@Resource
	private ReviewDaoInf reviewDao;

	@Override
	public List<ReviewVo> allReviewList() {
		// TODO Auto-generated method stub
		return reviewDao.allReviewList();
	}

	@Override
	public List<ReviewVo> cateReviewList(Map<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return reviewDao.cateReviewList(searchMap);
	}

}
