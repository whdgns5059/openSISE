package kr.co.opensise.sessionListener;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.opensise.interceptor.Interceptor;

public class SessionListener implements HttpSessionListener{

	private Logger log = LoggerFactory.getLogger(Interceptor.class);
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		Map<String, Integer> uriCounts = new HashMap<String, Integer>();
		
		// 생성된 세션 받기
		HttpSession session = se.getSession();
		
		// 세션에 저장하기
		try {
			session.setAttribute("uriCounts", uriCounts);
		}catch(Exception e){
			System.out.println("SessionListener : sessionCreated() ERROR" + e.getMessage());
			log.info("SessionListener : sessionCreated() ERROR : {}", e.getMessage());
		}
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// 사라질 세션 받기
		HttpSession session = se.getSession();
		
		System.out.println("세션이야~"+session);
	}

}
