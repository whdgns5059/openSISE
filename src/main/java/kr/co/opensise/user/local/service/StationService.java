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

		List<StationVo> result = stationDao.selectStationList(sttnVo);
		
		for(StationVo sVo : result) {
			
			String tp = sVo.getBus_tp().trim();
			
			if(tp.equals("1")) {
				sVo.setBus_tp("급행");
			}else if(tp.equals("2")) {
				sVo.setBus_tp("간선");
			}else if(tp.equals("3")) {
				sVo.setBus_tp("지선");
			}else if(tp.equals("4")) {
				sVo.setBus_tp("외곽");
			}else if(tp.equals("5")) {
				sVo.setBus_tp("마을");
			}else if(tp.equals("6")) {
				sVo.setBus_tp("첨단");
			}
		}
		
		return result;

	}
}
