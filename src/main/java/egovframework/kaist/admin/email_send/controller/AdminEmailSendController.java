package egovframework.kaist.admin.email_send.controller;

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

import egovframework.kaist.admin.email_send.model.AdminEmailSendVo;
import egovframework.kaist.admin.email_send.service.AdminEmailSendService;

@Controller
public class AdminEmailSendController {

	@Autowired
	AdminEmailSendService adminEmailSendService;
	
	protected Log log = LogFactory.getLog(AdminEmailSendController.class);
	
	@RequestMapping(value = "/admin/email_send/cron.do", method = RequestMethod.GET)
	public ModelAndView cron( HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		adminEmailSendService.setCronSend();
		
		model.put("message", "true");
		
		return new ModelAndView("admin/dev/index","model", model);
	}
	
	
	
	@RequestMapping(value = "/admin/email_send/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("AdminEmailSendVo") AdminEmailSendVo adminEmailSendVo,
			HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		model = adminEmailSendService.getList(adminEmailSendVo);
		
		model.put("boforeDomain", adminEmailSendVo);
		return new ModelAndView("admin/email_send/list", "model", model);
	}

	@RequestMapping(value = "/admin/email_send/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		
		return new ModelAndView("admin/email_send/insert","model", model);
	}
	
	@RequestMapping(value = "/admin/email_send/insert.do", method = RequestMethod.POST)
	public void insertPost(@ModelAttribute("AdminEmailSendVo") AdminEmailSendVo adminEmailSendVo,
			HttpServletRequest request,
			HttpServletResponse response) 
	{
		
		ModelMap model = new ModelMap();

		int rtn = adminEmailSendService.setInsert(adminEmailSendVo);
		
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
	
	@RequestMapping(value = "/admin/email_send/{email_sendid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("email_sendid") String email_sendid, 
			HttpServletRequest request,
			HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		
		model = adminEmailSendService.getView(email_sendid);
		
		
		return new ModelAndView("admin/email_send/update","model", model);
	}
	
	@RequestMapping(value = "/admin/email_send/update.do", method = RequestMethod.POST)
	public void updatePost(@ModelAttribute("AdminEmailSendVo") AdminEmailSendVo adminEmailSendVo, HttpServletRequest request,  HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		boolean rtn = adminEmailSendService.setUpdate(adminEmailSendVo);
		
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
	
	@RequestMapping(value = "/admin/email_send/delete.do", method = RequestMethod.POST)
	public void deletePost(@ModelAttribute("AdminEmailSendVo") AdminEmailSendVo adminEmailSendVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		boolean rtn = adminEmailSendService.setDelete(adminEmailSendVo);
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
