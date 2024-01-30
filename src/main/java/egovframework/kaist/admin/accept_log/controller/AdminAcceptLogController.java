package egovframework.kaist.admin.accept_log.controller;

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

import egovframework.kaist.admin.accept_log.model.AdminAcceptLogVo;
import egovframework.kaist.admin.accept_log.service.AdminAcceptLogService;

@Controller
public class AdminAcceptLogController {

	@Autowired
	AdminAcceptLogService adminAcceptLogService;
	
	protected Log log = LogFactory.getLog(AdminAcceptLogController.class);
	
	@RequestMapping(value = "/admin/accept_log/list.do", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("AdminAcceptLogVo") AdminAcceptLogVo adminAcceptLogVo) {
		
		ModelMap model = new ModelMap();
	
		adminAcceptLogVo.setSTART_TM(adminAcceptLogVo.getSTART_TM().replaceAll("/", "-"));
		adminAcceptLogVo.setEND_TM(adminAcceptLogVo.getEND_TM().replaceAll("/", "-"));
		
		model = adminAcceptLogService.getList(adminAcceptLogVo);
		
		model.put("boforeDomain", adminAcceptLogVo);
		return new ModelAndView("admin/accept_log/list", "model", model);
	}

	@RequestMapping(value = "/admin/accept_log/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		
		return new ModelAndView("admin/accept_log/insert","model", model);
	}
	
	@RequestMapping(value = "/admin/accept_log/insert.do", method = RequestMethod.POST)
	public void insertPost(@ModelAttribute("AdminAcceptLogVo") AdminAcceptLogVo adminAcceptLogVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		int rtn = adminAcceptLogService.setInsert(adminAcceptLogVo);
		
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
	
	@RequestMapping(value = "/admin/accept_log/{accept_logid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("accept_logid") String accept_logid, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		
		model = adminAcceptLogService.getView(accept_logid);
		
		
		return new ModelAndView("admin/accept_log/update","model", model);
	}
	
	@RequestMapping(value = "/admin/accept_log/update.do", method = RequestMethod.POST)
	public void updatePost(@ModelAttribute("AdminAcceptLogVo") AdminAcceptLogVo adminAcceptLogVo, HttpServletRequest request,  HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		boolean rtn = adminAcceptLogService.setUpdate(adminAcceptLogVo);
		
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
	
	@RequestMapping(value = "/admin/accept_log/delete.do", method = RequestMethod.POST)
	public void deletePost(@ModelAttribute("AdminAcceptLogVo") AdminAcceptLogVo adminAcceptLogVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		boolean rtn = adminAcceptLogService.setDelete(adminAcceptLogVo);
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
