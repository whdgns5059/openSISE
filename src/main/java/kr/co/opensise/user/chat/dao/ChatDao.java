package kr.co.opensise.user.chat.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.opensise.member.Login.model.MemberVo;

@Repository
public class ChatDao implements ChatDaoInf{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	@Override
	public MemberVo selectMember(int mem_no) {
		return template.selectOne("chat.selectMemberByNo", mem_no);
	}

}
