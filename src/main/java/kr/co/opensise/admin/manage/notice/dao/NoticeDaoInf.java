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
	/**
	* Method : noticeCnt
	* 작성자 : ASUS
	* 변경이력 :
	* @return
	* Method 설명 :공지사항 게시글수 
	*/
	public int noticeCnt();
	/**
	* Method : insertNotice
	* 작성자 : ASUS
	* 변경이력 :
	* @param noticeVo
	* @return
	* Method 설명 :공지사항 등록
	*/
	public int insertNotice(PostVo noticeVo);
	/**
	* Method : selectNotice
	* 작성자 : ASUS
	* 변경이력 :
	* @param post_no
	* @return
	* Method 설명 :post_no에 해당하는 공지사항 출력
	*/
	public PostVo selectNotice(Integer post_no);
	/**
	* Method : updateNotice
	* 작성자 : ASUS
	* 변경이력 :
	* @param noticeVo
	* @return
	* Method 설명 :공지사항 수정
	*/
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
	* Method 설명 : 조건에 맞는 공지사항 게시글 검색
	*/
	public List<PostVo> searchNotice(PageVo pageVo);
	/**
	* Method : searchCnt
	* 작성자 : ASUS
	* 변경이력 :
	* @return
	* Method 설명 :검색된 게시글의 수
	*/
	public int searchCnt(PageVo pageVo);
}
