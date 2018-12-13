package kr.co.opensise.admin.statis.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.opensise.admin.statis.model.FavoriteVo;
import kr.co.opensise.admin.statis.model.MemberVo;


@Repository
public class StatisDao implements StatisDaoInf {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	@Override
	public int countAllMembers() {
		int countAllMembers = template.selectOne("admin_statis.countAllMembers");
		return countAllMembers;
	}

	@Override
	public int countSignIn() {
		int countSignIn = template.selectOne("admin_statis.countSignIn");
		return countSignIn;
	}

	@Override
	public List<MemberVo> signInDaily() {
		List<MemberVo> memVoList = template.selectList("admin_statis.signInDaily");
		return memVoList;
	}

	@Override
	public List<MemberVo> signOutDaily() {
		List<MemberVo> memVoList = template.selectList("admin_statis.signOutDaily");
		return memVoList;
	}

	@Override
	public List<MemberVo> signInMonthly() {
		List<MemberVo> memVoList = template.selectList("admin_statis.signInMonthly");
		return memVoList;
	}

	@Override
	public List<MemberVo> signOutMonthly() {
		List<MemberVo> memVoList = template.selectList("admin_statis.signOutMonthly");
		return memVoList;
	}

	@Override
	public List<MemberVo> signInAgeGndr() {
		List<MemberVo> memVoList = template.selectList("admin_statis.signInAgeGndr");
		return memVoList;
	}
	
	@Override
	public List<FavoriteVo> favorEach() {
		List<FavoriteVo> favorVoList = template.selectList("admin_statis.favorEach");
		return favorVoList;
	}
	
	@Override
	public List<FavoriteVo> favorDong() {
		List<FavoriteVo> favorVoList = template.selectList("admin_statis.favorDong");
		return favorVoList;
	}

	@Override
	public List<FavoriteVo> favorGu() {
		List<FavoriteVo> favorVoList = template.selectList("admin_statis.favorGu");
		return favorVoList;
	}

	
	
	
	
	
	
	
	
	
//	@Override
//	public int test(MemberVo memVo) {
//		int cnt = template.insert("admin_statis.test",memVo);
//		return cnt;
//	}
	

	
	

}
