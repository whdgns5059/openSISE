package kr.co.opensise.util;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.statis.model.FavoriteVo;
import kr.co.opensise.admin.statis.model.MemberVo;
import kr.co.opensise.setup.RootSetup;
import kr.co.opensise.user.detail.dao.DetailDaoInf;
import kr.co.opensise.util.dao.UtilDao;
import kr.co.opensise.util.dao.UtilDaoInf;

public class FavorRandomInsert extends RootSetup{

	private Logger log = LoggerFactory.getLogger(FavorRandomInsert.class);
	
	@Resource(name="utilDao")
	private UtilDaoInf utilDao;
	
	@Resource(name="detailDao")
	private DetailDaoInf detailDao;
	
	@Test
	public void favorRandonInsertTest() {
		
		/***given***/
		int result = 0;
		/***when***/
			
					
			List<MemberVo> memList = utilDao.selRanMem();
			List<ArticleVo>	artList = utilDao.selRanArt();
			List<FavoriteVo> favList = new ArrayList<>();
				
			for(MemberVo memberVo : memList) {
				log.info(memberVo.toString());
			}
			
			for(ArticleVo articleVo: artList) {
				log.info(articleVo.toString());
			}
			
			for(int i = 0; i < memList.size() ; i++) {
		
				
				FavoriteVo favorVo = new FavoriteVo();
				
				favorVo.setFavor_mem(memList.get(i).getMem_no());
				favorVo.setFavor_gu(artList.get(2*i + 1).getArtcl_gu());
				favorVo.setFavor_dong(artList.get(2*i + 1).getArtcl_dong());
				favorVo.setFavor_zip(artList.get(2*i + 1).getArtcl_zip());
				favorVo.setFavor_rd(artList.get(2*i + 1).getArtcl_rd());
				favorVo.setFavor_ty("매매");
				
				log.info(favorVo.toString());
				
				FavoriteVo favorVo2 = new FavoriteVo();
				
				favorVo2.setFavor_mem(memList.get(i).getMem_no());
				favorVo2.setFavor_gu(artList.get(2*i).getArtcl_gu());
				favorVo2.setFavor_dong(artList.get(2*i).getArtcl_dong());
				favorVo2.setFavor_zip(artList.get(2*i).getArtcl_zip());
				favorVo2.setFavor_rd(artList.get(2*i).getArtcl_rd());
				favorVo2.setFavor_ty("매매");
				
				
				log.info(favorVo2.toString());
				
				
				favList.add(favorVo);
				favList.add(favorVo2);
				
			}
			
			for(FavoriteVo fVo : favList) {
				
				result += detailDao.insertFavor(fVo);
				
			}
			

		
		/***then***/
		assertEquals(198, result);
	}

}



















