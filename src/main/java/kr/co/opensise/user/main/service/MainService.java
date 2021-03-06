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
	public List<BuildingSaleVo> buildingSaleList(FilterVo filerVo) {
		// TODO Auto-generated method stub
		return mainDao.buildingSaleList(filerVo);
	}

	@Override
	public List<BuildingSaleVo> buildingFilterList(FilterVo filterVo) {
		// TODO Auto-generated method stub
		return mainDao.buildingFilterList(filterVo);
	}

	@Override
	public List<BuildingSaleVo> buildingSingleSaleList(FilterVo filerVo) {
		// TODO Auto-generated method stub
		return mainDao.buildingSingleSaleList(filerVo);
	}

	@Override
	public List<BuildingSaleVo> buildingSingleFilterList(FilterVo filterVo) {
		// TODO Auto-generated method stub
		return mainDao.buildingSingleFilterList(filterVo);
	}

	@Override
	public FilterVo miniMaxPriceSerach(FilterVo filterVo) {
		// TODO Auto-generated method stub
		return mainDao.miniMaxPriceSerach(filterVo);
	}

}
