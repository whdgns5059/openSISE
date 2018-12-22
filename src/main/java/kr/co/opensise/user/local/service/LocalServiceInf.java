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
	* Method   : humanGndrStatistic 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param dong
	* @return  
	* Method 설명 :  동별, 성별 인구 통계
	*/
	public List<HumanStatisVo> humanGndrStatistic(String dong);
	
	/**  
	* Method   : humanAgeStatistic 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param dong
	* @return  
	* Method 설명 :  동별, 연령별 인구 통계
	*/
	public List<HumanStatisVo> humanAgeStatistic(String dong);
}
