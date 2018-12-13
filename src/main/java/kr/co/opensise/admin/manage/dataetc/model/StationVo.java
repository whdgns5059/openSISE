package kr.co.opensise.admin.manage.dataetc.model;

public class StationVo {

	private String sttn_id;
	private String sttn_nm;
	private String sttn_lat;
	private String sttn_lng;
	
	public String getSttn_id() {
		return sttn_id;
	}
	public void setSttn_id(String sttn_id) {
		this.sttn_id = sttn_id;
	}
	public String getSttn_nm() {
		return sttn_nm;
	}
	public void setSttn_nm(String sttn_nm) {
		this.sttn_nm = sttn_nm;
	}
	public String getSttn_lat() {
		return sttn_lat;
	}
	public void setSttn_lat(String sttn_lat) {
		this.sttn_lat = sttn_lat;
	}
	public String getSttn_lng() {
		return sttn_lng;
	}
	public void setSttn_lng(String sttn_lng) {
		this.sttn_lng = sttn_lng;
	}
	@Override
	public String toString() {
		return "StationVo [sttn_id=" + sttn_id + ", sttn_nm=" + sttn_nm + ", sttn_lat=" + sttn_lat + ", sttn_lng="
				+ sttn_lng + "]";
	}
	
	
}
