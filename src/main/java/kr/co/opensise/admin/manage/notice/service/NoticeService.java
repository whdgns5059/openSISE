package kr.co.opensise.admin.manage.notice.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.opensise.admin.manage.notice.dao.NoticeDaoInf;
import kr.co.opensise.admin.manage.notice.model.PostVo;

@Service
public class NoticeService implements NoticeServiceInf {

	@Resource(name="noticeDao")
	private NoticeDaoInf noticeDao;
	
	@Override
	public List<PostVo> selectNoticeList() {
		return noticeDao.selectNoticeList();
	}

	@Override
	public int insertNotice(PostVo noticeVo) {
		return noticeDao.insertNotice(noticeVo);
	}

}
