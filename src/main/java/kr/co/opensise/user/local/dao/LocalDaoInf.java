package kr.co.opensise.user.local.dao;

import java.util.List;

import kr.co.opensise.user.local.model.HumanStatisVo;

public interface LocalDaoInf {
	
	/**  
	* Method   : hsDateSearch 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @return  
	* Method 설명 :  날짜 출력
	*/
	public List<HumanStatisVo> hsDateSearch();

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
	* Method   : humanAllTableList 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param humanVo
	* @return  
	* Method 설명 :  전체 인구 표 
	*/
	public List<HumanStatisVo> humanAllTableList(String dong);
	
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
	* Method   : humanAllStatisMinValue 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param dong
	* @return  
	* Method 설명 :  전체 인구 통계 최솟값
	*/
	public int humanAllStatisMinValue(String dong);
	
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
	* Method   : humanGndrStatisMinValue 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param dong
	* @return  
	* Method 설명 :  성별 인구 통계 최솟값
	*/
	public int humanGndrStatisMinValue(String dong);
	
	/**  
	* Method   : humanGndrStatisCricle 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param dong
	* @return  
	* Method 설명 : 남여 성비
	*/
	public List<HumanStatisVo> humanGndrStatisCricle(String dong);
	
	/**  
	* Method   : humanAgeStatistic 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param dong
	* @return  
	* Method 설명 :  동별, 연령별 인구 통계
	*/
	public List<HumanStatisVo> humanAgeStatistic(HumanStatisVo humanVo);
	
	/**  
	* Method   : humanAgeStatisMaxValue 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param dong
	* @return  
	* Method 설명 :  연령별 인구 통계 최댓값
	*/
	public int humanAgeStatisMaxValue(HumanStatisVo humanVo);
	
	
	/**  
	* Method   : humanAgeStatisMinValue 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param dong
	* @return  
	* Method 설명 : 연령별 인구 통계 최댓값
	*/
	public int humanAgeStatisMinValue(HumanStatisVo humanVo);
	
	
	/**  
	* Method   : ageList 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @return  
	* Method 설명 :  연령 리스트 출력
	*/
	public List<HumanStatisVo> ageList();
	
	/**  
	* Method   : ageCircle 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param humanVo
	* @return  
	* Method 설명 :  연령별 비율 그래프
	*/
	public List<HumanStatisVo> ageCircle(HumanStatisVo humanVo);
}
