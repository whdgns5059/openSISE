package kr.co.opensise.sessionListener;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.XmlWebApplicationContext;

import kr.co.opensise.admin.statis.model.Page_statisticVo;
import kr.co.opensise.admin.statis.service.StatisServiceInf;
import kr.co.opensise.interceptor.Interceptor;

public class SessionListener implements HttpSessionListener{
	
	Map<String, Page_statisticVo> uriCounts;
	XmlWebApplicationContext context;
	StatisServiceInf statisService;
	
	private Logger log = LoggerFactory.getLogger(Interceptor.class);
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		context = (XmlWebApplicationContext) se.getSession().getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		statisService =context.getBean("statisService", StatisServiceInf.class);
		
		uriCounts = new HashMap<String, Page_statisticVo>();
		
		// 생성된 세션 받기
		HttpSession session = se.getSession();
		
		try {
			// 페이지 카운트용 map을 세션에 저장하기
			session.setAttribute("uriCounts", uriCounts);
			
			// 방문 데이터 입력 실행
			statisService.insertVisitor();
			
		}catch(Exception e){
			log.info("SessionListener : sessionCreated() ERROR : {}", e.getMessage());
		}
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		context = (XmlWebApplicationContext) se.getSession().getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		statisService =context.getBean("statisService", StatisServiceInf.class);
		
		// 사라질 세션 받기
		HttpSession session = se.getSession();
		uriCounts = (HashMap<String, Page_statisticVo>)session.getAttribute("uriCounts");
		
		// 다른 페이지 방문이 없었을 시 페이지 방문 데이터는 입력하지 않습니다.
		if(uriCounts.isEmpty()) {
			log.info("map은 정보가 없습니다");
		}else {
			// 페이지 counts insert 하기
			statisService.insertPS(uriCounts);
		}
		
		
	}

}






















