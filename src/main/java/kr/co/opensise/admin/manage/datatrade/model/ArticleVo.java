package kr.co.opensise.admin.manage.datatrade.model;

public class ArticleVo {

	private String artcl_gu;
	private String artcl_dong;
	private String artcl_zip;
	private String artcl_bc;
	private String artcl_complx;
	private String artcl_nm;
	private String artcl_ty;
	private String artcl_prps_pls;
	private String artcl_mn_prps;
	private String artcl_const_y;
	private String artcl_rd;
	private String artcl_rd_detail;
	private String artcl_lat;
	private String artcl_lng;
	private String artcl_dl_ty;
	private String dl_ty;
	private String searchName;
	private String building;
	
	
	public String getArtcl_dl_ty() {
		return artcl_dl_ty;
	}
	public void setArtcl_dl_ty(String artcl_dl_ty) {
		this.artcl_dl_ty = artcl_dl_ty;
	}
	public String getArtcl_gu() {
		return artcl_gu;
	}
	public void setArtcl_gu(String artcl_gu) {
		this.artcl_gu = artcl_gu;
	}
	public String getArtcl_dong() {
		return artcl_dong;
	}
	public void setArtcl_dong(String artcl_dong) {
		this.artcl_dong = artcl_dong;
	}
	public String getArtcl_zip() {
		return artcl_zip;
	}
	public void setArtcl_zip(String artcl_zip) {
		this.artcl_zip = artcl_zip;
	}
	public String getArtcl_bc() {
		return artcl_bc;
	}
	public void setArtcl_bc(String artcl_bc) {
		this.artcl_bc = artcl_bc;
	}
	public String getArtcl_complx() {
		return artcl_complx;
	}
	public void setArtcl_complx(String artcl_complx) {
		this.artcl_complx = artcl_complx;
	}
	public String getArtcl_nm() {
		return artcl_nm;
	}
	public void setArtcl_nm(String artcl_nm) {
		this.artcl_nm = artcl_nm;
	}
	public String getArtcl_ty() {
		return artcl_ty;
	}
	public void setArtcl_ty(String artcl_ty) {
		this.artcl_ty = artcl_ty;
	}
	public String getArtcl_prps_pls() {
		return artcl_prps_pls;
	}
	public void setArtcl_prps_pls(String artcl_prps_pls) {
		this.artcl_prps_pls = artcl_prps_pls;
	}
	public String getArtcl_mn_prps() {
		return artcl_mn_prps;
	}
	public void setArtcl_mn_prps(String artcl_mn_prps) {
		this.artcl_mn_prps = artcl_mn_prps;
	}
	public String getArtcl_const_y() {
		return artcl_const_y;
	}
	public void setArtcl_const_y(String artcl_const_y) {
		this.artcl_const_y = artcl_const_y;
	}
	public String getArtcl_rd() {
		return artcl_rd;
	}
	public void setArtcl_rd(String artcl_rd) {
		this.artcl_rd = artcl_rd;
	}
	public String getArtcl_rd_detail() {
		return artcl_rd_detail;
	}
	public void setArtcl_rd_detail(String artcl_rd_detail) {
		this.artcl_rd_detail = artcl_rd_detail;
	}
	public String getArtcl_lat() {
		return artcl_lat;
	}
	public void setArtcl_lat(String artcl_lat) {
		this.artcl_lat = artcl_lat;
	}
	public String getArtcl_lng() {
		return artcl_lng;
	}
	public void setArtcl_lng(String artcl_lng) {
		this.artcl_lng = artcl_lng;
	}
	public String getDl_ty() {
		return dl_ty;
	}
	public void setDl_ty(String dl_ty) {
		this.dl_ty = dl_ty;
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
	
	@Override
	public String toString() {
		return "ArticleVo [artcl_gu=" + artcl_gu + ", artcl_dong=" + artcl_dong + ", artcl_zip=" + artcl_zip
				+ ", artcl_bc=" + artcl_bc + ", artcl_complx=" + artcl_complx + ", artcl_nm=" + artcl_nm + ", artcl_ty="
				+ artcl_ty + ", artcl_prps_pls=" + artcl_prps_pls + ", artcl_mn_prps=" + artcl_mn_prps
				+ ", artcl_const_y=" + artcl_const_y + ", artcl_rd=" + artcl_rd + ", artcl_rd_detail=" + artcl_rd_detail
				+ ", artcl_lat=" + artcl_lat + ", artcl_lng=" + artcl_lng + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((artcl_bc == null) ? 0 : artcl_bc.hashCode());
		result = prime * result + ((artcl_complx == null) ? 0 : artcl_complx.hashCode());
		result = prime * result + ((artcl_const_y == null) ? 0 : artcl_const_y.hashCode());
		result = prime * result + ((artcl_dl_ty == null) ? 0 : artcl_dl_ty.hashCode());
		result = prime * result + ((artcl_dong == null) ? 0 : artcl_dong.hashCode());
		result = prime * result + ((artcl_gu == null) ? 0 : artcl_gu.hashCode());
		result = prime * result + ((artcl_lat == null) ? 0 : artcl_lat.hashCode());
		result = prime * result + ((artcl_lng == null) ? 0 : artcl_lng.hashCode());
		result = prime * result + ((artcl_mn_prps == null) ? 0 : artcl_mn_prps.hashCode());
		result = prime * result + ((artcl_nm == null) ? 0 : artcl_nm.hashCode());
		result = prime * result + ((artcl_prps_pls == null) ? 0 : artcl_prps_pls.hashCode());
		result = prime * result + ((artcl_rd == null) ? 0 : artcl_rd.hashCode());
		result = prime * result + ((artcl_rd_detail == null) ? 0 : artcl_rd_detail.hashCode());
		result = prime * result + ((artcl_ty == null) ? 0 : artcl_ty.hashCode());
		result = prime * result + ((artcl_zip == null) ? 0 : artcl_zip.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ArticleVo other = (ArticleVo) obj;
		
		if (artcl_bc == null) {
			if (other.artcl_bc != null)
				return false;
		} else if (!artcl_bc.equals(other.artcl_bc))
			return false;
		if (artcl_complx == null) {
			if (other.artcl_complx != null)
				return false;
		} else if (!artcl_complx.equals(other.artcl_complx))
			return false;
		if (artcl_const_y == null) {
			if (other.artcl_const_y != null)
				return false;
		} else if (!artcl_const_y.equals(other.artcl_const_y))
			return false;
		if (artcl_dl_ty == null) {
			if (other.artcl_dl_ty != null)
				return false;
		} else if (!artcl_dl_ty.equals(other.artcl_dl_ty))
			return false;
		if (artcl_dong == null) {
			if (other.artcl_dong != null)
				return false;
		} else if (!artcl_dong.equals(other.artcl_dong))
			return false;
		if (artcl_gu == null) {
			if (other.artcl_gu != null)
				return false;
		} else if (!artcl_gu.equals(other.artcl_gu))
			return false;
		if (artcl_lat == null) {
			if (other.artcl_lat != null)
				return false;
		} else if (!artcl_lat.equals(other.artcl_lat))
			return false;
		if (artcl_lng == null) {
			if (other.artcl_lng != null)
				return false;
		} else if (!artcl_lng.equals(other.artcl_lng))
			return false;
		if (artcl_mn_prps == null) {
			if (other.artcl_mn_prps != null)
				return false;
		} else if (!artcl_mn_prps.equals(other.artcl_mn_prps))
			return false;
		if (artcl_nm == null) {
			if (other.artcl_nm != null)
				return false;
		} else if (!artcl_nm.equals(other.artcl_nm))
			return false;
		if (artcl_prps_pls == null) {
			if (other.artcl_prps_pls != null)
				return false;
		} else if (!artcl_prps_pls.equals(other.artcl_prps_pls))
			return false;
		if (artcl_rd == null) {
			if (other.artcl_rd != null)
				return false;
		} else if (!artcl_rd.equals(other.artcl_rd))
			return false;
		if (artcl_rd_detail == null) {
			if (other.artcl_rd_detail != null)
				return false;
		} else if (!artcl_rd_detail.equals(other.artcl_rd_detail))
			return false;
		if (artcl_ty == null) {
			if (other.artcl_ty != null)
				return false;
		} else if (!artcl_ty.equals(other.artcl_ty))
			return false;
		if (artcl_zip == null) {
			if (other.artcl_zip != null)
				return false;
		} else if (!artcl_zip.equals(other.artcl_zip))
			return false;
		return true;
	}

 
}
