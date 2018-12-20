package kr.co.opensise.admin.statis.model;

public class VisitorVo {
	
	private String vstr_date;
	private int counts;
	private String ymd;
	
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
	@Override
	public String toString() {
		return "VisitorVo [vstr_date=" + vstr_date + ", counts=" + counts + ", ymd=" + ymd + "]";
	}
	
	
	

}
