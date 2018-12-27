package kr.co.opensise.admin.manage.dataetc.model;

public class StationVo {

	private String sttn_id;
	private String sttn_nm;
	private String sttn_lat;
	private String sttn_lng;
	private String bus_no;
	private String bus_tp;
	
	public String getBus_no() {
		return bus_no;
	}
	public void setBus_no(String bus_no) {
		this.bus_no = bus_no;
	}
	public String getBus_tp() {
		return bus_tp;
	}
	public void setBus_tp(String bus_tp) {
		this.bus_tp = bus_tp;
	}
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
				+ sttn_lng + ", bus_no=" + bus_no + ", bus_tp=" + bus_tp + "]";
	}

	
	
	
}
