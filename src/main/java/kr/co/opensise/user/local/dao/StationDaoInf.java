package kr.co.opensise.user.local.dao;

import java.util.List;

import kr.co.opensise.admin.manage.dataetc.model.StationVo;

public interface StationDaoInf {
	
	List<StationVo> selectStationList(StationVo sttnVo);
	
}
