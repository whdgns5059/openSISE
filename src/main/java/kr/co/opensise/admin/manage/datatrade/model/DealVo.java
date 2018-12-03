package kr.co.opensise.admin.manage.datatrade.model;

public class DealVo {

	private int dl_no;
	private int dl_artcl;
	private String dl_ty;
	private int dl_price;
	private int dl_depos;
	private int dl_rnt;
	private String dl_cont_ym;
	private String dl_cont_d;
	
	
	@Override
	public String toString() {
		return "DealVo [dl_no=" + dl_no + ", dl_artcl=" + dl_artcl + ", dl_ty=" + dl_ty + ", dl_price=" + dl_price
				+ ", dl_depos=" + dl_depos + ", dl_rnt=" + dl_rnt + ", dl_cont_ym=" + dl_cont_ym + ", dl_cont_d="
				+ dl_cont_d + "]";
	}

	public int getDl_no() {
		return dl_no;
	}
	public void setDl_no(int dl_no) {
		this.dl_no = dl_no;
	}
	public int getDl_artcl() {
		return dl_artcl;
	}
	public void setDl_artcl(int dl_artcl) {
		this.dl_artcl = dl_artcl;
	}
	public String getDl_ty() {
		return dl_ty;
	}
	public void setDl_ty(String dl_ty) {
		this.dl_ty = dl_ty;
	}
	public int getDl_price() {
		return dl_price;
	}
	public void setDl_price(int dl_price) {
		this.dl_price = dl_price;
	}
	public int getDl_depos() {
		return dl_depos;
	}
	public void setDl_depos(int dl_depos) {
		this.dl_depos = dl_depos;
	}
	public int getDl_rnt() {
		return dl_rnt;
	}
	public void setDl_rnt(int dl_rnt) {
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

	
	
}
