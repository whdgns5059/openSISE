package kr.co.opensise.admin.manage.dataetc.model;

public class Market_detailVo {
	
	private int mkd_no;
	private String mkd_date;
	private int mkd_price;
	private String mkd_prod;
	private String mkd_prod_detail;
	private String mkd_mk;
	private String mkd_mk_dong;
	
	public int getMkd_no() {
		return mkd_no;
	}
	public void setMkd_no(int mkd_no) {
		this.mkd_no = mkd_no;
	}
	public String getMkd_date() {
		return mkd_date;
	}
	public void setMkd_date(String mkd_date) {
		this.mkd_date = mkd_date;
	}
	public int getMkd_price() {
		return mkd_price;
	}
	public void setMkd_price(int mkd_price) {
		this.mkd_price = mkd_price;
	}
	public String getMkd_prod() {
		return mkd_prod;
	}
	public void setMkd_prod(String mkd_prod) {
		this.mkd_prod = mkd_prod;
	}
	public String getMkd_prod_detail() {
		return mkd_prod_detail;
	}
	public void setMkd_prod_detail(String mkd_prod_detail) {
		this.mkd_prod_detail = mkd_prod_detail;
	}
	public String getMkd_mk() {
		return mkd_mk;
	}
	public void setMkd_mk(String mkd_mk) {
		this.mkd_mk = mkd_mk;
	}
	public String getMkd_mk_dong() {
		return mkd_mk_dong;
	}
	public void setMkd_mk_dong(String mkd_mk_dong) {
		this.mkd_mk_dong = mkd_mk_dong;
	}
	@Override
	public String toString() {
		return "Market_detailVo [mkd_no=" + mkd_no + ", mkd_date=" + mkd_date + ", mkd_price=" + mkd_price
				+ ", mkd_prod=" + mkd_prod + ", mkd_prod_detail=" + mkd_prod_detail + ", mkd_mk=" + mkd_mk
				+ ", mkd_mk_dong=" + mkd_mk_dong + "]";
	}
	
	
	

}
