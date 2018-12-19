package kr.co.opensise.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

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
		
		// 컨트롤러 호출 전 시각
		request.setAttribute("start_time", System.currentTimeMillis());
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		uri = request.getRequestURI();
		
		/* 일일 방문자 카운트 하기 */
		long stayTime = 0;
		Cookie visitTime = null;
		Cookie visitorChk = null;
		Cookie[] getCookies = request.getCookies();
		// 방문용 쿠키만 빼오기
		for(Cookie cookie : getCookies) {
			log.info("어떤 쿠키들이 있나요? {} {}",cookie.getName(),cookie.getValue());
			if(cookie.getName().equals("visitTime")) 
				visitTime = cookie;
			if(cookie.getName().equals("visitorChk")) 
				visitorChk = cookie;
		}
		// 방문용 쿠키명도 값도 없다면, 또 시간 체크를 안했을 경우 생성해줍니다.
		if((visitTime == null || visitTime.getValue() == null) || 
				(visitorChk == null || visitorChk.getValue() == null)) {
			//log.info("방문용 쿠키가 없습니다. 새로 생성할게요");
			visitTime = new Cookie("visitTime", ""+System.currentTimeMillis());
			visitTime.setMaxAge(60*30);
			response.addCookie(visitTime);
			visitorChk = new Cookie("visitorChk","Y");
			visitorChk.setMaxAge(60*30);
			response.addCookie(visitorChk);
		// 방문용 쿠키가 있다면
		}else {
			//log.info("방문용 쿠키가 있다!");
			// 쿠키 시간 체크 여부를 확인하고
			if(visitorChk.getValue().equals("Y")) {
				// 시간을 확인하고,
				stayTime = System.currentTimeMillis() - Long.parseLong(visitTime.getValue());
				//log.info("visitTime 확인 {}",visitTime.getValue());
				//log.info("stayTime 확인 {}",stayTime);
				// 그 시간이 5초 이상 머물렀다면
				if(stayTime > 5000) {
					log.info("stayTime 5초 이상이다 {}",stayTime);
					// 방문자 데이터 insert
					statisService.insertVisitor();
					visitorChk.setValue("N");
					response.addCookie(visitorChk);
				}
			}
		}
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		if(ex != null)
			log.info("INTERCEPTOR Exception ERROR {}",ex);
			
	}
	
	
	
}
