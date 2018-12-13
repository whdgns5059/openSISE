package kr.co.opensise.user.detail.model;

public class AvgTradeVo {
	
	private double avg_price;
	private double avg_depos;
	private double avg_rnt;
	
	public double getAvg_price() {
		return avg_price;
	}
	public void setAvg_price(double avg_price) {
		this.avg_price = avg_price;
	}
	public double getAvg_depos() {
		return avg_depos;
	}
	public void setAvg_depos(double avg_depos) {
		this.avg_depos = avg_depos;
	}
	public double getAvg_rnt() {
		return avg_rnt;
	}
	public void setAvg_rnt(double avg_rnt) {
		this.avg_rnt = avg_rnt;
	}

	@Override
	public String toString() {
		return "AvgTrade [avg_price=" + avg_price + ", avg_depos=" + avg_depos + ", avg_rnt=" + avg_rnt + "]";
	}
	
	
	
	
}
