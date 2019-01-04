package kr.co.opensise.user.main.model;

public class AuctionVo {
	
	private String caDesc;		//대전지방법원 2018타경8767
	private String id;			//8851880
	private String auctionInfo;	//경매4계
	private String auctionDate;	//2019-01-08
	private String regDate;		//2018-12-25
	private String addr0;		//대전광역시
	private String addr1;		//중구
	private String addr2;		//모암로24번길
	private String addr;		//대전광역시 중구 모암로24번길 70, 2층202호
	private String itemType;	//다세대
	private String addrInfo;	//[집합건물 철근콘크리트조 59.34㎡]
	private String valueMin;	//51000000
	private String value;		//51000000
	private String auctionLoc;	//제106호 법정
	private String remarks;		//일괄매각
	private String auctionTel;	//470-1804
	
	public AuctionVo() {
	}
	public AuctionVo(String caDesc, String id, String auctionInfo, String auctionDate, String regDate, String addr0,
			String addr1, String addr2, String addr, String itemType, String addrInfo, String valueMin, String value,
			String auctionLoc, String remarks, String auctionTel) {
		this.caDesc = caDesc;
		this.id = id;
		this.auctionInfo = auctionInfo;
		this.auctionDate = auctionDate;
		this.regDate = regDate;
		this.addr0 = addr0;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.addr = addr;
		this.itemType = itemType;
		this.addrInfo = addrInfo;
		this.valueMin = valueMin;
		this.value = value;
		this.auctionLoc = auctionLoc;
		this.remarks = remarks;
		this.auctionTel = auctionTel;
	}
	public String getCaDesc() {
		return caDesc;
	}
	public void setCaDesc(String caDesc) {
		this.caDesc = caDesc;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAuctionInfo() {
		return auctionInfo;
	}
	public void setAuctionInfo(String auctionInfo) {
		this.auctionInfo = auctionInfo;
	}
	public String getAuctionDate() {
		return auctionDate;
	}
	public void setAuctionDate(String auctionDate) {
		this.auctionDate = auctionDate;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getAddr0() {
		return addr0;
	}
	public void setAddr0(String addr0) {
		this.addr0 = addr0;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getItemType() {
		return itemType;
	}
	public void setItemType(String itemType) {
		this.itemType = itemType;
	}
	public String getAddrInfo() {
		return addrInfo;
	}
	public void setAddrInfo(String addrInfo) {
		this.addrInfo = addrInfo;
	}
	public String getValueMin() {
		return valueMin;
	}
	public void setValueMin(String valueMin) {
		this.valueMin = valueMin;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getAuctionLoc() {
		return auctionLoc;
	}
	public void setAuctionLoc(String auctionLoc) {
		this.auctionLoc = auctionLoc;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getAuctionTel() {
		return auctionTel;
	}
	public void setAuctionTel(String auctionTel) {
		this.auctionTel = auctionTel;
	}
	@Override
	public String toString() {
		return "AuctionVo [caDesc=" + caDesc + ", id=" + id + ", auctionInfo=" + auctionInfo + ", auctionDate="
				+ auctionDate + ", regDate=" + regDate + ", addr0=" + addr0 + ", addr1=" + addr1 + ", addr2=" + addr2
				+ ", addr=" + addr + ", itemType=" + itemType + ", addrInfo=" + addrInfo + ", valueMin=" + valueMin
				+ ", value=" + value + ", auctionLoc=" + auctionLoc + ", remarks=" + remarks + ", auctionTel="
				+ auctionTel + "]";
	}
	
	
	
	

	

	                                                                             

}
