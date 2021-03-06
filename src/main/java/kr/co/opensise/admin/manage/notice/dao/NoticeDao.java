package kr.co.opensise.admin.manage.notice.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.opensise.admin.manage.notice.model.PageVo;
import kr.co.opensise.user.detail.model.PostVo;


@Repository
public class NoticeDao implements NoticeDaoInf {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	@Override
	public List<PostVo> selectNoticeList(PageVo pageVo) {
		return template.selectList("notice.selectPosts", pageVo);
	}

	@Override
	public int insertNotice(PostVo noticeVo) {
		return template.insert("notice.insertPost", noticeVo);
	}

	@Override
	public PostVo selectNotice(Integer post_no) {
		return template.selectOne("notice.selectPost", post_no);
	}

	@Override
	public int updateNotice(PostVo noticeVo) {
		return template.update("notice.updateNotice",noticeVo);
	}

	@Override
	public int deleteNotice(int post_no) {
		return template.delete("notice.deleteNotice", post_no);
	}

	@Override
	public int noticeCnt() {
		return template.selectOne("notice.getPostCnt");
	}

	@Override
	public List<PostVo> selectNoticeView() {
		return template.selectList("notice.selectNotice");
	}

	@Override
	public List<PostVo> searchNotice(PageVo pageVo) {
		return template.selectList("notice.searchNotice", pageVo);
	}

	@Override
	public int searchCnt(PageVo pageVo) {
		return template.selectOne("notice.searchCnt", pageVo);
	}

}
