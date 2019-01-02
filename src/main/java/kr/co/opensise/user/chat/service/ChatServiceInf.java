package kr.co.opensise.user.chat.service;

import kr.co.opensise.member.Login.model.MemberVo;

public interface ChatServiceInf {

	MemberVo selectMember(int mem_no);

}
