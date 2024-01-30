package egovframework.kaist.view.Interceptor;

import java.util.Enumeration;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.system.util.SUtil;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	
	@Value("#{DB['currentPrjName']}")
	public String currentPrjName;

	protected Log log = LogFactory.getLog(LoginInterceptor.class);

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

		HttpSession session = request.getSession();

		// 로그인 관련
		String check = (String) session.getAttribute("ssion_login");

		log.debug("session loginOK value : "
				+ (String) session.getAttribute("ssion_login"));

		if (check == null) {
			rtn = false;
		} else if (!check.equals("okok")) {
			rtn = false;
		}

		if (rtn == false) {
			String url = request.getRequestURI();
			log.debug(" rtn (2)I \t:  " + rtn);
			log.debug(" request.getMethod().indexOf('/notice_data/list.do') : "
					+ url.indexOf("/master/notice/list.do"));

			if (url.indexOf("/master/notice/list.do") > -1) {
				String urlpath = "notice";
				String type = (String) (request.getParameter("type") != null ? request
						.getParameter("type") : "");
				log.debug(" request.type : : " + type);
				log.debug(" urlpath index : : " + urlpath.indexOf(type));
				if (urlpath.indexOf(type) > -1) {
					log.debug("인터럽트 return true");
					rtn = true;
					return rtn;
				}
			}
		}

		// token 비교
		if (rtn == true) {
			if (request.getMethod().equalsIgnoreCase("post")) {

				if (request instanceof MultipartHttpServletRequest) {
					Enumeration<String> names = request.getParameterNames();
					while (names.hasMoreElements()) {
						String param = names.nextElement();

						if (param.equals("csrf") || param.equals("CSRF")) {
							String value = request.getParameter(param);

							log.debug("CSRF_TOKEN : "
									+ request.getSession().getAttribute(
											"CSRF_TOKEN") + ", param : "
									+ param + " / csrf : " + value);

							if (value != null
									&& value.equals(request.getSession()
											.getAttribute("CSRF_TOKEN"))) {
								rtn = true;
								break;
							} else {
								if (log.isDebugEnabled()) {
									log.debug(" param CSRF 세션값과 일치 하지 않습니다.");
								}
								rtn = false;
							}
						} else {
							if (log.isDebugEnabled()) {
								log.debug(" param CSRF 데이터가 없습니다.");
							}
							rtn = false;
						}

					}
				}
			}
		}

		// 새로운 토큰 값 설정
		String token = UUID.randomUUID().toString();
		session.setAttribute("CSRF_TOKEN", token);
		if (log.isDebugEnabled()) {
			log.debug(" Request URI \t:  " + token);
			log.debug(" rtn \t:  " + rtn);
		}

		String check_level = "";
		try
		{
			check_level = (String) session.getAttribute("ssion_level");	
		}catch(java.lang.ClassCastException e){
			
		}
		
		
		
		if (rtn == false || check_level.equals("") ) {
			log.debug(" check_level :  " + check_level);
			
			if (request.getRequestURI().indexOf("/master/login.do") > -1 || request.getRequestURI().indexOf("/master/member/login.do") > -1 || request.getRequestURI().indexOf("/master/member/logout.do") > -1 
					 || request.getRequestURI().indexOf("/member/loginAccess.do") > -1) {
				return true;
			}
			else if (request.getRequestURI().indexOf("master") > -1) {
				log.debug(" sendRedirect __1___ " + rtn);
				response.sendRedirect(request.getContextPath() + "/master/member/login.do");
			} else {
				log.debug(" sendRedirect __2___ " + rtn);
				response.sendRedirect(request.getContextPath()+"/master/member/login.do");
			}
			return true;
		} else {

			log.debug(" check_level :  " + check_level);
			if (request.getRequestURI().indexOf("/master") > -1) {
				int chkbool = 1;
				
				//ModelMap map = settingService.getList();
			//	session.setAttribute("MENU_SETTING_LIST", map);
				//log.debug("================== menu setting list : " + list.size());
				// 운영자일경우 URL 접근 여부 검색
				if (check_level.equals("1")) {

				} else if (check_level.equals("2")) {
					String userid = SUtil.getUserId(request);
				} else {
					log.debug("================== 권한 LEVEL NULL ERROR  강제 로그아웃: "
							+ chkbool);
					log.debug(" sendRedirect __4___ " + rtn);
					response.sendRedirect(request.getContextPath()+"/master/member/login.do");
				}
			}

			return rtn;
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
