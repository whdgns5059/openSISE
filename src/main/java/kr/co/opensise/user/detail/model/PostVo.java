package kr.co.opensise.user.detail.model;

public class PostVo {

	private int post_no;
	private int post_brd;
	private int post_mem;
	private String post_ttl;
	private String post_cntnt;
	private String post_date;
	private String post_star;
	private String post_exst;
	private String post_gu;
	private String post_dong;
	private String post_zip;
	private String post_rd;
	private String mem_email;
	private String mem_nm;
	private int rnum;
	

	
	public String getMem_nm() {
		return mem_nm;
	}
	public void setMem_nm(String mem_nm) {
		this.mem_nm = mem_nm;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
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
	public String getPost_star() {
		return post_star;
	}
	public void setPost_star(String post_star) {
		this.post_star = post_star;
	}
	public String getPost_exst() {
		return post_exst;
	}
	public void setPost_exst(String post_exst) {
		this.post_exst = post_exst;
	}
	public String getPost_gu() {
		return post_gu;
	}
	public void setPost_gu(String post_gu) {
		this.post_gu = post_gu;
	}
	public String getPost_dong() {
		return post_dong;
	}
	public void setPost_dong(String post_dong) {
		this.post_dong = post_dong;
	}
	public String getPost_zip() {
		return post_zip;
	}
	public void setPost_zip(String post_zip) {
		this.post_zip = post_zip;
	}
	public String getPost_rd() {
		return post_rd;
	}
	public void setPost_rd(String post_rd) {
		this.post_rd = post_rd;
	}
	@Override
	public String toString() {
		return "PostVo [post_no=" + post_no + ", post_brd=" + post_brd + ", post_mem=" + post_mem + ", post_ttl="
				+ post_ttl + ", post_cntnt=" + post_cntnt + ", post_date=" + post_date + ", post_star=" + post_star
				+ ", post_exst=" + post_exst + ", post_gu=" + post_gu + ", post_dong=" + post_dong + ", post_zip="
				+ post_zip + ", post_rd=" + post_rd + ", mem_email=" + mem_email + ", rnum=" + rnum + "]";
	}
	
	
	
	
	
}
