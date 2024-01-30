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

@Service("PageCountFilter")
public class PageCountFilter implements Filter {
	// @Autowired
	// private LogService logService;
/*
	@Autowired
	private PagecountService pagecountService;

	protected Log log = LogFactory.getLog(PageCountFilter.class);

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		if (log.isDebugEnabled()) {
			log.debug("======================================    AccessLogFilter init   ======================================\n");
		}
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		chain.doFilter(request, response);// 다음 필터

		PagecountVO pagecountVo = new PagecountVO();
		String path = ((HttpServletRequest) request).getRequestURI();

		if (log.isDebugEnabled()) {
			log.debug("======================================    AccessLogFilter doFilter   ======================================\n");
			log.debug("path : " + path);
			log.debug("pagecountService : " + pagecountService);
		}

		Set<String> keySet = request.getParameterMap().keySet();
		Iterator<String> iterator = keySet.iterator();
		String str = "?";
		while (iterator.hasNext()) {
			String key = iterator.next();
			String value = request.getParameter(key);
			log.debug("key : " + key + ", value : " + value);
			str += key + "=" + value + "&";
		}
		str = str.substring(0, str.length()-1);
		
		if(path.indexOf("subpage/view.do?") > -1)
		{
			pagecountVo.setPATH(path + str);
		}else
		{
			pagecountVo.setPATH(path);
		}
		
		

		pagecountService.insert(pagecountVo);
*/
		// logService.insertLog(log);


	@Override
	public void destroy() {

		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
		
	}
}