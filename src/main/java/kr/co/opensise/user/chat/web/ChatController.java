package kr.co.opensise.user.chat.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.opensise.member.Login.model.MemberVo;
import kr.co.opensise.member.Login.service.LoginServiceInf;
import kr.co.opensise.user.chat.service.ChatServiceInf;

@RequestMapping("/chat")
@Controller
public class ChatController {

	@Resource(name="chatService")
	private ChatServiceInf chatService;
	
	@RequestMapping("/chatroom")
	public String chatroom(MemberVo memberVo, Model model) {
	
		MemberVo selmem = chatService.selectMember(memberVo.getMem_no());
	
		return "user/chat/chatroom";
	}
	
	@RequestMapping("/lobby")
	public String lobby() {
		
		return "user/chat/lobby";
	}

}
