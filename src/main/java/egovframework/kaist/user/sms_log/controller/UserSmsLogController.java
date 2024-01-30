package egovframework.kaist.user.sms_log.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.system.util.SUtil;

import egovframework.kaist.user.buseo.service.UserBuseoService;
import egovframework.kaist.user.sms_log.model.UserSmsLogVo;
import egovframework.kaist.user.sms_log.service.UserSmsLogService;

@Controller
public class UserSmsLogController {

	@Autowired
	UserSmsLogService userSmsLogService;

	@Autowired
	UserBuseoService userBuseoService;
	


	private static final Logger Logger = LoggerFactory.getLogger(UserSmsLogController.class);


	@RequestMapping(value = "/user/sms_log/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("UserSmsLogVo") UserSmsLogVo userSmsLogVo,
			HttpServletRequest request, HttpServletResponse response) {

		String page = request.getParameter("page") != null ? request
				.getParameter("page") : "0";
		String pageItemCount = request.getParameter("pageItemCount") != null ? request
				.getParameter("pageItemCount") : "7";
			
		if(page == null)
		{
			page = "0";
		}
		if(pageItemCount == null)
		{
			pageItemCount = "10";
		}
		
		userSmsLogVo.setPage(Integer.parseInt(page));
		userSmsLogVo.setPageItemCount(Integer.parseInt(pageItemCount));
		ModelMap model = new ModelMap();
	
		int pagelimit = userSmsLogVo.getPage() * userSmsLogVo.getPageItemCount();
		
		userSmsLogVo.setLIMIT(10);
		userSmsLogVo.setOFFSET(pagelimit);
		
		model = userSmsLogService.getList(userSmsLogVo);
		
		model.put("SEARCH_TYPE", userSmsLogVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", userSmsLogVo.getSEARCH_TEXT());
		
		
		model.put("beforeDomain", userSmsLogVo);
		

		return new ModelAndView("user/sms_log/list", "model", model);
	}

	@RequestMapping(value = "/user/sms_log/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(HttpServletRequest request, HttpServletResponse response) 
	
	
	{

		ModelMap model = new ModelMap();
		
		String TYPE = (String) (request.getParameter("TYPE") != null ? request.getParameter("TYPE") : "1");
		
		if(TYPE == null || TYPE.equals(""))
		{
			TYPE = "1";
		}
		
		model.put("buseo", userBuseoService.getListAll());
		model.put("TYPE", TYPE);
		
		return new ModelAndView("user/sms_log/insert", "model", model);
	}

	@RequestMapping(value = "/user/sms_log/insert.do", method = RequestMethod.POST)
	public void insertPost(@ModelAttribute("UserSmsLogVo") UserSmsLogVo userSmsLogVo, HttpServletRequest  request,  HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		String idx = userSmsLogVo.getPHONE();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				UserSmsLogVo userSmsLogDomain = new UserSmsLogVo();
				userSmsLogDomain.setPHONE(arrIdx[i]);
				userSmsLogDomain.setMESSAGE(userSmsLogVo.getMESSAGE());
				userSmsLogDomain.setRESERVATION(userSmsLogVo.getRESERVATION());
				userSmsLogDomain.setRESERVATION_TM(userSmsLogVo.getRESERVATION_TM());
				userSmsLogService.setInsert(userSmsLogDomain);		
			}
		}
		
		
		

		try {
			response.getWriter().print("true");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	@RequestMapping(value = "/user/sms_log/{sms_logid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("sms_logid") String sms_logid, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		model = userSmsLogService.getView(sms_logid);

		model.put("buseo", userBuseoService.getListAll());
		return new ModelAndView("user/sms_log/update", "model", model);
	}
	@RequestMapping(value = "/user/sms_log/update.do", method = RequestMethod.GET)
	public ModelAndView update( HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		model = userSmsLogService.getView(SUtil.getUserId(request));

		model.put("buseo", userBuseoService.getListAll());
		return new ModelAndView("user/sms_log/update2", "model", model);
	}
	@RequestMapping(value = "/user/sms_log/update.do", method = RequestMethod.POST)
	public void updatePost(@ModelAttribute("UserSmsLogVo") UserSmsLogVo userSmsLogVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		boolean rtn = userSmsLogService.setUpdate(userSmsLogVo);

		if (rtn) {
			try {
				response.getWriter().println("true");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				response.getWriter().println("false");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	@RequestMapping(value = "/user/sms_log/delete.do", method = RequestMethod.POST)
	public void deletePost(@ModelAttribute("UserSmsLogVo") UserSmsLogVo userSmsLogVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String year = request.getParameter("year") != null ? request.getParameter("year") : "";
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		boolean rtn = userSmsLogService.setDelete(userSmsLogVo);
		if (rtn) {
			try {
				response.getWriter().println("true");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {

			try {
				response.getWriter().println("false");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping(value = "/user/sms_log/deleteArr.do", method = RequestMethod.POST)
	public void deleteArrPost(@ModelAttribute("UserSmsLogVo") UserSmsLogVo userAgencyVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		String idx = userAgencyVo.getMEMBER_ID();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				UserSmsLogVo userSmsLogDomain = new UserSmsLogVo();
				userSmsLogDomain.setMEMBER_ID(arrIdx[i]);
				userSmsLogService.setDelete(userSmsLogDomain);		
			}
		}
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
}
