package egovframework.kaist.admin.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.system.util.SUtil;

public class AcceptIpInterceptor extends HandlerInterceptorAdapter {

	protected Log log = LogFactory.getLog(AcceptIpInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		String context = request.getContextPath();
		boolean rtn = true;
		log.debug("log.isDebugEnabled() : " + log.isDebugEnabled());
		if (request.getRequestURI().indexOf("/smart/resources/") > -1) {
			return true;
		}
		
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();

		String ip = request.getHeader("X-FORWARDED-FOR"); 
        
        //proxy 환경일 경우
        if (ip == null || ip.length() == 0) {
            ip = request.getHeader("Proxy-Client-IP");
        }

        //웹로직 서버일 경우
        if (ip == null || ip.length() == 0) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }

        if (ip == null || ip.length() == 0) {
            ip = request.getRemoteAddr() ;
        }
        String clientIp = ip;
    	
		if (log.isDebugEnabled())
		{
			log.debug("======================================    INTERCEPTOR  START   ======================================");
			log.debug(" Request URI \t:  " + request.getRequestURI());
			SUtil.parameterLog(log, request);
			log.debug(" getMethod GET OR POST URI \t:  " + request.getMethod());
			log.debug(" clinet accept ip : " + clientIp);
			
			if(false)
			{
				log.debug(" clinet accept ip1 : " + request.getHeader("X-FORWARDED-FOR"));
				log.debug(" clinet accept ip2 : " + request.getHeader("WL-Proxy-Client-IP"));
				log.debug(" clinet accept ip3 : " + request.getRemoteAddr());
				log.debug(" clinet accept ip3 : " + request.getHeader("Proxy-Client-IP"));
				log.debug(" clinet accept ip3 : " +request.getHeader("Proxy-Client-IP"));
				log.debug(" clinet accept ip3 : " +request.getHeader("HTTP_CLIENT_IP"));
				log.debug(" clinet accept ip3 : " +request.getHeader("REMOTE_ADDR"));
				log.debug(" clinet accept ip3 : " + request.getRemoteAddr());
			}
		}
		
		 //접근가능 아이피 획득
	     boolean acceptIpRtn = false;
	     if (clientIp == null)
	     {
	    	 
	     }else
	     {
	    	 /*
	    	 List ipList = configService.getConfigList("ACCEPT_IP");
	    	 for(int i = 0 ; i < ipList.size(); i++)
	    	 {
	    		 
	    		 ConfigVO Vo = (ConfigVO) ipList.get(i);
	    		 
	    		 log.debug(" clinet accept list : " + Vo.getTITLE());
	    		 if(Vo.getTITLE().equals(clientIp))
	    		 {
	    			 acceptIpRtn = true;
	    		 }
	    	 }
	    	 
	    	 if(ipList.size() == 0)
	    	 {
	    		 acceptIpRtn = true;
	    	 }*/
	     }
	            
	     log.debug(" clinet accept ip true : " + acceptIpRtn);
	     
	     if(acceptIpRtn == true)
	     {
	    	 log.debug("접근 권한 허가 아이피 : " + clientIp);
	    	 return true;
	     }else
	     {
	    	 response.sendRedirect(request.getContextPath()+ "/../view");
	    	 //접근 권한 없는 아이피
	    	 log.debug("접근 권한 없는 아이피 접속 오류 CODE -1773");
	    	 return false;
	     }
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		if (log.isDebugEnabled()) {
			log.debug("======================================           END          ======================================\n");
		}
	}
	
}
