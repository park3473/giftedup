package egovframework.kaist.user.Interceptor;

import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.system.util.SUtil;

import egovframework.kaist.admin.notices.model.AdminNoticesVo;
import egovframework.kaist.admin.notices.service.AdminNoticesService;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	
	@Value("#{DB['currentPrjName']}")
	public String currentPrjName;
	
	
	@Autowired
	AdminNoticesService adminNoticesService;


	protected Log log = LogFactory.getLog(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		
		String context = request.getContextPath();
		boolean rtn = true;
		log.info("log.isInfoEnabled() : " + log.isInfoEnabled());
		String parameter = "";
 		if (log.isInfoEnabled()) {
			log.info("======================================    INTERCEPTOR  START   ======================================");
			log.info(" Request URI \t:  " + request.getRequestURI());
			parameter = SUtil.parameterLog(log, request);
			log.info("SERVER CSRF : " + request.getSession().getAttribute("CSRF_TOKEN"));
			log.info(" getMethod GET OR POST URI \t:  " + request.getMethod());
		}

 		
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
 		
		HttpSession session = request.getSession();
		
		
		
		session.setAttribute("requestURI", request.getRequestURI());
		session.setAttribute("parameter", parameter);
		//ip별로 시스템 막기
		/*
		System.out.println(clientIp);
		System.out.println("--test--1");
		
		if(!clientIp.equals("192.168.1.133") && !clientIp.equals("125.138.63.176")) {
			if (request.getRequestURI().indexOf("/portfolio") > -1){
				response.setContentType("text/html; charset=utf-8");
				response.setCharacterEncoding("utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('현재 포트폴리오 시스템 수정중입니다.'); location.href='/index.do';</script>");
				out.flush();
				return false;
			}
		}
		*/
		// 로그인 관련
		String check = (String) session.getAttribute("ssion_login");

		
		
		
		log.info("session loginOK value : "
				+ (String) session.getAttribute("ssion_login"));

		if (check == null) {
			rtn = false;
		} else if (!check.equals("okok")) {
			rtn = false;
		}
		
		if (rtn == false) {
			String url = request.getRequestURI();
			log.info(" rtn (2)I \t:  " + rtn);
			log.info(" request.getMethod().indexOf('/notice_data/list.do') : "
					+ url.indexOf("/master/notice/list.do"));

			if (url.indexOf("/master/notice/list.do") > -1) {
				String urlpath = "notice";
				String type = (String) (request.getParameter("type") != null ? request
						.getParameter("type") : "");
				log.info(" request.type : : " + type);
				log.info(" urlpath index : : " + urlpath.indexOf(type));
				if (urlpath.indexOf(type) > -1) {
					log.info("인터럽트 return true");
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

							System.out.println("CSRF_TOKEN : "
									+ request.getSession().getAttribute(
											"CSRF_TOKEN") + ", param : "
									+ param + " / csrf : " + value);

							if (value != null
									&& value.equals(request.getSession()
											.getAttribute("CSRF_TOKEN"))) {
								rtn = true;
								break;
							} else {
								if (log.isInfoEnabled()) {
									log.info(" param CSRF 세션값과 일치 하지 않습니다.");
								}
								rtn = false;
							}
						} else {
							if (log.isInfoEnabled()) {
								log.info(" param CSRF 데이터가 없습니다.");
							}
							rtn = false;
						}
					}
				}
			}
		}

		
		
		 if(request.getRequestURI().indexOf("member/idCheck.do") > -1)
		 {
			 ;
		 }else if(request.getRequestURI().indexOf("/user/portfolio/detail/programInfo.do") > -1) {
			 ;
		 }else
		 {
			// 새로운 토큰 값 설정
			String token = UUID.randomUUID().toString();
			session.setAttribute("CSRF_TOKEN", token);
			System.out.println(" CSRF_TOKEN URI \t:  " + token);
				if (log.isInfoEnabled()) {
					log.info(" Request URI \t:  " + token);
					log.info(" rtn \t:  " + rtn);
				}
		 }
					
		
		
		
		String check_level = "";
		try
		{
			check_level = (String) session.getAttribute("ssion_level");	
		}catch(java.lang.ClassCastException e){
			
		}
		
		
		if (rtn == false || check_level.equals("") ) {
			log.info(" check_level :  " + check_level);
			
			if ((request.getRequestURI().indexOf("/master/login.do") > -1
					|| request.getRequestURI().indexOf("/user/member/") > -1
					|| request.getRequestURI().indexOf("/user/member/") > -1
					|| request.getRequestURI().indexOf("/user/member/idCheck.do") > -1 
					|| request.getRequestURI().indexOf("/user/member/login.do") > -1 
					|| request.getRequestURI().indexOf("/master/member/logout.do") > -1 
					 || request.getRequestURI().indexOf("/member/loginAccess.do") > -1
					 || request.getRequestURI().indexOf("/user/member/smsLogin.do") > -1
					 
					 //게시글
					 || request.getRequestURI().indexOf("notices_data/1/list.do") > -1
					 || request.getRequestURI().indexOf("notices_data/2/") > -1
					 || request.getRequestURI().indexOf("notices_data/11/") > -1
					 
					 || request.getRequestURI().indexOf("/user/member_re/insert.do") > -1
					 || request.getRequestURI().indexOf("/user/member/certify.do") > -1)
					 && (request.getRequestURI().indexOf("/user/member/view.do") == -1)
					) {
				return true;
			}
			else if (request.getRequestURI().indexOf("master") > -1
					||request.getRequestURI().indexOf("notices_data/7/") > -1
					||request.getRequestURI().indexOf("notices_data/8/") > -1
					||request.getRequestURI().indexOf("notices_data/9/") > -1
					||request.getRequestURI().indexOf("notices_data/11/") > -1
					||request.getRequestURI().indexOf("notices_data/10/") > -1) {
				log.info(" sendRedirect __1___ " + rtn);
				response.sendRedirect(request.getContextPath() + "/user/member/login.do?URL="+request.getRequestURI());
				return false;
			} else if(request.getRequestURI().indexOf("portfolio/detail") > -1
					|| request.getRequestURI().indexOf("member/view.do") > -1
					|| request.getRequestURI().indexOf("mypage") > -1
					|| request.getRequestURI().indexOf("/user/communicator") > -1
					){
				if(request.getRequestURI().indexOf("/user/mypage/communicator/insert.do") > -1
						|| request.getRequestURI().indexOf("/user/mypage/communicator/update.do") > -1) {
					
					return true;
				}
				log.info(" sendRedirect __2___ " + rtn);
				response.sendRedirect(request.getContextPath()+"/user/member/login.do?URL="+request.getRequestURI());
				return false;
			}
			
			if (request.getRequestURI().indexOf("/notices_data/") > -1)
			{
				//AdminNoticesVo adminNoticesVo = new AdminNoticesVo();
				//adminNoticesService.getList(adminNoticesVo);
				
			}
			
			
			
			return true;
		} else {

			log.info(" check_level :  " + check_level);
			if (request.getRequestURI().indexOf("/master") > -1) {
				int chkbool = 1;
				
				//ModelMap map = settingService.getList();
			//	session.setAttribute("MENU_SETTING_LIST", map);
				//log.info("================== menu setting list : " + list.size());
				// 운영자일경우 URL 접근 여부 검색
				if (check_level.equals("1")) {

				} else if (check_level.equals("2")) {
					String userid = SUtil.getUserId(request);
				} else {
					log.info("================== 권한 LEVEL NULL ERROR  강제 로그아웃: "
							+ chkbool);
					log.info(" sendRedirect __4___ " + rtn);
					response.sendRedirect(request.getContextPath()+"/user/member/login.do?URL="+request.getRequestURI());
				}
			}

			return rtn;
		}
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		if (log.isInfoEnabled()) {
			log.info("======================================           END          ======================================\n");
		}
	}
	
	

}
