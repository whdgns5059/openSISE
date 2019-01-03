package kr.co.opensise.user.chat.dao;

import kr.co.opensise.member.Login.model.MemberVo;

public interface ChatDaoInf {

	MemberVo selectMember(int mem_no);

}
