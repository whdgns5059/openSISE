package kr.co.opensise.admin.manage.dataetc.model;

public class MarketVo {

	private String mk_nm;
	private String mk_dong;
	private String mk_classf;
	
	public String getMk_nm() {
		return mk_nm;
	}
	public void setMk_nm(String mk_nm) {
		this.mk_nm = mk_nm;
	}
	public String getMk_dong() {
		return mk_dong;
	}
	public void setMk_dong(String mk_dong) {
		this.mk_dong = mk_dong;
	}
	public String getMk_classf() {
		return mk_classf;
	}
	public void setMk_classf(String mk_classf) {
		this.mk_classf = mk_classf;
	}
	@Override
	public String toString() {
		return "MarketVo [mk_nm=" + mk_nm + ", mk_dong=" + mk_dong + ", mk_classf=" + mk_classf + "]";
	}
	
	
	
	
}
