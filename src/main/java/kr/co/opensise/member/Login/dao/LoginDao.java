package kr.co.opensise.member.Login.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.opensise.member.Login.model.MemberVo;

@Repository
public class LoginDao implements LoginDaoInf{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	// È¸¿ø
	@Override
	public MemberVo selectMember(String mem_email) {
		MemberVo user = template.selectOne("member.selectMember", mem_email);
		return user;
	}
}
