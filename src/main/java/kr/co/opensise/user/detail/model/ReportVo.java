package kr.co.opensise.user.detail.model;

public class ReportVo {

	private int rpt_no;
	private int rpt_post;
	private String rpt_cntnt;
	private String rpt_date;
	private String rpt_classf;
	private int rpt_mem;
	private String rpt_ttl;
	private String rpt_exst;
	
	
	public String getRpt_ttl() {
		return rpt_ttl;
	}
	public void setRpt_ttl(String rpt_ttl) {
		this.rpt_ttl = rpt_ttl;
	}
	public int getRpt_no() {
		return rpt_no;
	}
	public void setRpt_no(int rpt_no) {
		this.rpt_no = rpt_no;
	}
	public int getRpt_post() {
		return rpt_post;
	}
	public void setRpt_post(int rpt_post) {
		this.rpt_post = rpt_post;
	}
	public String getRpt_cntnt() {
		return rpt_cntnt;
	}
	public void setRpt_cntnt(String rpt_cntnt) {
		this.rpt_cntnt = rpt_cntnt;
	}
	public String getRpt_date() {
		return rpt_date;
	}
	public void setRpt_date(String rpt_date) {
		this.rpt_date = rpt_date;
	}
	public String getRpt_classf() {
		return rpt_classf;
	}
	public void setRpt_classf(String rpt_classf) {
		this.rpt_classf = rpt_classf;
	}
	public int getRpt_mem() {
		return rpt_mem;
	}
	public void setRpt_mem(int rpt_mem) {
		this.rpt_mem = rpt_mem;
	}
	public String getRpt_exst() {
		return rpt_exst;
	}
	public void setRpt_exst(String rpt_exst) {
		this.rpt_exst = rpt_exst;
	}
	@Override
	public String toString() {
		return "ReportVo [rpt_no=" + rpt_no + ", rpt_post=" + rpt_post + ", rpt_cntnt=" + rpt_cntnt + ", rpt_date="
				+ rpt_date + ", rpt_classf=" + rpt_classf + ", rpt_mem=" + rpt_mem + ", rpt_ttl=" + rpt_ttl
				+ ", rpt_exst=" + rpt_exst + "]";
	}
	

	
	
}
