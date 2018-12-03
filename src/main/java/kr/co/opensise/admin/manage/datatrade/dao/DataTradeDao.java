package kr.co.opensise.admin.manage.datatrade.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;

@Repository
public class DataTradeDao implements DataTradeDaoInf{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	@Override
	public int insertData(List<ArticleVo> dataTradeList) {
		//TODO : dataInsert
		return 0;
	}

}
