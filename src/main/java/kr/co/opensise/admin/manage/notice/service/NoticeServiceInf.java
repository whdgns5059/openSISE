package kr.co.opensise.admin.manage.notice.service;

import java.util.List;
import java.util.Map;

import kr.co.opensise.admin.manage.notice.model.PageVo;
import kr.co.opensise.user.detail.model.PostVo;


public interface NoticeServiceInf {
	/**
	* Method : selectNoticeList
	* 작성자 : ASUS
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 :페이징처리하여 공지사항 리스트 부르기
	*/
	public Map<String, Object> selectNoticeList(PageVo pageVo);
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
	/**
	* Method : searchNotice
	* 작성자 : ASUS
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 조건에 맞는 공지사항 게시글 검색,페이징처리
	*/
	public Map<String, Object> searchNotice(PageVo pageVo);
	/**
	* Method : searchCnt
	* 작성자 : ASUS
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 :검색된 게시글 수
	*/
	public int searchCnt(PageVo pageVo);
}
