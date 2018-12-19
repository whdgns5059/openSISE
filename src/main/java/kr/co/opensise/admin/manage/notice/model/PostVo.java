package kr.co.opensise.admin.manage.notice.model;

public class PostVo {

	private int post_no;
	private int post_brd;
	private int post_mem;
	private String post_ttl;
	private String post_cntnt;
	private String post_date;
	
	
	public int getPost_no() {
		return post_no;
	}
	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}
	public int getPost_brd() {
		return post_brd;
	}
	public void setPost_brd(int post_brd) {
		this.post_brd = post_brd;
	}
	public int getPost_mem() {
		return post_mem;
	}
	public void setPost_mem(int post_mem) {
		this.post_mem = post_mem;
	}
	public String getPost_ttl() {
		return post_ttl;
	}
	public void setPost_ttl(String post_ttl) {
		this.post_ttl = post_ttl;
	}
	public String getPost_cntnt() {
		return post_cntnt;
	}
	public void setPost_cntnt(String post_cntnt) {
		this.post_cntnt = post_cntnt;
	}
	public String getPost_date() {
		return post_date;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
	@Override
	public String toString() {
		return "PostVo [post_no=" + post_no + ", post_brd=" + post_brd + ", post_mem=" + post_mem + ", post_ttl="
				+ post_ttl + ", post_cntnt=" + post_cntnt + ", post_date=" + post_date + "]";
	}
	
	
	
	
}
