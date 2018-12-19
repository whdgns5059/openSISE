package kr.co.opensise.user.detail.model;

public class PictureVo {
	
	private int pic_no;
	private String pic_file_nm;
	private String pic_file_path;
	private String pic_uuid;
	private int pic_post;
	public int getPic_no() {
		return pic_no;
	}
	public void setPic_no(int pic_no) {
		this.pic_no = pic_no;
	}
	public String getPic_file_nm() {
		return pic_file_nm;
	}
	public void setPic_file_nm(String pic_file_nm) {
		this.pic_file_nm = pic_file_nm;
	}
	public String getPic_file_path() {
		return pic_file_path;
	}
	public void setPic_file_path(String pic_file_path) {
		this.pic_file_path = pic_file_path;
	}
	public String getPic_uuid() {
		return pic_uuid;
	}
	public void setPic_uuid(String pic_uuid) {
		this.pic_uuid = pic_uuid;
	}
	public int getPic_post() {
		return pic_post;
	}
	public void setPic_post(int pic_post) {
		this.pic_post = pic_post;
	}
	@Override
	public String toString() {
		return "PictureVo [pic_no=" + pic_no + ", pic_file_nm=" + pic_file_nm + ", pic_file_path=" + pic_file_path
				+ ", pic_uuid=" + pic_uuid + ", pic_post=" + pic_post + "]";
	}

	
	
	
}
