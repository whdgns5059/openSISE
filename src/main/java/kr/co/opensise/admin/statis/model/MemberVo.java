package kr.co.opensise.admin.statis.model;

public class MemberVo {
	
	private int mem_no;
	private String mem_gndr;
	private String mem_age;
	private int mem_job;
	private String mem_date;
	private String mem_exdate;
	private int mem_lvl;
	private String mem_ldate;
	private String ymd;
	private int counts;
	

	public MemberVo() {
	}
	public String getYmd() {
		return ymd;
	}
	public void setYmd(String ymd) {
		this.ymd = ymd;
	}
	public int getcounts() {
		return counts;
	}
	public void setcounts(int counts) {
		this.counts = counts;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public String getMem_gndr() {
		return mem_gndr;
	}
	public void setMem_gndr(String mem_gndr) {
		this.mem_gndr = mem_gndr;
	}
	public String getMem_age() {
		return mem_age;
	}
	public void setMem_age(String mem_age) {
		this.mem_age = mem_age;
	}
	public int getMem_job() {
		return mem_job;
	}
	public void setMem_job(int mem_job) {
		this.mem_job = mem_job;
	}
	public String getMem_date() {
		return mem_date;
	}
	public void setMem_date(String mem_date) {
		this.mem_date = mem_date;
	}
	public String getMem_exdate() {
		return mem_exdate;
	}
	public void setMem_exdate(String mem_exdate) {
		this.mem_exdate = mem_exdate;
	}
	public int getMem_lvl() {
		return mem_lvl;
	}
	public void setMem_lvl(int mem_lvl) {
		this.mem_lvl = mem_lvl;
	}
	public String getMem_ldate() {
		return mem_ldate;
	}
	public void setMem_ldate(String mem_ldate) {
		this.mem_ldate = mem_ldate;
	}
	
	@Override
	public String toString() {
		return "MemberVo [mem_no=" + mem_no + ", mem_gndr=" + mem_gndr + ", mem_age=" + mem_age + ", mem_job=" + mem_job
				+ ", mem_date=" + mem_date + ", mem_exdate=" + mem_exdate + ", mem_lvl=" + mem_lvl + ", mem_ldate="
				+ mem_ldate + ", ymd=" + ymd + ", counts=" + counts + "]";
	}

	
	
}
