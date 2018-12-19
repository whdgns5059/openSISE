package kr.co.opensise.admin.statis.model;

public class Page_statisticVo {

	private String ps_date;
	private String ps_pg;
	private String ps_pg_addr;
	private int ps_vstr;
	
	public Page_statisticVo() {
	}
	public String getPs_date() {
		return ps_date;
	}
	public void setPs_date(String ps_date) {
		this.ps_date = ps_date;
	}
	public String getPs_pg() {
		return ps_pg;
	}
	public void setPs_pg(String ps_pg) {
		this.ps_pg = ps_pg;
	}
	public String getPs_pg_addr() {
		return ps_pg_addr;
	}
	public void setPs_pg_addr(String ps_pg_addr) {
		this.ps_pg_addr = ps_pg_addr;
	}
	public int getPs_vstr() {
		return ps_vstr;
	}
	public void setPs_vstr(int ps_vstr) {
		this.ps_vstr = ps_vstr;
	}
	
	@Override
	public String toString() {
		return "Page_statisticVo [ps_date=" + ps_date + ", ps_pg=" + ps_pg + ", ps_pg_addr=" + ps_pg_addr + ", ps_vstr="
				+ ps_vstr + "]";
	}
	
	
	
	
	
}
