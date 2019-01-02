package kr.co.opensise.user.chat.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.opensise.member.Login.model.MemberVo;
import kr.co.opensise.user.chat.dao.ChatDaoInf;

@Service
public class ChatService implements ChatServiceInf{

	@Resource(name="chatDao")
	private ChatDaoInf chatDao;
	
	@Override
	public MemberVo selectMember(int mem_no) {
		return chatDao.selectMember(mem_no);
	}

}
