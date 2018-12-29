package kr.co.opensise.admin.manage.review.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.opensise.admin.manage.review.model.ReviewVo;

@Repository
public class ReviewDao implements ReviewDaoInf {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;

	@Override
	public List<ReviewVo> allReviewList() {
		// TODO Auto-generated method stub
		return template.selectList("review.searchAllReview");
	}

	@Override
	public List<ReviewVo> cateReviewList(Map<String, String> searchMap) {
		// TODO Auto-generated method stub
		return template.selectList("review.cateSearchList", searchMap);
	}

}