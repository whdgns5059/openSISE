package kr.co.opensise.user.main.service;

import java.util.List;
import java.util.Map;

import kr.co.opensise.user.main.model.BuildingSaleVo;
import kr.co.opensise.user.main.model.FilterVo;

public interface MainServiceInf {
	
	/**  
	* Method   : buildingSaleList 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param searchMap
	* @return  
	* Method 설명 : 건물분류와 검색어를 바탕으로 매물리스트 검색  
	*/
	public List<BuildingSaleVo> buildingSaleList(FilterVo filerVo);
	
	/**  
	* Method   : buildingSaleList 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param searchMap
	* @return  
	* Method 설명 : 단/다세대와 검색어를 바탕으로 매물리스트 검색  
	*/
	public List<BuildingSaleVo> buildingSingleSaleList(FilterVo filerVo);

	/**  
	 * Method   : buildingFilterList 
	 * 작성자 : 1003yd 
	 * 변경이력 :  
	 * @param filterVo
	 * @return  
	 * Method 설명 : 단/다세대 필터 적용한 매물리스트 검색
	 */
	public List<BuildingSaleVo> buildingSingleFilterList(FilterVo filterVo);
	
	
	/**  
	* Method   : buildingFilterList 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param filterVo
	* @return  
	* Method 설명 :  필터 적용한 매물리스트 검색
	*/
	public List<BuildingSaleVo> buildingFilterList(FilterVo filterVo);

}
