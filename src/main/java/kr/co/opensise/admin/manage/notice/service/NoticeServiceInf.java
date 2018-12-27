package kr.co.opensise.admin.manage.notice.service;

import java.util.List;

import kr.co.opensise.user.detail.model.PostVo;


public interface NoticeServiceInf {
	public List<PostVo> selectNoticeList();
	public int insertNotice(PostVo noticeVo);
	public PostVo selectNotice(Integer post_no);
}
