package kr.co.opensise.admin.statis.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.opensise.admin.statis.dao.StatisDaoInf;
import kr.co.opensise.admin.statis.model.MemberVo;

@Service
public class StatisService implements StatisServiceInf {

	@Resource(name="statisDao")
	private StatisDaoInf statisDao;
	
	@Override
	public int countAllMembers() {
		return statisDao.countAllMembers();
	}

	@Override
	public int countSignIn() {
		return statisDao.countSignIn();
	}

	@Override
	public List<MemberVo> signInDaily() {
		return statisDao.signInDaily();
	}

	@Override
	public List<MemberVo> signOutDaily() {
		return statisDao.signOutDaily();
	}

}
