package kr.co.opensise.user.main.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.opensise.user.main.model.BuildingSaleVo;
import kr.co.opensise.user.main.model.FilterVo;

@Repository
public class MainDao implements MainDaoInf {
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;

	/**  
	* Method   : buildingSaleList 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param searchMap
	* @return  
	* Method 설명 :  건물 분류와 검색어를 바탕으로 매물리스트 검색
	*/
	@Override
	public List<BuildingSaleVo> buildingSaleList(FilterVo filterVo) {
		// TODO Auto-generated method stub
		return template.selectList("map.searchList",filterVo);
	}

	/**  
	* Method   : buildingFilterList 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param filterVo
	* @return  
	* Method 설명 :  필터 적용한 매물리스트 검색
	*/
	@Override
	public List<BuildingSaleVo> buildingFilterList(FilterVo filterVo) {
		// TODO Auto-generated method stub
		return template.selectList("map.searchFilterList", filterVo);
	}

	/**  
	* Method   : buildingSingleSaleList 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param searchMap
	* @return  
	* Method 설명 :  단/다세대와 검색어를 바탕으로 매물리스트 검색 
	*/
	@Override
	public List<BuildingSaleVo> buildingSingleSaleList(FilterVo filterVo) {
		// TODO Auto-generated method stub
		return template.selectList("map.searchSingleList",filterVo);
	}

	/**  
	* Method   : buildingSingleFilterList 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param filterVo
	* @return  
	* Method 설명 :  단/다세대 필터 적용한 매물리스트 검색
	*/
	@Override
	public List<BuildingSaleVo> buildingSingleFilterList(FilterVo filterVo) {
		// TODO Auto-generated method stub
		return template.selectList("map.searchSingleFilterList",filterVo);
	}

	/**  
	* Method   : miniMaxPriceSerach
	* 작성자 :1003yd
	* 변경이력 :  
	* @param filterVo
	* @return 
	* Method 설명 : 건물 형태와 매물 형태에 따른 가격의 최대, 최솟값
	*/
	@Override
	public FilterVo miniMaxPriceSerach(FilterVo filterVo) {
		// TODO Auto-generated method stub
		return template.selectOne("map.miniMaxPriceSearch", filterVo);
	}

	
	
}
