package egovframework.kaist.admin.Interceptor;

import java.util.Iterator;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.system.util.SUtil;

import egovframework.kaist.admin.accept_log.model.AdminAcceptLogVo;
import egovframework.kaist.admin.accept_log.service.AdminAcceptLogService;

public class AcceptLogInterceptor extends HandlerInterceptorAdapter {

	
	@Autowired
	AdminAcceptLogService adminAcceptLogService;
	
	

	protected Log log = LogFactory.getLog(AcceptLogInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		String context = request.getContextPath();
		boolean rtn = true;
		log.debug("log.isDebugEnabled() : " + log.isDebugEnabled());
		
		if (log.isDebugEnabled()) {
			log.debug("======================================    INTERCEPTOR  START   ======================================");
			log.debug(" Request URI \t:  " + request.getRequestURI());
			SUtil.parameterLog(log, request);
			log.debug("SERVER CSRF : " + request.getSession().getAttribute("CSRF_TOKEN"));
			log.debug(" getMethod GET OR POST URI \t:  " + request.getMethod());
		}
		
		

		AdminAcceptLogVo adminAcceptLogVo = new AdminAcceptLogVo();
		adminAcceptLogVo.setMETHOD(request.getMethod());
		
		HttpSession session = request.getSession();

		// 로그인 관련
		String ssion_user_id = (String) session.getAttribute("ssion_user_id") + "";
		
		log.debug("session loginOK value : "
				+ (String) session.getAttribute("ssion_login"));

		if(ssion_user_id.equals("null"))
		{
			ssion_user_id = "";
		}
		
		adminAcceptLogVo.setMEMBER_ID(ssion_user_id);
		
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
		
		adminAcceptLogVo.setIP(ip);
		
		adminAcceptLogVo.setURL(request.getRequestURI());
		
		log.debug(" log.isDebugEnabled() \t:  " + log.isDebugEnabled());
		//System.out.println("log.isDebugEnabled() : " + log.isDebugEnabled());
		String parm = "";
		log.debug(" getMethod GET OR POST URI \t:  "
				+ request.getRequestURI());

		Set<String> keySet = request.getParameterMap().keySet();
		Iterator<String> iterator = keySet.iterator();
		while (iterator.hasNext()) {
			String key = iterator.next();
			String value = request.getParameter(key);
			if(key.indexOf("PASSWORD") > -1)
			{
				parm += "key : " + key + ", value : ";
				for(int i = 0; i < value.length(); i++)
				{
					parm += "○";
				}
				parm += "\n";	
			}else
			{
				parm += "key : " + key + ", value : " + value + "\n";
			}
		}
		
		adminAcceptLogVo.setPARAMETER(parm);
		
		 String header = request.getHeader("User-Agent"); 

        String browser = "Firefox"; 
        if (header.indexOf("MSIE") > -1) { 
         browser = "MSIE"; 
        } else if (header.indexOf("Chrome") > -1) { 
         browser = "Chrome"; 
        } else if (header.indexOf("Opera") > -1) { 
         browser = "Opera"; 
        }

	        
		adminAcceptLogVo.setDEVICE(browser);
		adminAcceptLogService.setInsert(adminAcceptLogVo);
		
		return true;

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
