package kr.co.opensise.member.Login.model;

import java.util.Date;

public class MemberVo {
	private int mem_no;
	private String mem_email;
	private String mem_pass;
	private String mem_nm;
	private int mem_job;
	private String mem_gndr;
	private Date mem_date;
	private String mem_exit;
	private Date mem_exdate;
	private int mem_lvl;
	private Date mem_ldate;
	private int job_no;
	private String job_nm;
	private int intrst_no;
	private String intrst_nm;
	private String approval_status;
	private int approval_key;
	private String mem_mngr;
	private String mem_age;
	private String mem_new_pass;
	private String nickname;
	
	
	
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public  MemberVo(){
	}
	
	public String getMem_age() {
		return mem_age;
	}
	public void setMem_age(String mem_age) {
		this.mem_age = mem_age;
	}
	public String getApproval_status() {
		return approval_status;
	}
	public void setApproval_status(String approval_status) {
		this.approval_status = approval_status;
	}
	public int getApproval_key() {
		return approval_key;
	}

	public void setApproval_key(int approval_key) {
		this.approval_key = approval_key;
	}

	public int getMem_lvl() {
		return mem_lvl;
	}
	public void setMem_lvl(int mem_lvl) {
		this.mem_lvl = mem_lvl;
	}
	public Date getMem_ldate() {
		return mem_ldate;
	}
	public void setMem_ldate(Date mem_ldate) {
		this.mem_ldate = mem_ldate;
	}
	public String getMem_exit() {
		return mem_exit;
	}
	public void setMem_exit(String mem_exit) {
		this.mem_exit = mem_exit;
	}
	public Date getMem_exdate() {
		return mem_exdate;
	}
	public void setMem_exdate(Date mem_exdate) {
		this.mem_exdate = mem_exdate;
	}
	public int getIntrst_no() {
		return intrst_no;
	}
	public void setIntrst_no(int intrst_no) {
		this.intrst_no = intrst_no;
	}
	public String getIntrst_nm() {
		return intrst_nm;
	}
	public void setIntrst_nm(String intrst_nm) {
		this.intrst_nm = intrst_nm;
	}
	public int getJob_no() {
		return job_no;
	}
	public void setJob_no(int job_no) {
		this.job_no = job_no;
	}
	public String getJob_nm() {
		return job_nm;
	}
	public void setJob_nm(String job_nm) {
		this.job_nm = job_nm;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_pass() {
		return mem_pass;
	}
	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
	}
	public String getMem_nm() {
		return mem_nm;
	}
	public void setMem_nm(String mem_nm) {
		this.mem_nm = mem_nm;
	}
	public String getMem_mngr() {
		return mem_mngr;
	}
	public void setMem_mngr(String mem_mngr) {
		this.mem_mngr = mem_mngr;
	}
	public int getMem_job() {
		return mem_job;
	}
	public void setMem_job(int mem_job) {
		this.mem_job = mem_job;
	}
	public String getMem_gndr() {
		return mem_gndr;
	}
	public void setMem_gndr(String mem_gndr) {
		this.mem_gndr = mem_gndr;
	}
	public Date getMem_date() {
		return mem_date;
	}
	public void setMem_date(Date mem_date) {
		this.mem_date = mem_date;
	}
	public String getMem_new_pass() {
		return mem_new_pass;
	}

	public void setMem_new_pass(String mem_new_pass) {
		this.mem_new_pass = mem_new_pass;
	}

	
	@Override
	public String toString() {
		return "memberVo [mem_email=" + mem_email + ", mem_nm=" + mem_nm +  "]";
	}
	
	
	/**  
	* Method   : authPass 
	* �ۼ��� : ���ֿ�
	* �����̷� :  
	* @param encryptPass
	* @return  
	* Method ���� : ��й�ȣ ���� 
	*/
	public boolean authPass(String encryptPass) {
		return getMem_pass().equals(encryptPass);
	}
}
