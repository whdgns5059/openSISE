package kr.co.opensise.user.main.model;

public class AuctionVo {
	
	private String caseNum;
	private String bldClassf;
	private String addr;
	private String bldInfo;
	private String valuePrice;
	private String minPrice;
	
	public AuctionVo() {
	}
	
	public AuctionVo(String caseNum, String bldClassf, String addr, String bldInfo, String valuePrice,
			String minPrice) {
		this.caseNum = caseNum;
		this.bldClassf = bldClassf;
		this.addr = addr;
		this.bldInfo = bldInfo;
		this.valuePrice = valuePrice;
		this.minPrice = minPrice;
	}
	public String getCaseNum() {
		return caseNum;
	}
	public void setCaseNum(String caseNum) {
		this.caseNum = caseNum;
	}
	public String getBldClassf() {
		return bldClassf;
	}
	public void setBldClassf(String bldClassf) {
		this.bldClassf = bldClassf;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getBldInfo() {
		return bldInfo;
	}
	public void setBldInfo(String bldInfo) {
		this.bldInfo = bldInfo;
	}
	public String getValuePrice() {
		return valuePrice;
	}
	public void setValuePrice(String valuePrice) {
		this.valuePrice = valuePrice;
	}
	public String getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(String minPrice) {
		this.minPrice = minPrice;
	}
	@Override
	public String toString() {
		return "AuctionVo [caseNum=" + caseNum + ", bldClassf=" + bldClassf + ", addr=" + addr + ", bldInfo=" + bldInfo
				+ ", valuePrice=" + valuePrice + ", minPrice=" + minPrice + "]";
	}
	
	
	
	
	
	

	

	                                                                             

}
