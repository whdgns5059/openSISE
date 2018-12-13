package kr.co.opensise.admin.manage.dataetc.model;

public class BusVo {

	private String bus_cd;
	private String bus_no;
	private String bus_tp;
	
	public String getBus_cd() {
		return bus_cd;
	}
	public void setBus_cd(String bus_cd) {
		this.bus_cd = bus_cd;
	}
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
	@Override
	public String toString() {
		return "BusVo [bus_cd=" + bus_cd + ", bus_no=" + bus_no + ", bus_tp=" + bus_tp + "]";
	}
	
	
}
