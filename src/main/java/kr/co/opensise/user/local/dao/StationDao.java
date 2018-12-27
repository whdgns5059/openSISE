package kr.co.opensise.user.local.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.opensise.admin.manage.dataetc.model.StationVo;
import kr.co.opensise.user.local.service.StationServiceInf;

@Repository
public class StationDao implements StationDaoInf{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	@Override
	public List<StationVo> selectStationList(StationVo sttnVo) {
		return template.selectList("station.selectStationList", sttnVo);
	}

}
