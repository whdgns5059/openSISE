package kr.co.opensise.admin.manage.notice.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.opensise.admin.manage.notice.model.PostVo;

@Repository
public class NoticeDao implements NoticeDaoInf {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	@Override
	public List<PostVo> selectNoticeList() {
		// TODO Auto-generated method stub
		return template.selectList("notice.selectPosts");
	}

}
