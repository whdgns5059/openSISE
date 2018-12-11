package kr.co.opensise.user.main.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.opensise.user.main.dao.MainDaoInf;
import kr.co.opensise.user.main.model.BuildingSaleVo;
import kr.co.opensise.user.main.model.FilterVo;

@Service
public class MainService implements MainServiceInf {
	
	@Resource(name = "mainDao")
	MainDaoInf mainDao;

	@Override
	public List<BuildingSaleVo> buildingSaleList(Map<String, String> searchMap) {
		// TODO Auto-generated method stub
		return mainDao.buildingSaleList(searchMap);
	}

	@Override
	public List<BuildingSaleVo> buildingFilterList(FilterVo filterVo) {
		// TODO Auto-generated method stub
		return mainDao.buildingFilterList(filterVo);
	}

}
