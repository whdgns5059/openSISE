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
	
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((chat_create_time == null) ? 0 : chat_create_time.hashCode());
		result = prime * result + ((chat_mem_name == null) ? 0 : chat_mem_name.hashCode());
		result = prime * result + chat_mem_no;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ChatVo other = (ChatVo) obj;
		if (chat_create_time == null) {
			if (other.chat_create_time != null)
				return false;
		} else if (!chat_create_time.equals(other.chat_create_time))
			return false;
		if (chat_mem_name == null) {
			if (other.chat_mem_name != null)
				return false;
		} else if (!chat_mem_name.equals(other.chat_mem_name))
			return false;
		if (chat_mem_no != other.chat_mem_no)
			return false;
		return true;
	}


	
	
}
