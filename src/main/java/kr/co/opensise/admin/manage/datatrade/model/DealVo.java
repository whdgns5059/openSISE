package kr.co.opensise.admin.manage.datatrade.model;

public class DealVo { 
	
	private int dl_no;
	private float dl_excv_area;
	private String dl_ty;
	private double dl_price;
	private double dl_depos;
	private double dl_rnt;
	private String dl_cont_ym;
	private String dl_cont_d;
	private String dl_flr;
	private String dl_gu;
	private String dl_dong;
	private String dl_zip;
	
	public int getDl_no() {
		return dl_no;
	}
	public void setDl_no(int dl_no) {
		this.dl_no = dl_no;
	}
	public float getDl_excv_area() {
		return dl_excv_area;
	}
	public void setDl_excv_area(float dl_excv_area) {
		this.dl_excv_area = dl_excv_area;
	}
	public String getDl_ty() {
		return dl_ty;
	}
	public void setDl_ty(String dl_ty) {
		this.dl_ty = dl_ty;
	}
	public double getDl_price() {
		return dl_price;
	}
	public void setDl_price(double dl_price) {
		this.dl_price = dl_price;
	}
	public double getDl_depos() {
		return dl_depos;
	}
	public void setDl_depos(double dl_depos) {
		this.dl_depos = dl_depos;
	}
	public double getDl_rnt() {
		return dl_rnt;
	}
	public void setDl_rnt(double dl_rnt) {
		this.dl_rnt = dl_rnt;
	}
	public String getDl_cont_ym() {
		return dl_cont_ym;
	}
	public void setDl_cont_ym(String dl_cont_ym) {
		this.dl_cont_ym = dl_cont_ym;
	}
	public String getDl_cont_d() {
		return dl_cont_d;
	}
	public void setDl_cont_d(String dl_cont_d) {
		this.dl_cont_d = dl_cont_d;
	}
	public String getDl_flr() {
		return dl_flr;
	}
	public void setDl_flr(String dl_flr) {
		this.dl_flr = dl_flr;
	}
	public String getDl_gu() {
		return dl_gu;
	}
	public void setDl_gu(String dl_gu) {
		this.dl_gu = dl_gu;
	}
	public String getDl_dong() {
		return dl_dong;
	}
	public void setDl_dong(String dl_dong) {
		this.dl_dong = dl_dong;
	}
	public String getDl_zip() {
		return dl_zip;
	}
	public void setDl_zip(String dl_zip) {
		this.dl_zip = dl_zip;
	}
	@Override
	public String toString() {
		return "DealVo [dl_no=" + dl_no + ", dl_excv_area=" + dl_excv_area + ", dl_ty=" + dl_ty + ", dl_price="
				+ dl_price + ", dl_depos=" + dl_depos + ", dl_rnt=" + dl_rnt + ", dl_cont_ym=" + dl_cont_ym
				+ ", dl_cont_d=" + dl_cont_d + ", dl_flr=" + dl_flr + ", dl_gu=" + dl_gu + ", dl_dong=" + dl_dong
				+ ", dl_zip=" + dl_zip + "]";
	}
	
	
	
}