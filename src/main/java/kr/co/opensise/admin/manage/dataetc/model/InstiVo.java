package kr.co.opensise.admin.manage.dataetc.model;

public class InstiVo {
	private int insti_no;
	private String insti_nm;
	
	public int getInsti_no() {
		return insti_no;
	}
	public void setInsti_no(int insti_no) {
		this.insti_no = insti_no;
	}
	public String getInsti_nm() {
		return insti_nm;
	}
	public void setInsti_nm(String insti_nm) {
		this.insti_nm = insti_nm;
	}
	@Override
	public String toString() {
		return "InstiVo [insti_no=" + insti_no + ", insti_nm=" + insti_nm + "]";
	}
	
	
}
