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
		List<MarketDetailVo> result = marketDao.selectAvgMkd(dong);
		
		for(int i = 1 ; i < result.size() ; i++) {
			int mkd_price = result.get(i).getMkd_price();

			if(mkd_price == 0) {
				result.get(i).setMkd_price(result.get(i-1).getMkd_price());
			}
		}
		
		return result;
		
	}

	@Override
	public List<MarketDetailVo> selectMkd(String dong) {
		return marketDao.selectMkd(dong);
	}
	
	

}
