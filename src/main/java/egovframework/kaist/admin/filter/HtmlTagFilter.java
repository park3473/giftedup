package egovframework.kaist.admin.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service("HtmlTagFilter")
public class HtmlTagFilter implements Filter {
	// @Autowired
	// private LogService logService;


	@Override
	public void destroy() {

		
	}

	
	@Override
	public void doFilter(ServletRequest request,
			ServletResponse response, 
			FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		//new 생성자로 새로운 HttpServletRequest를 캐스팅 하여 request에 담습니다.

		System.out.println("=====================start doFilter ");
		String uri = ((HttpServletRequest)request).getRequestURI();
		System.out.println("=====================start doFilter U "  + uri);
		
		chain.doFilter(request, response);
		//chain.doFilter(new HTMLTagFilterRequestWrapper((HttpServletRequest)request), response);
		
		System.out.println("=====================END doFilter ");
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("=====================start init doFilter ");
		
	}
}