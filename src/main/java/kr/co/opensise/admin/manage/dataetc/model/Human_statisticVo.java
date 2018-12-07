package kr.co.opensise.admin.manage.dataetc.model;

import java.util.Date;

public class Human_statisticVo {

	private String hs_dong;
	private String hs_gndr;
	private String hs_age_grp;
	private int hs_hm_no;
	private String hs_date;
	
	public String getHs_dong() {
		return hs_dong;
	}
	public void setHs_dong(String hs_dong) {
		this.hs_dong = hs_dong;
	}
	public String getHs_gndr() {
		return hs_gndr;
	}
	public void setHs_gndr(String hs_gndr) {
		this.hs_gndr = hs_gndr;
	}
	public String getHs_age_grp() {
		return hs_age_grp;
	}
	public void setHs_age_grp(String hs_age_grp) {
		this.hs_age_grp = hs_age_grp;
	}
	public int getHs_hm_no() {
		return hs_hm_no;
	}
	public void setHs_hm_no(int hs_hm_no) {
		this.hs_hm_no = hs_hm_no;
	}
	public String getHs_date() {
		return hs_date;
	}
	public void setHs_date(String hs_date) {
		this.hs_date = hs_date;
	}
	@Override
	public String toString() {
		return "Human_statisticVo [hs_dong=" + hs_dong + ", hs_gndr=" + hs_gndr + ", hs_age_grp=" + hs_age_grp
				+ ", hs_hm_no=" + hs_hm_no + ", hs_date=" + hs_date + "]";
	}
	
	
}
