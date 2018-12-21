package kr.co.opensise.user.detail.model;

public class AvgStatVo {

	private Float price_stat;
	private Float depos_stat;
	private Float rnt_stat;
	public Float getPrice_stat() {
		return price_stat;
	}
	public void setPrice_stat(Float price_stat) {
		this.price_stat = price_stat;
	}
	public Float getDepos_stat() {
		return depos_stat;
	}
	public void setDepos_stat(Float depos_stat) {
		this.depos_stat = depos_stat;
	}
	public Float getRnt_stat() {
		return rnt_stat;
	}
	public void setRnt_stat(Float rnt_stat) {
		this.rnt_stat = rnt_stat;
	}
	@Override
	public String toString() {
		return "AvgStatVo [price_stat=" + price_stat + ", depos_stat=" + depos_stat + ", rnt_stat=" + rnt_stat + "]";
	}
	public AvgStatVo(Float price_stat, Float depos_stat, Float rnt_stat) {
		this.price_stat = price_stat;
		this.depos_stat = depos_stat;
		this.rnt_stat = rnt_stat;
	}
	public AvgStatVo() {
	}
	
	
	
	
}
