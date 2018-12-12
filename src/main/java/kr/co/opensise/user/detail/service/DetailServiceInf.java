package kr.co.opensise.user.detail.service;

import java.util.Map;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;

public interface DetailServiceInf {
	
	/*************************************************  
	* Method   : getDetailInfo 
	* 작성자 :  whdgn
	* 변경이력 :  2018. 12. 10.
	* @param articleVo
	* @param dl_ty
	* @return  
	* Method 설명 : 매물 상제정보를 위한 서비스 메서드
	* articleVo에는 주소 gu, dong, zip, rd 가 필요하고
	* dl_ty는 거래 구분(매매,전세,월세)을 의미한다
	* Map의 key는 selectArticleVo, selectDealVoList
	**************************************************/
	Map<String, Object> getDetailInfo(ArticleVo articleVo, String dl_ty);
	
	
	ArticleVo selectArticleVo(ArticleVo articleVo);
		

}
