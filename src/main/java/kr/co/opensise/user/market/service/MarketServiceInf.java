package kr.co.opensise.user.market.service;

import java.util.List;

import kr.co.opensise.admin.manage.dataetc.model.MarketDetailVo;

public interface MarketServiceInf {

	List<MarketDetailVo> selectAvgMkd(String dong);
	
	List<MarketDetailVo> selectMkd(String dong);
}
