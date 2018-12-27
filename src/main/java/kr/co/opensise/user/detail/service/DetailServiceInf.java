package kr.co.opensise.user.detail.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;
import kr.co.opensise.admin.statis.model.FavoriteVo;
import kr.co.opensise.user.detail.model.PictureVo;
import kr.co.opensise.user.detail.model.PostVo;
import kr.co.opensise.user.detail.model.ReplyVo;
import kr.co.opensise.user.detail.model.ReportVo;
import kr.co.opensise.user.detail.model.Report_classfVo;

public interface DetailServiceInf {
	
	/*************************************************  
	* Method   : getDetailInfo 
	* 작성자 :  whdgn
	* 변경이력 :  2018. 12. 10.
	* @param articleVo
	* @param dl_ty
	* @return  
	* Method 설명 : 매물 정보를 위한 서비스 메서드
	* 건물 기본정보를 위한 articleVo, 건물 평수정보, 리뷰, 점수표를 리턴한다.
	* articleVo에는 주소 gu, dong, zip, rd 가 필요하고
	* dl_ty는 거래 구분(매매,전세,월세)을 의미한다
	* Map의 key는 selectArticleVo, selectAreas
	**************************************************/
	Map<String, Object> getDetailInfo(ArticleVo articleVo, String dl_ty);
	
	
	
	ArticleVo selectArticleVo(ArticleVo articleVo);
	
	
	/*************************************************  
	* Method   : getDetailTradeInfo 
	* 작성자 :  whdgn
	* 변경이력 :  2018. 12. 12.
	* @param articleVo
	* @param dl_ty
	* @param dl_excv_area
	* @return  Map<String, object>
	* Method 설명 : 평수 클릭시 요청되는 정보
	* selectAvgPrice : 1년간 해당 평수의 거래 평균
	* selectRecentTrade : 가장 최근 거래 내역
	* selectDealListByArea : 해당 평수의 모든 거래 내역
	**************************************************/
	Map<String, Object> getDetailTradeInfo(ArticleVo articleVo, String dl_ty, float dl_excv_area );
	
	int insertReview(PostVo postVo, List<MultipartFile> parts, String path);
	
	int insertReply(ReplyVo replyVo);
	
	List<ReplyVo> selectReply(int post_no);
	
	int deleteReply(int rpl_no);
	
	PostVo selectReviewByNo(String post_no);

	/*************************************************  
	* Method   : deleteReview 
	* 작성자 :  whdgn
	* 변경이력 :  2018. 12. 19.
	* @param post_no
	* @return  
	* Method 설명 : 삭제시 해당 리뷰를 부모로 하는
	* 자식 댓글까지 다 삭제한다
	**************************************************/
	int deleteReview(String post_no);


	/*************************************************  
	* Method   : selectReviewPic 
	* 작성자 :  whdgn
	* 변경이력 :  2018. 12. 19.
	* @param pictureVo
	* @return  
	* Method 설명 : 해당 리뷰의 사진 정보를 가져온다
	**************************************************/
	List<PictureVo> selectReviewPic(PostVo postVo);


	/*************************************************  
	* Method   : selectStat 
	* 작성자 :  whdgn
	* 변경이력 :  2018. 12. 20.
	* @param dealVo
	* @return  
	* Method 설명 : 통계 데이터 가져오기
	* priceStat
	* humanStat
	* marketStat
	**************************************************/
	Map<String, Float> selectStat(DealVo dealVo);
	
	
	int insertFavor(FavoriteVo favorVo);
	
	int deleteFavor(int favor_no);
	
	FavoriteVo selectFavor(FavoriteVo favorVo);
	
	int selectFavorCount(FavoriteVo favorVo);

	List<DealVo> selectTotalDealList(DealVo dealVo);

	/**
	* Method : getRpt_classf
	* 작성자 : Bella
	* 변경이력 :
	* @return
	* Method 설명 : 신고 분류 리스트 가져오기
	*/
	List<Report_classfVo> getRpt_classf();
	
	int insertReport(ReportVo rptVo);

	int deletePic(String pic_no);


	int updateReview(PostVo postVo, List<MultipartFile> parts, String path);
	
}

































