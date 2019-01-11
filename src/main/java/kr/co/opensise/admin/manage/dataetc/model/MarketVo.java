package kr.co.opensise.admin.manage.dataetc.model;

public class MarketVo {

	private String mk_nm;
	private String mk_dong;
	private String mk_classf;
	
	public String getMk_nm() {
		return mk_nm;
	}
	public void setMk_nm(String mk_nm) {
		this.mk_nm = mk_nm;
	}
	public String getMk_dong() {
		return mk_dong;
	}
	public void setMk_dong(String mk_dong) {
		this.mk_dong = mk_dong;
	}
	public String getMk_classf() {
		return mk_classf;
	}
	public void setMk_classf(String mk_classf) {
		this.mk_classf = mk_classf;
	}
	

	
	@Override
	public String toString() {
		return "MarketVo [mk_nm=" + mk_nm + ", mk_dong=" + mk_dong + ", mk_classf=" + mk_classf + "]";
	}
	/**
	* Method : hashCode
	* 작성자 : ASUS
	* 변경이력 :
	* @return
	* Method 설명 :
	*/
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((mk_classf == null) ? 0 : mk_classf.hashCode());
		result = prime * result + ((mk_dong == null) ? 0 : mk_dong.hashCode());
		result = prime * result + ((mk_nm == null) ? 0 : mk_nm.hashCode());
		return result;
	}
	/**
	* Method : equals
	* 작성자 : ASUS
	* 변경이력 :
	* @param obj
	* @return
	* Method 설명 :
	*/
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MarketVo other = (MarketVo) obj;
		if (mk_classf == null) {
			if (other.mk_classf != null)
				return false;
		} else if (!mk_classf.equals(other.mk_classf))
			return false;
		if (mk_dong == null) {
			if (other.mk_dong != null)
				return false;
		} else if (!mk_dong.equals(other.mk_dong))
			return false;
		if (mk_nm == null) {
			if (other.mk_nm != null)
				return false;
		} else if (!mk_nm.equals(other.mk_nm))
			return false;
		return true;
	}
	
	
	
	
}
