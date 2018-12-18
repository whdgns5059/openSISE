package kr.co.opensise.admin.manage.dataetc.model;

public class InstiAttrVo {
	private int iattr_no;
	private int iattr_insti;
	private int iattr_pare;
	private String iattr_key;
	private String iattr_val;
	private int level;
	
	public int getIattr_no() {
		return iattr_no;
	}
	public void setIattr_no(int iattr_no) {
		this.iattr_no = iattr_no;
	}
	public int getIattr_insti() {
		return iattr_insti;
	}
	public void setIattr_insti(int iattr_insti) {
		this.iattr_insti = iattr_insti;
	}
	public int getIattr_pare() {
		return iattr_pare;
	}
	public void setIattr_pare(int iattr_pare) {
		this.iattr_pare = iattr_pare;
	}
	public String getIattr_key() {
		return iattr_key;
	}
	public void setIattr_key(String iattr_key) {
		this.iattr_key = iattr_key;
	}
	public String getIattr_val() {
		return iattr_val;
	}
	public void setIattr_val(String iattr_val) {
		this.iattr_val = iattr_val;
	}
	
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	@Override
	public String toString() {
		return "InstiAttrVo [iattr_no=" + iattr_no + ", iattr_insti=" + iattr_insti + ", iattr_pare=" + iattr_pare
				+ ", iattr_key=" + iattr_key + ", iattr_val=" + iattr_val + ", level=" + level + "]";
	}
	
	
}
