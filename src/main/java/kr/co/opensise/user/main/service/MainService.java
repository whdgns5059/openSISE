package kr.co.opensise.user.main.service;

import javax.annotation.Resource;

import kr.co.opensise.user.main.dao.MainDaoInf;

public class MainService implements MainServiceInf {
	
	@Resource(name = "mainDao")
	MainDaoInf mainDao;

}
