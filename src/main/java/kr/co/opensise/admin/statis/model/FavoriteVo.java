package kr.co.opensise.admin.statis.model;

public class FavoriteVo {
	
	private int favor_no;
	private int favor_mem;
	private String favor_gu;
	private String favor_dong;
	private String favor_zip;
	private String favor_rd;
	private String bc_nm;
	private int rank;
	private int counts;
	
	public FavoriteVo() {
	}
	
	public String getBc_nm() {
		return bc_nm;
	}
	public void setBc_nm(String bc_nm) {
		this.bc_nm = bc_nm;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getCounts() {
		return counts;
	}
	public void setCounts(int counts) {
		this.counts = counts;
	}
	public int getFavor_no() {
		return favor_no;
	}
	public void setFavor_no(int favor_no) {
		this.favor_no = favor_no;
	}
	public int getFavor_mem() {
		return favor_mem;
	}
	public void setFavor_mem(int favor_mem) {
		this.favor_mem = favor_mem;
	}
	public String getFavor_gu() {
		return favor_gu;
	}
	public void setFavor_gu(String favor_gu) {
		this.favor_gu = favor_gu;
	}
	public String getFavor_dong() {
		return favor_dong;
	}
	public void setFavor_dong(String favor_dong) {
		this.favor_dong = favor_dong;
	}
	public String getFavor_zip() {
		return favor_zip;
	}
	public void setFavor_zip(String favor_zip) {
		this.favor_zip = favor_zip;
	}
	public String getFavor_rd() {
		return favor_rd;
	}
	public void setFavor_rd(String favor_rd) {
		this.favor_rd = favor_rd;
	}

	@Override
	public String toString() {
		return "FavoriteVo [favor_no=" + favor_no + ", favor_mem=" + favor_mem + ", favor_gu=" + favor_gu
				+ ", favor_dong=" + favor_dong + ", favor_zip=" + favor_zip + ", favor_rd=" + favor_rd + ", rank="
				+ rank + ", counts=" + counts + "]";
	}

	
	

}
