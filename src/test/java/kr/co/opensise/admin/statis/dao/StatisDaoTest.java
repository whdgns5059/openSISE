package kr.co.opensise.admin.statis.dao;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.opensise.admin.statis.model.FavoriteVo;
import kr.co.opensise.admin.statis.model.InterestVo;
import kr.co.opensise.admin.statis.model.MemberVo;
import kr.co.opensise.admin.statis.model.Page_statisticVo;
import kr.co.opensise.admin.statis.model.VisitorVo;
import kr.co.opensise.setup.RootSetup;
import kr.co.opensise.util.CommonUtilTest;

public class StatisDaoTest extends RootSetup{
	private Logger log = LoggerFactory.getLogger(CommonUtilTest.class);

	@Resource(name="statisDao")
	private StatisDaoInf statisDao;
	
	@Test
	public void countAllMembersTest() {
		int count = statisDao.countAllMembers();
		assertEquals(1000, count);
	}
	
	@Test
	public void signInDailyTest() {
		List<MemberVo> memVoList = statisDao.signInDaily();
		
		for(MemberVo memVo : memVoList)
			log.info("signInDaily : {}",memVo);
	}
	
	@Test
	public void signOutDailyTest() {
		List<MemberVo> memVoList = statisDao.signOutDaily();
		
		for(MemberVo memVo : memVoList)
			log.info("signOutDaily : {}",memVo);
	}
	
	@Test
	public void signInMonthlyTest() {
		List<MemberVo> memVoList = statisDao.signInMonthly();
		
		for(MemberVo memVo : memVoList)
			log.info("signInMonthly : {}",memVo);
	}
	
	@Test
	public void signOutMonthlyTest() {
		List<MemberVo> memVoList = statisDao.signOutMonthly();
		
		for(MemberVo memVo : memVoList)
			log.info("signOutMonthly : {}",memVo);
	}
	
	@Test
	public void signInAgeGndrTest() {
		List<MemberVo> memVoList = statisDao.signInAgeGndr();
		
		for(MemberVo memVo : memVoList)
			log.info("signInAgeGndr : {}",memVo);
	}
	
	@Test
	public void signInAgeGndrServiceTest() {
		List<MemberVo> memVoAll = statisDao.signInAgeGndr();
		
		List<MemberVo> memVoM = new ArrayList<MemberVo>();
		List<MemberVo> memVoF = new ArrayList<MemberVo>();
		
		for(MemberVo memVo : memVoAll) {
			if(memVo.getMem_gndr().equals("M")) {
				memVoM.add(memVo);
				log.info("M이야");
			}else if(memVo.getMem_gndr().equals("F")) {
				memVoF.add(memVo);
				log.info("F야");
			}else {
				log.info("정쳬는?? {}", memVo);
			}
		}
	}
	
	@Test
	public void favorEachTest() {
		List<FavoriteVo> favorList = statisDao.favorEach();
		
		for(FavoriteVo favorVo : favorList)
			log.info("찜 랭킹 {}", favorVo);
	}
	
	@Test
	public void favorDongTest() {
		List<FavoriteVo> favorList = statisDao.favorDong();
		
		for(FavoriteVo favorVo : favorList)
			log.info("찜 동별 랭킹 {}", favorVo);
	}
	
	@Test
	public void intrstAgeTest() {
		/***Given***/
		String mem_age = null;
		//mem_age = "20대";

		/***When***/
		List<InterestVo> list = statisDao.intrstAge(mem_age);

		/***Then***/
		for(InterestVo intrstVo : list)
			log.info("연령별 성별 총 {}", intrstVo);
		
	}
	
	@Test
	public void insertVisitor() {
		/***Given***/

		/***When***/
		int insertCnt = statisDao.insertVisitor();

		/***Then***/
		assertEquals(1, insertCnt);
	}
	
	@Test
	public void insertPS() {
		/***Given***/
		Map<String, Page_statisticVo> uriCounts = new HashMap<String, Page_statisticVo>();
		//uriCounts.put("/main/main", new Page_statisticVo("메인페이지", "/main/main", 2));
		//uriCounts.put("/detail/info", new Page_statisticVo("건물상세", "/detail/info", 3));

		/***When***/
		int insertCnt = statisDao.insertPS(uriCounts);

		/***Then***/
		assertEquals(-1, insertCnt);
	}
	
	@Test
	public void visitDate() {
		/***Given***/
		
		/***When***/
		List<VisitorVo> visitDate = statisDao.visitDate();

		/***Then***/
		log.info("날짜별 방문 수 {}", visitDate);
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// DummyData 연령대 추가
//	@Test
//	public void ageTest() {
//		String[] ages = {"10대", "20대", "30대", "40대", "50대", "60대 이상"};
//		
//		for(int i=6 ; i<=1000; i++) {
//			MemberVo memVo = new MemberVo();
//			memVo.setMem_no(i);
//			memVo.setMem_age(ages[(int)(Math.random()*ages.length)]);
//			
//			int cnt = statisDao.test(memVo);
//			log.info("결과: {}",memVo);
//		}
		
		
		
}
	

	
	
	
	
	
	
	
	
	
	


