package kr.co.opensise.user.detail.model;

public class Report_classfVo {
	private int rpt_classf;
	private String rpt_cf_nm;
	
	public Report_classfVo() {
	}
	public String getRpt_cf_nm() {
		return rpt_cf_nm;
	}
	public void setRpt_cf_nm(String rpt_cf_nm) {
		this.rpt_cf_nm = rpt_cf_nm;
	}
	public int getRpt_classf() {
		return rpt_classf;
	}
	public void setRpt_classf(int rpt_classf) {
		this.rpt_classf = rpt_classf;
	}
	@Override
	public String toString() {
		return "Report_classfVo [rpt_classf=" + rpt_classf + ", rpt_cf_nm=" + rpt_cf_nm + "]";
	}
	
}
