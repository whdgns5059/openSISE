package kr.co.opensise.admin.statis.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.opensise.admin.statis.model.FavoriteVo;
import kr.co.opensise.admin.statis.model.InterestVo;
import kr.co.opensise.admin.statis.model.MemberVo;
import kr.co.opensise.admin.statis.model.Page_statisticVo;
import kr.co.opensise.admin.statis.model.VisitorVo;


@Repository
public class StatisDao implements StatisDaoInf {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	@Override
	public int countAllMembers() {
		int countAllMembers = template.selectOne("admin_statis.countAllMembers");
		return countAllMembers;
	}

	@Override
	public int countSignIn() {
		int countSignIn = template.selectOne("admin_statis.countSignIn");
		return countSignIn;
	}

	@Override
	public List<MemberVo> signInDaily() {
		List<MemberVo> memVoList = template.selectList("admin_statis.signInDaily");
		return memVoList;
	}

	@Override
	public List<MemberVo> signOutDaily() {
		List<MemberVo> memVoList = template.selectList("admin_statis.signOutDaily");
		return memVoList;
	}

	@Override
	public List<MemberVo> signInMonthly() {
		List<MemberVo> memVoList = template.selectList("admin_statis.signInMonthly");
		return memVoList;
	}

	@Override
	public List<MemberVo> signOutMonthly() {
		List<MemberVo> memVoList = template.selectList("admin_statis.signOutMonthly");
		return memVoList;
	}

	@Override
	public List<MemberVo> signInAgeGndr() {
		List<MemberVo> memVoList = template.selectList("admin_statis.signInAgeGndr");
		return memVoList;
	}
	
	@Override
	public List<FavoriteVo> favorEach() {
		List<FavoriteVo> favorVoList = template.selectList("admin_statis.favorEach");
		return favorVoList;
	}
	
	@Override
	public List<FavoriteVo> favorDong() {
		List<FavoriteVo> favorVoList = template.selectList("admin_statis.favorDong");
		return favorVoList;
	}

	@Override
	public List<FavoriteVo> favorGu() {
		List<FavoriteVo> favorVoList = template.selectList("admin_statis.favorGu");
		return favorVoList;
	}

	@Override
	public int countAllIntrst() {
		int maxCnt = template.selectOne("admin_statis.countAllIntrst");
		return maxCnt;
	}

	@Override
	public List<InterestVo> intrstAll() {
		List<InterestVo> intrstVo = template.selectList("admin_statis.intrstAll");
		return intrstVo;
	}

	@Override
	public List<String> ageList() {
		List<String> ageList = template.selectList("admin_statis.ageList");
		return ageList;
	}
	
	@Override
	public List<InterestVo> intrstAge(String mem_age) {
		List<InterestVo> intrstVo = template.selectList("admin_statis.intrstAge", mem_age);
		return intrstVo;
	}

	@Override
	public int insertVisitor() {
		int insertCnt = template.insert("admin_statis.insertVisitor");
		return insertCnt;
	}

	@Override
	public VisitorVo maxVisit() {
		VisitorVo maxCnt = template.selectOne("admin_statis.maxVisit");
		return maxCnt;
	}
	
	@Override
	public List<VisitorVo> visitDate() {
		List<VisitorVo> visitVo = template.selectList("admin_statis.visitDate");
		return visitVo;
	}
	
	@Override
	public List<VisitorVo> visitDay() {
		List<VisitorVo> visitVo = template.selectList("admin_statis.visitDay");
		return visitVo;
	}
	
	@Override
	public List<VisitorVo> maxVisitDay() {
		List<VisitorVo> visitVo = template.selectList("admin_statis.maxVisitDay");
		return visitVo;
	}
	
	@Override
	public List<VisitorVo> visitHour() {
		List<VisitorVo> visitVo = template.selectList("admin_statis.visitHour");
		return visitVo;
	}

	@Override
	public int insertPS(Map<String, Page_statisticVo> uriCounts) {
		int insertCnt = template.insert("admin_statis.insertPS", uriCounts);
		return insertCnt;
	}

	@Override
	public List<Page_statisticVo> psDate(Page_statisticVo psVo) {
		List<Page_statisticVo> psVoList = template.selectList("admin_statis.psDate", psVo);
		return psVoList;
	}

	@Override
	public List<Page_statisticVo> psPage() {
		List<Page_statisticVo> psVo = template.selectList("admin_statis.psPage");
		return psVo;
	}

	@Override
	public List<String> pageCount() {
		List<String> ps_pgList = template.selectList("admin_statis.pageCount");
		return ps_pgList;
	}

	@Override
	public Page_statisticVo pageMax() {
		Page_statisticVo psVo = template.selectOne("admin_statis.pageMax");
		return psVo;
	}

	

	

	
	
	
	
	
	
	
	
	
//	@Override
//	public int test(MemberVo memVo) {
//		int cnt = template.insert("admin_statis.test",memVo);
//		return cnt;
//	}
	

	
	

}
