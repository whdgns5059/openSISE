package kr.co.opensise.user.main.dao;

import java.util.List;

public interface MainDaoInf {
	
	/**  
	* Method  : searchBuildingList 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param building
	* @param searchText
	* @return  
	* Method 설명 : 건물 분류와 검색명으로 매물리스트 조회  
	*/
	public List searchBuildingList(String building, String searchText);
	
	
}
