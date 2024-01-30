package egovframework.kaist.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Value("#{DB['currentPrjName']}")
	public String currentPrjName;
	

	
	
	
	@RequestMapping(value = "/calender.do", method = RequestMethod.GET)
	public ModelAndView calender(HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();
		String year = request.getParameter("year") != null ? request.getParameter("year") : "";
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";

		model.addAttribute("year", year );
		model.addAttribute("month", month );
		
		return new ModelAndView("calender", model);	
		
	}
	@RequestMapping(value = "/admin/dashboard/list.do", method = RequestMethod.GET)
	public ModelAndView buseo(HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		
		
		return new ModelAndView("admin/dashboard/list", "model", model);
	}
	
	@RequestMapping(value = "/mapview.do", method = RequestMethod.GET)
	public ModelAndView  mapview(HttpServletRequest request, HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		String year = request.getParameter("year") != null ? request.getParameter("year") : "";
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";

		model.addAttribute("gpsx", year );
		model.addAttribute("gpsy", month );
		return new ModelAndView("mapview", "model", model);	
		
	}
	
	@RequestMapping(value = "/captcha.do", method = RequestMethod.GET)
	public void  captcha(HttpServletRequest request, HttpServletResponse response) {
		
		String year = request.getParameter("year") != null ? request.getParameter("year") : "";
/*
        Captcha captcha = new Captcha.Builder(148, 48)
        .addText() // default: 5개의 숫자+문자
        .addNoise().addNoise().addNoise() // 시야 방해 라인 3개
        .addBackground() // 기본 하얀색 배경
        .build();

		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Max-Age", 0);
		response.setContentType("image/png");
		CaptchaServletUtil.writeImage(response, captcha.getImage()); // 이미지 그리기
		request.getSession().setAttribute("captcha", captcha.getAnswer()); // 값 저장
		*/
	}
/*	@RequestMapping(value = {"/master/index.do"}, method = RequestMethod.GET)
	public String masterindex(HttpServletRequest request, HttpServletResponse response) {
		ModelMap model = new ModelMap();
		
		HttpSession session = request.getSession();
		session.setAttribute("currentPrjName", currentPrjName);
	
		logger.debug("currentPrjName : ", currentPrjName);
		
		String url = "redirect:/master/member/login.do?";
		
		return "master/index";
	}*/
	@RequestMapping(value = {"/master/**", "/master"}, method = RequestMethod.GET)
	public void master(HttpServletRequest request, HttpServletResponse response) {
		ModelMap model = new ModelMap();
		
		HttpSession session = request.getSession();
		session.setAttribute("currentPrjName", currentPrjName);
		
		logger.debug("currentPrjName : ", currentPrjName);
		
		String url = "redirect:/master/member/login.do?";
	}
	@RequestMapping(value = {"/{code}/error.do"}, method = RequestMethod.GET)
	public ModelAndView error(@PathVariable("code") String code) {

		ModelMap model = new ModelMap();
		model.put("CODE", code);
		
		return new ModelAndView("error", "model", model);	
	}

	@RequestMapping(value = {"/view/test2.do"}, method = RequestMethod.GET)
	public ModelAndView test2() {

		ModelMap model = new ModelMap();
		model.put("CODE", "");
		
		return new ModelAndView("/view/report", "model", model);	
	}
	
	@RequestMapping(value = {"/fileDown.do"}, method = RequestMethod.GET)
	public void filedown(HttpServletRequest request, HttpServletResponse response) throws IOException {

	String path = (String) (request.getParameter("path") != null ? request.getParameter("path") : "");

	String drv = request.getRealPath("");
	//drv = drv.substring(0, drv.length()) + "./resources"+request.getContextPath()+"/upload/notices/";
	drv = drv.substring(0, drv.length());

	File file = new File(drv+path);
	System.out.println("drv+path : " + drv+path);
	        
	response.setContentType("application/octet-stream");
	        response.setContentLength((int) file.length()); 
	        
	        String header = request.getHeader("User-Agent");

	        String browser = "MSIE";
	        if (header.indexOf("MSIE") > -1) {
	        browser = "MSIE";
	        } else if (header.indexOf("Chrome") > -1) {
	        browser = "Chrome";
	        } else if (header.indexOf("Opera") > -1) {
	        browser = "Opera";
	        }
	        
	        String realFileName = file.getName();
	        if(realFileName.length() > 17)
	        {
	        realFileName = realFileName.substring(13, realFileName.length());
	        }
	        
	        String encodedFilename = null;
	        if (browser.equals("MSIE")) {
	            encodedFilename = URLEncoder.encode(realFileName, "UTF-8")
	                    .replaceAll("\\+", "%20");
	        } else if (browser.equals("Firefox")) {
	            encodedFilename =

	         "\"" + new String(realFileName.getBytes("UTF-8"), "8859_1") + "\"";
	        } else if (browser.equals("Opera")) {
	            encodedFilename =

	         "\"" + new String(realFileName.getBytes("UTF-8"), "8859_1") + "\"";
	        } else if (browser.equals("Chrome")) {
	            StringBuffer sb = new StringBuffer();
	            for (int i = 0; i < realFileName.length(); i++) {
	                char c = realFileName.charAt(i);
	                if (c > '~') {
	                    sb.append(URLEncoder.encode("" + c, "UTF-8"));
	                } else {
	                    sb.append(c);
	                }
	            }
	            encodedFilename = sb.toString();
	        } else {
	            throw new RuntimeException("Not supported browser");
	        }

	        
	        
	        response.setHeader("Content-Disposition","attachment;filename=\"" +encodedFilename+"\";");
	        response.setHeader("Content-Transter-Encoding", "binary");
	        
	        OutputStream out = response.getOutputStream();
	        FileInputStream fis = null;
	        
	        try {
	            fis = new FileInputStream(file);
	            
	            FileCopyUtils.copy(fis, out);
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            if (fis != null) {
	                try {
	                    fis.close();
	                } catch (IOException ioe) {
	                    ioe.printStackTrace();
	                }
	            }
	            
	            out.flush();
	        }

	}
}
