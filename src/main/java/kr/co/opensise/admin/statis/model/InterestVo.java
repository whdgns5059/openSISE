package kr.co.opensise.admin.statis.model;

public class InterestVo {

	private String intrst_no;
	private String intrst_nm;
	private String mem_age;
	private String mem_gndr;
	private int female;
	private int male;
	private int counts;
	
	public InterestVo() {
	}

	public int getFemale() {
		return female;
	}
	public void setFemale(int female) {
		this.female = female;
	}
	public int getMale() {
		return male;
	}
	public void setMale(int male) {
		this.male = male;
	}
	public String getIntrst_no() {
		return intrst_no;
	}
	public void setIntrst_no(String intrst_no) {
		this.intrst_no = intrst_no;
	}
	public String getIntrst_nm() {
		return intrst_nm;
	}
	public void setIntrst_nm(String intrst_nm) {
		this.intrst_nm = intrst_nm;
	}
	public String getMem_age() {
		return mem_age;
	}
	public void setMem_age(String mem_age) {
		this.mem_age = mem_age;
	}
	public String getMem_gndr() {
		return mem_gndr;
	}
	public void setMem_gndr(String mem_gndr) {
		this.mem_gndr = mem_gndr;
	}
	public int getCounts() {
		return counts;
	}
	public void setCounts(int counts) {
		this.counts = counts;
	}

	@Override
	public String toString() {
		return "InterestVo [intrst_no=" + intrst_no + ", intrst_nm=" + intrst_nm + ", mem_age=" + mem_age
				+ ", mem_gndr=" + mem_gndr + ", female=" + female + ", male=" + male + ", counts=" + counts + "]";
	}

	
	
	
	
	
	
}
