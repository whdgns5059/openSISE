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
	public List<BuildingSaleVo> buildingSaleList(Map<String, String> searchMap) {
		// TODO Auto-generated method stub
		return template.selectList("map.searchList",searchMap);
	}

	@Override
	public List<BuildingSaleVo> buildingFilterList(FilterVo filterVo) {
		// TODO Auto-generated method stub
		return template.selectList("map.searchFilterList", filterVo);
	}

	
	
}
