package kr.co.opensise.user.detail.service;

import java.util.List;
import java.util.Map;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.user.detail.model.PostVo;
import kr.co.opensise.user.detail.model.ReplyVo;

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
	
	int insertReview(PostVo postVo);
	
	
	int insertReply(ReplyVo replyVo);
	
	List<ReplyVo> selectReply(int post_no);
	
	
	
	
}

































