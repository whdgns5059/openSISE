package kr.co.opensise.user.detail.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;
import kr.co.opensise.user.detail.dao.DetailDaoInf;

@Service
public class DetailService implements DetailServiceInf{

	@Resource(name="detailDao")
	private DetailDaoInf detailDao;
	
	@Override
	public Map<String, Object> getDetailInfo(ArticleVo articleVo, String dl_ty) {
		
		Map<String, Object> detailMap = new HashMap<String, Object>();
		
		//select를 위한 articleVo는 그대로 가면 됨.., DealVo 생성
		DealVo dealVo = new DealVo();
		dealVo.setDl_gu(articleVo.getArtcl_gu());
		dealVo.setDl_dong(articleVo.getArtcl_dong());
		dealVo.setDl_zip(articleVo.getArtcl_zip());
		dealVo.setDl_rd(articleVo.getArtcl_rd());
		dealVo.setDl_ty(dl_ty);
		
		ArticleVo selectArticleVo = detailDao.selectArticle(articleVo);
		detailMap.put("selectArticleVo", selectArticleVo);
		
		List<DealVo> selectDealVoList = detailDao.selectDealList(dealVo);
		detailMap.put("selectDealVoList", selectDealVoList);

		return detailMap;
	}


}
