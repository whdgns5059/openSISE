package kr.co.opensise.admin.statis.model;

public class VisitorVo {
	
	private String vstr_date;
	private int vstr_cnt;
	
	public VisitorVo() {
	}
	public String getVstr_date() {
		return vstr_date;
	}
	public void setVstr_date(String vstr_date) {
		this.vstr_date = vstr_date;
	}
	public int getVstr_cnt() {
		return vstr_cnt;
	}
	public void setVstr_cnt(int vstr_cnt) {
		this.vstr_cnt = vstr_cnt;
	}
	
	@Override
	public String toString() {
		return "VisitVo [vstr_date=" + vstr_date + ", vstr_cnt=" + vstr_cnt + "]";
	}
	
	

}
