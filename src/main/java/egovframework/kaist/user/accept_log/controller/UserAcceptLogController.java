package egovframework.kaist.user.accept_log.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.kaist.user.accept_log.model.UserAcceptLogVo;
import egovframework.kaist.user.accept_log.service.UserAcceptLogService;

@Controller
public class UserAcceptLogController {

	@Autowired
	UserAcceptLogService userAcceptLogService;
	
	protected Log log = LogFactory.getLog(UserAcceptLogController.class);
	
	@RequestMapping(value = "/user/accept_log/list.do", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("UserAcceptLogVo") UserAcceptLogVo userAcceptLogVo) {
		
		ModelMap model = new ModelMap();
	
		userAcceptLogVo.setSTART_TM(userAcceptLogVo.getSTART_TM().replaceAll("/", "-"));
		userAcceptLogVo.setEND_TM(userAcceptLogVo.getEND_TM().replaceAll("/", "-"));
		
		model = userAcceptLogService.getList(userAcceptLogVo);
		
		model.put("boforeDomain", userAcceptLogVo);
		return new ModelAndView("user/accept_log/list", "model", model);
	}

	@RequestMapping(value = "/user/accept_log/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		
		return new ModelAndView("user/accept_log/insert","model", model);
	}
	
	@RequestMapping(value = "/user/accept_log/insert.do", method = RequestMethod.POST)
	public void insertPost(@ModelAttribute("UserAcceptLogVo") UserAcceptLogVo userAcceptLogVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		int rtn = userAcceptLogService.setInsert(userAcceptLogVo);
		
		if(rtn > 0 )
		{
			try {
				
				response.getWriter().println("true");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else
		{
			try {
				
				response.getWriter().println("false");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	@RequestMapping(value = "/user/accept_log/{accept_logid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("accept_logid") String accept_logid, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		
		model = userAcceptLogService.getView(accept_logid);
		
		
		return new ModelAndView("user/accept_log/update","model", model);
	}
	
	@RequestMapping(value = "/user/accept_log/update.do", method = RequestMethod.POST)
	public void updatePost(@ModelAttribute("UserAcceptLogVo") UserAcceptLogVo userAcceptLogVo, HttpServletRequest request,  HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		boolean rtn = userAcceptLogService.setUpdate(userAcceptLogVo);
		
		if(rtn)
		{
			try {
				response.getWriter().println("true");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else
		{
			try {
				response.getWriter().println("false");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	@RequestMapping(value = "/user/accept_log/delete.do", method = RequestMethod.POST)
	public void deletePost(@ModelAttribute("UserAcceptLogVo") UserAcceptLogVo userAcceptLogVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		boolean rtn = userAcceptLogService.setDelete(userAcceptLogVo);
		if(rtn)
		{
			try {
				response.getWriter().println("true");
			} catch (IOException e) {
				e.printStackTrace();
			}	
		}else
		{

			try {
				response.getWriter().println("false");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	
}
