package kr.co.opensise.interceptor;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.opensise.admin.statis.model.Page_statisticVo;
import kr.co.opensise.admin.statis.service.StatisServiceInf;


public class Interceptor extends HandlerInterceptorAdapter{
	
	@Resource(name="statisService")
	private StatisServiceInf statisService;
	
	private Logger log = LoggerFactory.getLogger(Interceptor.class);
	private String uri;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		/* 페이지 방문 통계 */
		uri = request.getRequestURI();
		log.info("페이지명 : {}",uri);
		
		// 페이지 통계용 세션 가져오기
		HttpSession session =  request.getSession();
		Map<String, Page_statisticVo> uriCounts = (HashMap<String, Page_statisticVo>)session.getAttribute("uriCounts");
		// 페이지별 카운트 수 올리기
		if(uriCounts != null) {
			switch(uri){
				//* 회원 내정보
		        case "/mypage/myInfo" : 
		        	if(uriCounts.get(uri) == null) {
		        		uriCounts.put(uri, new Page_statisticVo("회원 내정보", uri, 1));
		        	}else {
		        		uriCounts.get(uri).setPs_vstr(uriCounts.get(uri).getPs_vstr() + 1);
		        		uriCounts.put(uri, uriCounts.get(uri));
		        	}
		            break;
		        // 회원 찜목록
		        case "/mypage/steamList" : 
		        	if(uriCounts.get(uri) == null) {
		        		uriCounts.put(uri, new Page_statisticVo("회원 찜목록", uri, 1));
		        	}else {
		        		uriCounts.get(uri).setPs_vstr(uriCounts.get(uri).getPs_vstr() + 1);
		        		uriCounts.put(uri, uriCounts.get(uri));
		        	}
		        	break;
		        // 회원 최근 본 매물
		        case "/mypage/recentlyviewed" : 
		        	if(uriCounts.get(uri) == null) 
		        		uriCounts.put(uri, new Page_statisticVo("회원 최근 본 매물", uri, 1));
		        	else 
		        		uriCounts.get(uri).setPs_vstr(uriCounts.get(uri).getPs_vstr() + 1);
		        	
		        	uriCounts.put(uri, uriCounts.get(uri));
		        	break;
		        // 회원 가입 마지막 절차
		        case "/login/signupDetail" : 
		        	if(uriCounts.get(uri) == null) {
		        		uriCounts.put(uri, new Page_statisticVo("회원 가입", uri, 1));
		        	}else {
		        		uriCounts.get(uri).setPs_vstr(uriCounts.get(uri).getPs_vstr() + 1);
		        		uriCounts.put(uri, uriCounts.get(uri));
		        	}
		        	break;
		        //* 메인페이지
		        case "/main/main" : 
		        	if(uriCounts.get(uri) == null) {
		        		uriCounts.put(uri, new Page_statisticVo("메인페이지", uri, 1));
		        	}else {
		        		uriCounts.get(uri).setPs_vstr(uriCounts.get(uri).getPs_vstr() + 1);
		        		uriCounts.put(uri, uriCounts.get(uri));
		        	}
		            break;
		        // 건물상세
		        case "/detail/info" : 
		        	if(uriCounts.get(uri) == null) {
		        		uriCounts.put(uri, new Page_statisticVo("건물상세", uri, 1));
		        	}else {
		        		uriCounts.get(uri).setPs_vstr(uriCounts.get(uri).getPs_vstr() + 1);
		        		uriCounts.put(uri, uriCounts.get(uri));
		        	}
		        	break;
		        // 지역분석
		        case "/local/local" : 
		        	if(uriCounts.get(uri) == null) {
		        		uriCounts.put(uri, new Page_statisticVo("지역분석", uri, 1));
		        	}else {
		        		uriCounts.get(uri).setPs_vstr(uriCounts.get(uri).getPs_vstr() + 1);
		        		uriCounts.put(uri, uriCounts.get(uri));
		        	}
		        	break;
		        // 법원경매
		        case "/auction/auction" : 
		        	if(uriCounts.get(uri) == null) {
		        		uriCounts.put(uri, new Page_statisticVo("법원경매", uri, 1));
		        	}else {
		        		uriCounts.get(uri).setPs_vstr(uriCounts.get(uri).getPs_vstr() + 1);
		        		uriCounts.put(uri, uriCounts.get(uri));
		        	}
		        	break;
		        default :
		        	break;
			}
		// 만약 페이지 통계용 세션이 없다면
		}else {
			uriCounts = new HashMap<String, Page_statisticVo>();
			session.setAttribute("uriCounts", uriCounts);
		}
			
		// 다시 session에 넣기
		session.setAttribute("uriCounts", uriCounts);
		
		/* 일일 방문자 카운트 하기 */
//		long stayTime = 0;
//		Cookie visitTime = null;
//		Cookie visitorChk = null;
//		Cookie[] getCookies = request.getCookies();
//		// 방문용 쿠키만 빼오기
//		for(Cookie cookie : getCookies) {
//			log.info("어떤 쿠키들이 있나요? {} {}",cookie.getName(),cookie.getValue());
//			if(cookie.getName().equals("visitTime")) 
//				visitTime = cookie;
//			if(cookie.getName().equals("visitorChk")) 
//				visitorChk = cookie;
//		}
//		// 기본적으로 openPage에서 cookie를 생성해 줍니다.
//		// 하지만 사이트 방문 후 30분이 지나면 쿠키가 삭제 되고, 새로운 방문으로 간주합니다.
//		if((visitTime == null || visitTime.getValue() == null) || 
//				(visitorChk == null || visitorChk.getValue() == null)) {
//			//log.info("방문용 쿠키가 없습니다. 새로 생성할게요");
//			visitTime = new Cookie("visitTime", ""+System.currentTimeMillis());
//			visitTime.setMaxAge(60*30);
//			response.addCookie(visitTime);
//			visitorChk = new Cookie("visitorChk","Y");
//			visitorChk.setMaxAge(60*30);
//			response.addCookie(visitorChk);
//		// 방문용 쿠키가 있다면
//		}else {
//			//log.info("방문용 쿠키가 있다!");
//			// 쿠키 시간 체크 여부를 확인하고
//			if(visitorChk.getValue().equals("Y")) {
//				// 시간을 확인하고,
//				stayTime = System.currentTimeMillis() - Long.parseLong(visitTime.getValue());
//				//log.info("visitTime 확인 {}",visitTime.getValue());
//				//log.info("stayTime 확인 {}",stayTime);
//				// 그 시간이 5초 이상 머물렀다면
//				if(stayTime > 5000) {
//					//log.info("stayTime 5초 이상이다 {}",stayTime);
//					// 방문자 데이터 insert
//					statisService.insertVisitor();
//					visitorChk.setValue("N");
//					response.addCookie(visitorChk);
//				}
//			}
//		}
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		if(ex != null)
			log.info("INTERCEPTOR Exception ERROR {}",ex);
			
	}
	
	
	
}
