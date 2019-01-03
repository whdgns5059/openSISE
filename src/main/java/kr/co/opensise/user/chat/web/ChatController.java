package kr.co.opensise.user.chat.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.opensise.member.Login.model.MemberVo;
import kr.co.opensise.user.chat.model.ChatVo;
import kr.co.opensise.user.chat.service.ChatServiceInf;

@RequestMapping("/chat")
@Controller
public class ChatController {

	@Resource(name="chatService")
	private ChatServiceInf chatService;
	
	@Autowired
	private ServletContext context;
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/chatroom")
	public String chatroom(@RequestParam("mem_no") int mem_no, Model model) {

		MemberVo selmem = chatService.selectMember(mem_no);
	
		if(selmem.getMem_mngr() == null || !(selmem.getMem_mngr().equals("Y"))) {
			
			List<ChatVo> chatList = (List<ChatVo>) context.getAttribute("chatList");
			
			if(chatList == null) {
				chatList = new ArrayList<>();
				context.setAttribute("chatList", chatList);
			}
			
			ChatVo chatVo = new ChatVo();
			chatVo.setChat_mem_no(selmem.getMem_no());
			chatVo.setChat_mem_name(selmem.getMem_nm());
			chatVo.setChat_create_time(new Date());
			
			chatList.add(chatVo);

		}
		
		
		model.addAttribute("memberVo", selmem);
	
		return "user/chat/chating";
	}
	
	@RequestMapping("/lobby")
	public String lobby(MemberVo memberVo, Model model ) {
		
		MemberVo selmem = chatService.selectMember(memberVo.getMem_no());
		
		model.addAttribute("selMem", selmem);

		return "user/chat/lobby";
	}

}
