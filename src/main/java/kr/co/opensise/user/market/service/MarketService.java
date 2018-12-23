package kr.co.opensise.user.market.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.opensise.admin.manage.dataetc.model.MarketDetailVo;
import kr.co.opensise.user.market.dao.MarketDaoInf;

@Service
public class MarketService implements MarketServiceInf{

	@Resource(name="marketDao")
	private MarketDaoInf marketDao;
	
	@Override
	public List<MarketDetailVo> selectAvgMkd(String dong) {
		return marketDao.selectAvgMkd(dong);
	}

	@Override
	public List<MarketDetailVo> selectMkd(String dong) {
		return marketDao.selectMkd(dong);
	}
	
	

}
