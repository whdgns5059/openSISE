package kr.co.opensise.admin.manage.report.model;

public class ReportVo {
	
	private int rpt_no;
	private int rpt_post;
	private String rpt_cntnt;
	private String rpt_date;
	private String rpt_classf;
	private int rpt_mem;
	private String rpt_ttl;
	
	public ReportVo() {
	}
	public String getRpt_ttl() {
		return rpt_ttl;
	}
	public void setRpt_ttl(String rpt_ttl) {
		this.rpt_ttl = rpt_ttl;
	}
	public int getRpt_mem() {
		return rpt_mem;
	}
	public void setRpt_mem(int rpt_mem) {
		this.rpt_mem = rpt_mem;
	}
	public String getRpt_classf() {
		return rpt_classf;
	}
	public void setRpt_classf(String rpt_classf) {
		this.rpt_classf = rpt_classf;
	}
	public String getRpt_date() {
		return rpt_date;
	}
	public void setRpt_date(String rpt_date) {
		this.rpt_date = rpt_date;
	}
	public String getRpt_cntnt() {
		return rpt_cntnt;
	}
	public void setRpt_cntnt(String rpt_cntnt) {
		this.rpt_cntnt = rpt_cntnt;
	}
	public int getRpt_post() {
		return rpt_post;
	}
	public void setRpt_post(int rpt_post) {
		this.rpt_post = rpt_post;
	}
	public int getRpt_no() {
		return rpt_no;
	}
	public void setRpt_no(int rpt_no) {
		this.rpt_no = rpt_no;
	}
	@Override
	public String toString() {
		return "ReportVo [rpt_ttl=" + rpt_ttl + ", rpt_mem=" + rpt_mem + ", rpt_classf=" + rpt_classf + ", rpt_date="
				+ rpt_date + ", rpt_cntnt=" + rpt_cntnt + ", rpt_post=" + rpt_post + ", rpt_no=" + rpt_no + "]";
	}
	
	

}
