package kr.co.opensise.user.market.dao;

import java.util.List;

import kr.co.opensise.admin.manage.dataetc.model.MarketDetailVo;

public interface MarketDaoInf {
	
	List<MarketDetailVo> selectAvgMkd(String dong);
	
	List<MarketDetailVo> selectMkd(String dong);
	
}
