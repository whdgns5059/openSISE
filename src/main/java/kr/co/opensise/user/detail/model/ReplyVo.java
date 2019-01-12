package kr.co.opensise.user.detail.model;

public class ReplyVo {

	private int rpl_no; 
	private String rpl_cntnt; 
	private String rpl_date;
	private String rpl_exst;
	private int rpl_post;
	private int rpl_mem;
	private String mem_email;
	private String mem_nm;
	
	

	public String getMem_nm() {
		return mem_nm;
	}
	public void setMem_nm(String mem_nm) {
		this.mem_nm = mem_nm;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public int getRpl_no() {
		return rpl_no;
	}
	public void setRpl_no(int rpl_no) {
		this.rpl_no = rpl_no;
	}
	public String getRpl_cntnt() {
		return rpl_cntnt;
	}
	public void setRpl_cntnt(String rpl_cntnt) {
		this.rpl_cntnt = rpl_cntnt;
	}
	public String getRpl_date() {
		return rpl_date;
	}
	public void setRpl_date(String rpl_date) {
		this.rpl_date = rpl_date;
	}
	public String getRpl_exst() {
		return rpl_exst;
	}
	public void setRpl_exst(String rpl_exst) {
		this.rpl_exst = rpl_exst;
	}
	public int getRpl_post() {
		return rpl_post;
	}
	public void setRpl_post(int rpl_post) {
		this.rpl_post = rpl_post;
	}
	public int getRpl_mem() {
		return rpl_mem;
	}
	public void setRpl_mem(int rpl_mem) {
		this.rpl_mem = rpl_mem;
	}
	@Override
	public String toString() {
		return "ReplyVo [rpl_no=" + rpl_no + ", rpl_cntnt=" + rpl_cntnt + ", rpl_date=" + rpl_date + ", rpl_exst="
				+ rpl_exst + ", rpl_post=" + rpl_post + ", rpl_mem=" + rpl_mem + "]";
	}


	
	
}
