package kr.co.opensise.admin.manage.notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.opensise.admin.manage.member.model.PageVO;
import kr.co.opensise.admin.manage.notice.dao.NoticeDaoInf;
import kr.co.opensise.admin.manage.notice.model.PageVo;
import kr.co.opensise.admin.manage.review.model.ReviewVo;
import kr.co.opensise.user.detail.model.PostVo;

@Service
public class NoticeService implements NoticeServiceInf {

	@Resource(name="noticeDao")
	private NoticeDaoInf noticeDao;
	
	@Override
	public Map<String, Object> selectNoticeList(PageVo pageVo) {
		List<PostVo> noticeList = noticeDao.selectNoticeList(pageVo);
		
		int noticeCnt = noticeDao.noticeCnt();
		
		Map<String, Object> resultMap = new HashMap<>();
		
		resultMap.put("pageNoticeList", noticeList);
		resultMap.put("pageCnt", (int) Math.ceil((double) noticeCnt / pageVo.getPageSize()));
		return resultMap;
	}
	

	@Override
	public int insertNotice(PostVo noticeVo) {
		return noticeDao.insertNotice(noticeVo);
	}

	@Override
	public PostVo selectNotice(Integer post_no) {
		return noticeDao.selectNotice(post_no);
	}

	@Override
	public int updateNotice(PostVo noticeVo) {
		return noticeDao.updateNotice(noticeVo);
	}

	@Override
	public int deleteNotice(int post_no) {
		return noticeDao.deleteNotice(post_no);
	}


	@Override
	public int noticeCnt() {
		int noticeCnt = noticeDao.noticeCnt();
		
		int pageCnt = 0;
		if((noticeCnt % 10)==0) {
			pageCnt = noticeCnt/10;
		}else if((noticeCnt % 10)>0) {
			pageCnt = noticeCnt/10 +1;
		}
		
		return pageCnt;
	}


	@Override
	public List<PostVo> selectNoticeView() {
		return noticeDao.selectNoticeView();
	}

	

}
