package kr.co.opensise.user.main.dao;

import java.util.List;
import java.util.Map;

import kr.co.opensise.user.main.model.BuildingSaleVo;

public interface MainDaoInf {
	/**  
	* Method   : buildingSaleList 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param searchMap
	* @return  
	* Method 설명 : 건물분류와 검색어를 바탕으로 매물리스트 검색  
	*/
	public List<BuildingSaleVo> buildingSaleList(Map<String, String> searchMap);
	

	
	
}
