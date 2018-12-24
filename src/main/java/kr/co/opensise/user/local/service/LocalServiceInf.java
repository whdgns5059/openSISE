package kr.co.opensise.user.local.service;

import java.util.List;

import kr.co.opensise.user.local.model.HumanStatisVo;

public interface LocalServiceInf {
	/**  
	* Method   : humanAllStatistic 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param dong
	* @return  
	* Method 설명 :  동별 모든 인구 통계
	*/
	public List<HumanStatisVo> humanAllStatistic(String dong);
	
	/**  
	* Method   : humanAllStatisList 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param dong
	* @return  
	* Method 설명 : 전체 인구 통계 최댓값
	*/
	public int humanAllStatisMaxValue(String dong);
	
	/**  
	* Method   : humanGndrStatistic 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param dong
	* @return  
	* Method 설명 :  동별, 성별 인구 통계
	*/
	public List<HumanStatisVo> humanGndrStatistic(String dong);
	
	
	/**  
	* Method   : humanGndrStatisMaxValue 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param dong
	* @return  
	* Method 설명 :  성별 인구 통계 최댓값
	*/
	public int humanGndrStatisMaxValue(String dong);
	
	/**  
	* Method   : humanAgeStatistic 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param dong
	* @return  
	* Method 설명 :  동별, 연령별 인구 통계
	*/
	public List<HumanStatisVo> humanAgeStatistic(String dong);
	
	/**  
	* Method   : humanAgeStatisMaxValue 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param dong
	* @return  
	* Method 설명 :  연령별 인구 통계 최댓값
	*/
	public int humanAgeStatisMaxValue(String dong);
}
