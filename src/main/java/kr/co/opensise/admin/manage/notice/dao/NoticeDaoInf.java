package kr.co.opensise.admin.manage.notice.dao;

import java.util.List;

import kr.co.opensise.admin.manage.notice.model.PageVo;
import kr.co.opensise.user.detail.model.PostVo;


public interface NoticeDaoInf {
	/**
	* Method : selectNoticeList
	* 작성자 : ASUS
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 페이징 처리한 공지사항 list
	*/
	public List<PostVo> selectNoticeList(PageVo pageVo);
	/**
	* Method : selectNoticeView
	* 작성자 : ASUS
	* 변경이력 :
	* @return
	* Method 설명 :공지사항 리스트출력
	*/
	public List<PostVo> selectNoticeView();
	public int noticeCnt();
	public int insertNotice(PostVo noticeVo);
	public PostVo selectNotice(Integer post_no);
	public int updateNotice(PostVo noticeVo);
	/**
	* Method : deleteNotice
	* 작성자 : ASUS
	* 변경이력 :2019.01.02
	* @param post_no
	* @return
	* Method 설명 :공지사항 지우기
	*/
	public int deleteNotice(int post_no);
}
