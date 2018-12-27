package kr.co.opensise.user.local.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.opensise.user.local.dao.LocalDaoInf;
import kr.co.opensise.user.local.model.HumanStatisVo;

@Service
public class LocalService implements LocalServiceInf {
	
	
	@Resource
	private LocalDaoInf localDao;
	
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
		return localDao.hsDateSearch();
	}
	

	/**  
	* Method   : humanAllStatistic 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param dong
	* @return  
	* Method 설명 :인구 전체 통계  
	*/
	@Override
	public List<HumanStatisVo> humanAllStatistic(String dong) {
		// TODO Auto-generated method stub
		return localDao.humanAllStatistic(dong);
	}

	/**  
	* Method   : humanGndrStatistic 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param dong
	* @return  
	* Method 설명 : 성별 인구 통계  
	*/
	@Override
	public List<HumanStatisVo> humanGndrStatistic(String dong) {
		// TODO Auto-generated method stub
		return localDao.humanGndrStatistic(dong);
	}

	/**  
	* Method   : humanAgeStatistic 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param dong
	* @return  
	* Method 설명 :  연령별 인구 통계
	*/
	@Override
	public List<HumanStatisVo> humanAgeStatistic(HumanStatisVo humanVo) {
		// TODO Auto-generated method stub
		return localDao.humanAgeStatistic(humanVo);
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
		return localDao.humanAllStatisMaxValue(dong);
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
		return localDao.humanGndrStatisMaxValue(dong);
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
		return localDao.humanAgeStatisMaxValue(humanVo);
	}


	@Override
	public int humanAllStatisMinValue(String dong) {
		// TODO Auto-generated method stub
		return localDao.humanAllStatisMinValue(dong);
	}


	@Override
	public int humanGndrStatisMinValue(String dong) {
		// TODO Auto-generated method stub
		return localDao.humanGndrStatisMinValue(dong);
	}


	@Override
	public int humanAgeStatisMinValue(HumanStatisVo humanVo) {
		// TODO Auto-generated method stub
		return localDao.humanAgeStatisMinValue(humanVo);
	}


	@Override
	public List<HumanStatisVo> humanGndrStatisCricle(String dong) {
		// TODO Auto-generated method stub
		return localDao.humanGndrStatisCricle(dong);
	}


	@Override
	public List<HumanStatisVo> ageList() {
		// TODO Auto-generated method stub
		return localDao.ageList();
	}


	@Override
	public List<HumanStatisVo> ageCircle(HumanStatisVo humanVo) {
		// TODO Auto-generated method stub
		return localDao.ageCircle(humanVo);
	}


	@Override
	public List<HumanStatisVo> humanAllTableList(String dong) {
		// TODO Auto-generated method stub
		return localDao.humanAllTableList(dong);
	}



}
