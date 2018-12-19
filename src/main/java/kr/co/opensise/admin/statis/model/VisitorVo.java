package kr.co.opensise.admin.statis.model;

public class VisitorVo {
	
	private String vstr_date;
	
	public VisitorVo() {
	}
	public String getVstr_date() {
		return vstr_date;
	}
	public void setVstr_date(String vstr_date) {
		this.vstr_date = vstr_date;
	}
	
	@Override
	public String toString() {
		return "VisitVo [vstr_date=" + vstr_date+ "]";
	}
	
	

}
