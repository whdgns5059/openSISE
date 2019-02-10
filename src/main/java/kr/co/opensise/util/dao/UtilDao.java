package kr.co.opensise.util.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.statis.model.FavoriteVo;
import kr.co.opensise.admin.statis.model.MemberVo;

@Repository
public class UtilDao implements UtilDaoInf{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;

	@Override
	public List<MemberVo> selRanMem() {
		return template.selectList("favorInsert.selRanMem");
	}

	@Override
	public List<ArticleVo> selRanArt() {
		return template.selectList("favorInsert.selRanArt");
	}

	@Override
	public int insertFavorList(List<FavoriteVo> favList) {
		return template.insert("favorInsert.insertFavorList", favList);
	}
	
	
	

}
