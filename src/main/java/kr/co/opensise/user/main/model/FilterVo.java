package kr.co.opensise.user.main.model;

public class FilterVo {
	private String dl_ty; 	// 전/월/매
	private double dl_price; //가격
	private String dl_excv_area;   //면적
	private String artcl_const_y; //준공년도
	private String dl_flr;		 // 층수
	private String searchName;   //검색어
	private String building;     //건물형태
	
	
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
	public String getDl_excv_area() {
		return dl_excv_area;
	}
	public void setDl_excv_area(String dl_excv_area) {
		this.dl_excv_area = dl_excv_area;
	}
	public String getArtcl_const_y() {
		return artcl_const_y;
	}
	public void setArtcl_const_y(String artcl_const_y) {
		this.artcl_const_y = artcl_const_y;
	}
	public String getDl_flr() {
		return dl_flr;
	}
	public void setDl_flr(String dl_flr) {
		this.dl_flr = dl_flr;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public String getBuilding() {
		return building;
	}
	public void setBuilding(String building) {
		this.building = building;
	}
	
	
	

}
