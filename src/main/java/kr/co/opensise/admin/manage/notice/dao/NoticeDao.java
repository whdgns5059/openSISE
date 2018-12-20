package kr.co.opensise.admin.manage.notice.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.opensise.user.detail.model.PostVo;


@Repository
public class NoticeDao implements NoticeDaoInf {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	@Override
	public List<PostVo> selectNoticeList() {
		return template.selectList("notice.selectPosts");
	}

	@Override
	public int insertNotice(PostVo noticeVo) {
		return template.insert("notice.insertPost", noticeVo);
	}

}
