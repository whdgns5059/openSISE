package kr.co.opensise.user.market.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.opensise.admin.manage.dataetc.model.MarketDetailVo;

@Repository
public class MarketDao implements MarketDaoInf{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;

	@Override
	public List<MarketDetailVo> selectAvgMkd(String dong) {
		return template.selectList("selectAvgMkd", dong);
	}

	@Override
	public List<MarketDetailVo> selectMkd(String dong) {
		return template.selectList("selectMkd", dong);
	}
	
	
	
	
}
