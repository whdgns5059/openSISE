package kr.co.opensise.user.detail.dao;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.opensise.admin.manage.datatrade.model.ArticleVo;
import kr.co.opensise.admin.manage.datatrade.model.DealVo;
import kr.co.opensise.admin.statis.model.FavoriteVo;
import kr.co.opensise.setup.RootSetup;
import kr.co.opensise.user.detail.dao.DetailDaoInf;
import kr.co.opensise.user.detail.model.AvgStatVo;
import kr.co.opensise.user.detail.model.AvgTradeVo;
import kr.co.opensise.user.detail.model.PictureVo;
import kr.co.opensise.user.detail.model.PostVo;
import kr.co.opensise.user.detail.model.ReplyVo;

public class DetailDaoTest extends RootSetup{

	private Logger log = LoggerFactory.getLogger(DetailDaoTest.class);
	
	@Resource(name="detailDao")
	private DetailDaoInf detailDao;
	
	@Test
	public void selectArticleTest() {
		/***given***/
		ArticleVo articleVo = new ArticleVo();
		articleVo.setArtcl_gu("서구");
		articleVo.setArtcl_dong("월평동");
		articleVo.setArtcl_zip("311-1");
		articleVo.setArtcl_rd("청사로");
		
		/***when***/
		ArticleVo result = detailDao.selectArticle(articleVo);
		log.info(result.toString());
		/***then***/
		assertEquals("36.360773619481314", result.getArtcl_lat());
	}
	
	@Test
	public void selectDealListTest() {
		/***given***/
		DealVo dealVo = new DealVo();
		dealVo.setDl_gu("서구");
		dealVo.setDl_dong("월평동");
		dealVo.setDl_zip("311-1");
		dealVo.setDl_rd("청사로");
		dealVo.setDl_ty("매매");
		
		/***when***/
		List<DealVo> result = detailDao.selectDealList(dealVo);
		
		for(DealVo dVo : result) {
			log.info(dVo.toString());
		}

		/***then***/
		assertEquals(7, result.size());
	}
	
	@Test
	public void selectAreasTest() {
		
		/***given***/
		ArticleVo articleVo = new ArticleVo();
		articleVo.setArtcl_gu("서구");
		articleVo.setArtcl_dong("월평동");
		articleVo.setArtcl_zip("311-1");
		articleVo.setArtcl_rd("청사로");
		
		/***when***/
		List<String> result = detailDao.selectAreas(articleVo);

		for(String str : result) {
			log.info("평수 : {}", str);
		}
		
		/***then***/
		assertEquals(2, result.size());
		
		
	}

	@Test
	public void selectAvgPriceTest() {
		
		/***given***/
		DealVo dealVo = new DealVo();
		dealVo.setDl_gu("서구");
		dealVo.setDl_dong("월평동");
		dealVo.setDl_zip("311-1");
		dealVo.setDl_rd("청사로");
		dealVo.setDl_ty("전세");
		dealVo.setDl_excv_area(59.76f);
		
		/***when***/
		AvgTradeVo avgTrade = detailDao.selectAvgPrice(dealVo);

		/***then***/
		assertEquals(16914.0, avgTrade.getAvg_depos() , 1e-8);
		
	}
	
	@Test
	public void selectRecentTradeTest() {
		/***given***/
		DealVo dealVo = new DealVo();
		dealVo.setDl_gu("서구");
		dealVo.setDl_dong("월평동");
		dealVo.setDl_zip("311-1");
		dealVo.setDl_rd("청사로");
		dealVo.setDl_ty("매매");
		dealVo.setDl_excv_area(59.76f);
		/***when***/
		List<DealVo> recentDealVo = detailDao.selectRecentTrade(dealVo);
		
		/***then***/
		assertEquals(4, recentDealVo.size());
	}
	
	
	@Test
	public void selectDealListByArea() {
		
		/***given***/
		DealVo dealVo = new DealVo();
		dealVo.setDl_gu("서구");
		dealVo.setDl_dong("월평동");
		dealVo.setDl_zip("311-1");
		dealVo.setDl_rd("청사로");
		dealVo.setDl_ty("매매");
		dealVo.setDl_excv_area(59.76f);
		
		/***when***/
		List<DealVo> result = detailDao.selectDealListByArea(dealVo);

		/***then***/
		assertEquals(516, result.size());
		
		
		
	}
	
	
	@Test
	public void insertReview() {
		
		/***given***/
		PostVo postVo = new PostVo();
		postVo.setPost_brd(1);
		postVo.setPost_mem(7);
		postVo.setPost_ttl("흠.. 허어..");
		postVo.setPost_cntnt("흐음.. 허어.. 흐으으음..");
		postVo.setPost_star("4");
		postVo.setPost_gu("서구");
		postVo.setPost_dong("월평동");
		postVo.setPost_zip("311-1");
		postVo.setPost_rd("청사로");
		
		/***when***/
		int result = detailDao.insertReview(postVo);
		
		/***then***/
		assertEquals(1, result);
		
	}
	
	
	@Test
	public void selectReviewTest() {
		
		
		/***given***/
		ArticleVo articleVo = new ArticleVo();
		articleVo.setArtcl_gu("서구");
		articleVo.setArtcl_dong("월평동");
		articleVo.setArtcl_zip("311-1");
		articleVo.setArtcl_rd("청사로");
		
		/***when***/
		List<PostVo> result = detailDao.selectReview(articleVo);

		/***then***/
		assertEquals(6, result.size());
		
		
	}
	
	@Test
	public void selectMonthlyAvg() {
		
		/***given***/
		DealVo dealVo = new DealVo();
		dealVo.setDl_gu("서구");
		dealVo.setDl_dong("월평동");
		dealVo.setDl_zip("311-1");
		dealVo.setDl_rd("청사로");
		dealVo.setDl_ty("매매");
		dealVo.setDl_excv_area(59.76f);
		
		/***when***/
		List<DealVo> result = detailDao.selectMonthlyAng(dealVo);
		
		
		/***then***/
		assertEquals(131, result.size());
		
		
	}

	
	@Test
	public void insertReplyTest() {
		/***given***/
		ReplyVo replyVo = new ReplyVo();
		replyVo.setRpl_cntnt("test케이스 리플");
		replyVo.setRpl_post(5);
		replyVo.setRpl_mem(10);
		
		/***when***/
		int result = detailDao.insertReply(replyVo);
		

		/***then***/
		assertEquals(1, result);
	}
	
	@Test
	public void selectReply() {
		
		/***given***/
		int post_no = 5;
		/***when***/
		List<ReplyVo> result = detailDao.selectReply(post_no);

		/***then***/
		assertEquals(2, result.size());
		
		
	}
	
	
	@Test
	public void deleteReply() {
		
		/***given***/
		int rpl_no = 4;
		/***when***/
		int result = detailDao.deleteReply(rpl_no);

		/***then***/
		assertEquals(1, result);
		
	}
	
	@Test
	public void selectReviewByNo() {
		
		/***given***/
		String post_no = "5";
		/***when***/
		PostVo result = detailDao.selectReviewByNo(post_no);

		/***then***/
		assertEquals(5, result.getPost_no());
	}

	@Test
	public void selectReviewPicTest() {
		
		/***given***/
		PostVo postVo = new PostVo();
		postVo.setPost_no(30);
		/***when***/
		List<PictureVo> picList = detailDao.selectReviewPic(postVo);

		/***then***/
		assertEquals(3, picList.size());
		
		
	}
	
	
	@Test
	public void selectPriceStatAptTest() {
	
		/***given***/
		DealVo dealVo = new DealVo();
		dealVo.setDl_gu("서구");
		dealVo.setDl_dong("월평동");
		dealVo.setDl_zip("311-1");
		dealVo.setDl_rd("청사로");
		dealVo.setDl_ty("매매");
		dealVo.setArtcl_bc("apt");
		/***when***/
		AvgStatVo result = detailDao.selectPriceStat(dealVo);

		/***then***/
		assertEquals(10, result.getPrice_stat(), 1e-1);
		
		
	}
	
	@Test
	public void selectPriceStatOfficeTest() {
	
		/***given***/
		DealVo dealVo = new DealVo();
		dealVo.setDl_gu("유성구");
		dealVo.setDl_dong("봉명동");
		dealVo.setDl_zip("535-6");
		dealVo.setDl_rd("대학로");
		dealVo.setDl_ty("매매");
		dealVo.setArtcl_bc("office");
		/***when***/
		AvgStatVo result = detailDao.selectPriceStat(dealVo);

		/***then***/
		assertEquals(77, result.getPrice_stat(), 1e-1);
		
		
	}
	
	@Test
	public void selectPriceStatOfficeTest2() {
	
		/***given***/
		DealVo dealVo = new DealVo();
		dealVo.setDl_gu("유성구");
		dealVo.setDl_dong("궁동");
		dealVo.setDl_zip("451-6");
		dealVo.setDl_rd("대학로81번길");
		dealVo.setDl_ty("매매");
		dealVo.setArtcl_bc("office");
		
		/***when***/
		AvgStatVo result = detailDao.selectPriceStat(dealVo);
		
		/***then***/
		assertEquals(null, result);
		
		
	}
	
	
	@Test
	public void selectPriceStatOfficeTest3() {
	
		
		
		/***given***/
		DealVo dealVo = new DealVo();
		dealVo.setDl_gu("유성구");
		dealVo.setDl_dong("봉명동");
		dealVo.setDl_zip("535-6");
		dealVo.setDl_rd("대학로");
		dealVo.setDl_ty("월세");
		dealVo.setArtcl_bc("office");
		/***when***/
		AvgStatVo result = detailDao.selectPriceStat(dealVo);

		/***then***/
		assertEquals(0.3, result.getRnt_stat(), 1e-1);
		assertEquals(30, result.getDepos_stat(), 1e-1);
		
		
	}
	
	
	
	@Test
	public void selectMarketStatTest() {
		
		/***given***/
		String dong = "월평";
		/***when***/
		float result = detailDao.selectMarketStat(dong);

		/***then***/
		assertEquals(3, result, 1e-1);
	}
	
	@Test
	public void selectHumanStatTest() {
		
		/***given***/
		String dong = "월평";
		
		/***when***/
		Float result = detailDao.selectHumanStat(dong);

		/***then***/
		assertEquals(-5.4, result, 1e-1);
		
	}
	@Test
	public void selectHumanStatBongTest() {
		
		/***given***/
		String dong = "봉명";
		
		/***when***/
		Float result = detailDao.selectHumanStat(dong);

		/***then***/
		assertEquals(null, result);
	}
	
	
	@Test
	public void insertFavorTest() {
		
		/***given***/
		FavoriteVo favorVo = new FavoriteVo();
		favorVo.setFavor_mem(10);
		favorVo.setFavor_gu("서구");
		favorVo.setFavor_dong("월평동");
		favorVo.setFavor_zip("311-1");
		favorVo.setFavor_rd("청사로");
		favorVo.setFavor_ty("매매");
		
		/***when***/
		int result = detailDao.insertFavor(favorVo);
		
		
		/***then***/
		assertEquals(1, result);
		
	}
	
	@Test
	public void selectFavor() {
		
		/***given***/
		FavoriteVo favorVo = new FavoriteVo();
		favorVo.setFavor_mem(9);
		favorVo.setFavor_gu("서구");
		favorVo.setFavor_dong("월평동");
		favorVo.setFavor_zip("311-1");
		favorVo.setFavor_rd("청사로");
		favorVo.setFavor_ty("매매");
		
		/***when***/
		FavoriteVo result = detailDao.selectFavor(favorVo);
		

		/***then***/
		assertEquals(21, result.getFavor_no());
		
	}
	
}



























