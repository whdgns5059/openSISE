package kr.co.opensise.admin.statis.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.opensise.admin.statis.dao.StatisDaoInf;
import kr.co.opensise.admin.statis.model.FavoriteVo;
import kr.co.opensise.admin.statis.model.InterestVo;
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

	@Override
	public List<MemberVo> signInMonthly() {
		return statisDao.signInMonthly();
	}

	@Override
	public List<MemberVo> signOutMonthly() {
		return statisDao.signOutMonthly();
	}

	@Override
	public Map<String, List<MemberVo>> signInAgeGndr() {
		List<MemberVo> memVoAll = statisDao.signInAgeGndr();
		
		List<MemberVo> memVoM = new ArrayList<MemberVo>();
		List<MemberVo> memVoF = new ArrayList<MemberVo>();
		
		for(MemberVo memVo : memVoAll) {
			if(memVo.getMem_gndr().equals("M")) 
				memVoM.add(memVo);
			else if(memVo.getMem_gndr().equals("F"))
				memVoF.add(memVo);
		}
		
		Map<String, List<MemberVo>> memVoAgeGndr = new HashMap<String, List<MemberVo>>();
		memVoAgeGndr.put("M", memVoM);
		memVoAgeGndr.put("F", memVoF);
	
		return memVoAgeGndr;
	}

	@Override
	public List<FavoriteVo> favorEach() {
		return statisDao.favorEach();
	}

	@Override
	public List<FavoriteVo> favorDong() {
		return statisDao.favorDong();
	}
	
	@Override
	public List<FavoriteVo> favorGu() {
		return statisDao.favorGu();
	}

	@Override
	public int countAllIntrst() {
		return statisDao.countAllIntrst();
	}

	@Override
	public List<InterestVo> intrstAll() {
		return statisDao.intrstAll();
	}

	@Override
	public List<String> ageList() {
		return statisDao.ageList();
	}
	
	@Override
	public List<InterestVo> intrstAge(String mem_age) {
		// 전연령대일 경우 처리
		if(mem_age.equals("allAge"))
			mem_age = null;
		
		return statisDao.intrstAge(mem_age);
	}

	@Override
	public int insertVisitor() {
		return statisDao.insertVisitor();
	}




	

}
