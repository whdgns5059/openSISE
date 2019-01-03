package kr.co.opensise.admin.manage.review.model;

import java.util.Date;

public class ReportHistoryVo {
	private int rpt_no;
	private Date rpt_date;
	private String rpt_cntnt;
	private String rpt_cf_nm;
	private String rpt_exst;
	private String rpt_ttl;
	
	public int getRpt_no() {
		return rpt_no;
	}
	public void setRpt_no(int rpt_no) {
		this.rpt_no = rpt_no;
	}
	public Date getRpt_date() {
		return rpt_date;
	}
	public void setRpt_date(Date rpt_date) {
		this.rpt_date = rpt_date;
	}
	public String getRpt_cntnt() {
		return rpt_cntnt;
	}
	public void setRpt_cntnt(String rpt_cntnt) {
		this.rpt_cntnt = rpt_cntnt;
	}
	public String getRpt_cf_nm() {
		return rpt_cf_nm;
	}
	public void setRpt_cf_nm(String rpt_cf_nm) {
		this.rpt_cf_nm = rpt_cf_nm;
	}
	public String getRpt_exst() {
		return rpt_exst;
	}
	public void setRpt_exst(String rpt_exst) {
		this.rpt_exst = rpt_exst;
	}
	public String getRpt_ttl() {
		return rpt_ttl;
	}
	public void setRpt_ttl(String rpt_ttl) {
		this.rpt_ttl = rpt_ttl;
	}
	

}
