package kr.co.opensise.interceptor;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class FilterTest implements Filter {
	
	private Logger log = LoggerFactory.getLogger(Interceptor.class);
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		log.info("필터 요청");

		// 다른 적용할 필터가 있으면 다른 필터로 요청을 넘기고
		// 더이상 적용할 필터가 없으면 이동 페이지로 요청을 이관
		chain.doFilter(request, response);
		
		log.info("요청 이관");
	}

	@Override
	public void destroy() {
		log.info("필터 죽는다~~~~~~~~~~~~");
	}

}
