package kr.co.opensise.admin.manage.review.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.opensise.admin.manage.review.model.PageVo;
import kr.co.opensise.admin.manage.review.model.ReviewVo;

@Repository
public class ReviewDao implements ReviewDaoInf {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;

	@Override
	public List<ReviewVo> allReviewList(PageVo pageVo) {
		// TODO Auto-generated method stub
		return template.selectList("review.searchAllReview", pageVo);
	}

	@Override
	public int cateReviewCnt(PageVo pageVo) {
		// TODO Auto-generated method stub
		return template.selectOne("review.cateSearchCnt", pageVo);
	}

	@Override
	public int reviewCnt() {
		// TODO Auto-generated method stub
		return template.selectOne("review.reviewCnt");
	}

}
