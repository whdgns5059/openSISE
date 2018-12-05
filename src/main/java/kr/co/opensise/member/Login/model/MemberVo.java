package kr.co.opensise.member.Login.model;

public class MemberVo {
	private int mem_no;
	private String mem_email;
	private String mem_pass;
	private String mem_nm;
	private String mem_gnde;
	private int mem_job;
	private String mem_mngr;
	private String mem_date;
	
	public  MemberVo(){
		
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



	public String getMem_gnde() {
		return mem_gnde;
	}



	public void setMem_gnde(String mem_gnde) {
		this.mem_gnde = mem_gnde;
	}



	public int getMem_job() {
		return mem_job;
	}



	public void setMem_job(int mem_job) {
		this.mem_job = mem_job;
	}



	public String getMem_mngr() {
		return mem_mngr;
	}



	public void setMem_mngr(String mem_mngr) {
		this.mem_mngr = mem_mngr;
	}



	public String getMem_date() {
		return mem_date;
	}



	public void setMem_date(String mem_date) {
		this.mem_date = mem_date;
	}



	@Override
	public String toString() {
		return "memberVo [mem_email=" + mem_email + ", mem_nm=" + mem_nm +  "]";
	}
	
	
	/**  
	* Method   : authPass 
	* 작성자 : 김주연
	* 변경이력 :  
	* @param encryptPass
	* @return  
	* Method 설명 : 비밀번호 검증 
	*/
	public boolean authPass(String encryptPass) {
		return getMem_pass().equals(encryptPass);
	}
}
