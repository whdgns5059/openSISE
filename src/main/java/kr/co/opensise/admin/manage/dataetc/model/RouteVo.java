package kr.co.opensise.admin.manage.dataetc.model;

public class RouteVo {

	private String rt_cd;
	private String rt_id;
	
	public String getRt_cd() {
		return rt_cd;
	}
	public void setRt_cd(String rt_cd) {
		this.rt_cd = rt_cd;
	}
	public String getRt_id() {
		return rt_id;
	}
	public void setRt_id(String rt_id) {
		this.rt_id = rt_id;
	}
	public boolean equals(Object obj) {
		if(obj instanceof RouteVo) {
			RouteVo tmp = (RouteVo) obj;
			return rt_cd.equals(tmp.rt_cd) && rt_id.equals(tmp.rt_id);
		}
		return false;
	}
	
	public int hashCode() {
		return (rt_cd + rt_id).hashCode();
	}
	
	@Override
	public String toString() {
		return "RouteVo [rt_cd=" + rt_cd + ", rt_id=" + rt_id + "]";
	}
	
	
}
