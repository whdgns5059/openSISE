package kr.co.opensise.user.local.service;

import java.util.List;

import kr.co.opensise.admin.manage.dataetc.model.StationVo;

public interface StationServiceInf {
	
	List<StationVo> selectStationList(StationVo sttnVo);

}
