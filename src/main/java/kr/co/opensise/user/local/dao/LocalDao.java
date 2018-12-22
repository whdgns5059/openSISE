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
	public List<HumanStatisVo> humanAgeStatistic(String dong) {
		// TODO Auto-generated method stub
		return template.selectList("local.ageHumanStatis", dong);
	}

}
