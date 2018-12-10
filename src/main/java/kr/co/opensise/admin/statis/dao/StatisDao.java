package kr.co.opensise.admin.statis.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
		// TODO Auto-generated method stub
		return 0;
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

}
