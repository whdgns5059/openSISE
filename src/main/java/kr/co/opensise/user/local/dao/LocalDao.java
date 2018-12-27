package kr.co.opensise.user.local.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.opensise.user.local.model.HumanStatisVo;

@Repository
public class LocalDao implements LocalDaoInf {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	/**  
	* Method   : hsDateSearch 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @return  
	* Method 설명 :  날짜 출력
	*/
	@Override
	public List<HumanStatisVo> hsDateSearch() {
		// TODO Auto-generated method stub
		return template.selectList("local.hsDateSearch");
	}

	/**  
	* Method   : humanAllStatistic 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param dong
	* @return  
	* Method 설명 :  월별 전체 인구 통계
	*/
	@Override
	public List<HumanStatisVo> humanAllStatistic(String dong) {
		// TODO Auto-generated method stub
		return template.selectList("local.allHumanStatis", dong);
	}

	/**  
	* Method   : humanGndrStatistic 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param dong
	* @return  
	* Method 설명 :  월별 , 성별 인구 통계
	*/
	@Override
	public List<HumanStatisVo> humanGndrStatistic(String dong) {
		// TODO Auto-generated method stub
		return template.selectList("local.gndrHumanStatis", dong);
	}

	/**  
	* Method   : humanAgeStatistic 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param dong
	* @return  
	* Method 설명 :  월별, 연령별 인구 통계
	*/
	@Override
	public List<HumanStatisVo> humanAgeStatistic(HumanStatisVo humanVo) {
		// TODO Auto-generated method stub
		return template.selectList("local.ageHumanStatis", humanVo);
	}

	/**  
	* Method   : humanAllStatisMaxValue 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param dong
	* @return  
	* Method 설명 :  전체 인구 통계 최댓값
	*/
	@Override
	public int humanAllStatisMaxValue(String dong) {
		// TODO Auto-generated method stub
		return template.selectOne("local.allHumanStatisMaxValue", dong);
	}

	/**  
	* Method   : humanGndrStatisMaxValue 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param dong
	* @return  
	* Method 설명 :  성별 인구 통계 최댓값
	*/
	@Override
	public int humanGndrStatisMaxValue(String dong) {
		// TODO Auto-generated method stub
		return template.selectOne("local.gndrHumanStatisMaxValue", dong);
	}

	/**  
	* Method   : humanAgeStatisMaxValue 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param dong
	* @return  
	* Method 설명 :  연령별 인구 통계 최댓값
	*/
	@Override
	public int humanAgeStatisMaxValue(HumanStatisVo humanVo) {
		// TODO Auto-generated method stub
		return template.selectOne("local.ageHumanStatisMaxValue", humanVo);
	}

	@Override
	public int humanAllStatisMinValue(String dong) {
		// TODO Auto-generated method stub
		return template.selectOne("local.allHumanStatisMinValue", dong);
	}

	@Override
	public int humanGndrStatisMinValue(String dong) {
		// TODO Auto-generated method stub
		return template.selectOne("local.gndrHumanStatisMinValue", dong);
	}

	@Override
	public int humanAgeStatisMinValue(HumanStatisVo humanVo) {
		// TODO Auto-generated method stub
		return template.selectOne("local.ageHumanStatisMinValue", humanVo);
	}

	@Override
	public List<HumanStatisVo> humanGndrStatisCricle(String dong) {
		// TODO Auto-generated method stub
		return template.selectList("local.gndrHumanStatisCricle", dong);
	}

	@Override
	public List<HumanStatisVo> ageList() {
		// TODO Auto-generated method stub
		return template.selectList("local.ageList");
	}

	@Override
	public List<HumanStatisVo> ageCircle(HumanStatisVo humanVo) {
		// TODO Auto-generated method stub
		return template.selectList("local.ageCircle", humanVo);
	}

	@Override
	public List<HumanStatisVo> humanAllTableList(String dong) {
		// TODO Auto-generated method stub
		return template.selectList("local.allHumanTableList", dong);
	}

	

}
