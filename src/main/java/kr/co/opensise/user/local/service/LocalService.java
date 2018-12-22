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
	* Method   : humanAllStatistic 
	* 작성자 : 1003yd 
	* 변경이력 :  
	* @param dong
	* @return  
	* Method 설명 :  
	*/
	@Override
	public List<HumanStatisVo> humanAllStatistic(String dong) {
		// TODO Auto-generated method stub
		return localDao.humanAllStatistic(dong);
	}

	@Override
	public List<HumanStatisVo> humanGndrStatistic(String dong) {
		// TODO Auto-generated method stub
		return localDao.humanGndrStatistic(dong);
	}

	@Override
	public List<HumanStatisVo> humanAgeStatistic(String dong) {
		// TODO Auto-generated method stub
		return localDao.humanAgeStatistic(dong);
	}

}
