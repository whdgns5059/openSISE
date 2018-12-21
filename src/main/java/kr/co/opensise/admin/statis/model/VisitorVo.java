package kr.co.opensise.admin.statis.model;

public class VisitorVo {
	
	private String vstr_date;
	private int counts;
	private String ymd;
	private String dy;
	private String dy_no;
	private String hr;
	
	public VisitorVo() {
	}
	public String getVstr_date() {
		return vstr_date;
	}
	public void setVstr_date(String vstr_date) {
		this.vstr_date = vstr_date;
	}
	public int getCounts() {
		return counts;
	}
	public void setCounts(int counts) {
		this.counts = counts;
	}
	public String getYmd() {
		return ymd;
	}
	public void setYmd(String ymd) {
		this.ymd = ymd;
	}
	public String getDy() {
		return dy;
	}
	public void setDy(String dy) {
		this.dy = dy;
	}
	public String getHr() {
		return hr;
	}
	public void setHr(String hr) {
		this.hr = hr;
	}
	public String getDy_no() {
		return dy_no;
	}
	public void setDy_no(String dy_no) {
		this.dy_no = dy_no;
	}
	@Override
	public String toString() {
		return "VisitorVo [vstr_date=" + vstr_date + ", counts=" + counts + ", ymd=" + ymd + ", dy=" + dy + ", dy_no="
				+ dy_no + ", hr=" + hr + "]";
	}
	
	
	

}
