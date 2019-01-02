package kr.co.opensise.user.chat.model;

import java.util.Date;

public class ChatVo {
	
	private int chat_mem_no;
	private String chat_mem_name;
	private Date chat_create_time;
	public int getChat_mem_no() {
		return chat_mem_no;
	}
	public void setChat_mem_no(int chat_mem_no) {
		this.chat_mem_no = chat_mem_no;
	}
	public String getChat_mem_name() {
		return chat_mem_name;
	}
	public void setChat_mem_name(String chat_mem_name) {
		this.chat_mem_name = chat_mem_name;
	}
	public Date getChat_create_time() {
		return chat_create_time;
	}
	public void setChat_create_time(Date chat_create_time) {
		this.chat_create_time = chat_create_time;
	} 

	
	
}
