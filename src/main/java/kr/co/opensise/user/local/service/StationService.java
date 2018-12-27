package kr.co.opensise.user.local.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.opensise.admin.manage.dataetc.model.StationVo;
import kr.co.opensise.user.local.dao.StationDaoInf;

@Service
public class StationService implements StationServiceInf{

	@Resource(name="stationDao")
	private StationDaoInf  stationDao;
	
	@Override
	public List<StationVo> selectStationList(StationVo sttnVo) {
		return stationDao.selectStationList(sttnVo);
	}

}
