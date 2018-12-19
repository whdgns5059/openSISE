package kr.co.opensise.admin.manage.notice.dao;

import java.util.List;

import kr.co.opensise.admin.manage.notice.model.PostVo;

public interface NoticeDaoInf {
	public List<PostVo> selectNoticeList();
	public int insertNotice(PostVo noticeVo);
}
