package egovframework.kaist.user.notices.controller;

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

import egovframework.kaist.user.notices.model.UserNoticesVo;
import egovframework.kaist.user.notices.service.UserNoticesService;

@Controller
public class UserNoticesController {

	@Autowired
	UserNoticesService userNoticesService;


	private static final Logger Logger = LoggerFactory.getLogger(UserNoticesController.class);

	@RequestMapping(value = "/user/notices/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("UserNoticesVo") UserNoticesVo userNoticesVo,
			HttpServletRequest request, HttpServletResponse response) {

		String PAGE = request.getParameter("PAGE") != null ? request
				.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request
				.getParameter("ITEM_COUNT") : "10";
			
		if(PAGE == null)
		{
			PAGE = "0";
		}
		if(ITEM_COUNT == null)
		{
			ITEM_COUNT = "10";
		}
		

		userNoticesVo.setPAGE(Integer.parseInt(PAGE));
		userNoticesVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = userNoticesVo.getPAGE() * userNoticesVo.getITEM_COUNT();
		
		userNoticesVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		userNoticesVo.setOFFSET(pagelimit);
		
	
    			
		
		model = userNoticesService.getList(userNoticesVo);
		
		model.put("SEARCH_TYPE", userNoticesVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", userNoticesVo.getSEARCH_TEXT());
		
		if(userNoticesVo.getSTART_TM().equals(""))
		{
			userNoticesVo.setSTART_TM(SUtil.getNowDate());	
		}
		if(userNoticesVo.getEND_TM().equals(""))
		{
			userNoticesVo.setEND_TM(SUtil.getNowDate());	
		}
		
		model.put("beforeDomain", userNoticesVo);

		

		return new ModelAndView("user/notices/list", "model", model);
	}

	@RequestMapping(value = "/user/notices/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(HttpServletRequest request, HttpServletResponse response) 
	
	
	{

		ModelMap model = new ModelMap();
		
		String TYPE = (String) (request.getParameter("TYPE") != null ? request.getParameter("TYPE") : "1");
		
		if(TYPE == null || TYPE.equals(""))
		{
			TYPE = "1";
		}
		
		model.put("TYPE", TYPE);
		
		return new ModelAndView("user/notices/insert", "model", model);
	}

	@RequestMapping(value = "/user/notices/insert.do", method = RequestMethod.POST)
	public void insertPost(@ModelAttribute("UserNoticesVo") UserNoticesVo userNoticesVo, HttpServletRequest  request,  HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		userNoticesService.setInsert(userNoticesVo);		
		
		try {
			response.getWriter().print("true");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/user/notices/{noticesid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("noticesid") String noticesid, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		model = userNoticesService.getView(noticesid);

		return new ModelAndView("user/notices/update", "model", model);
	}
	
	@RequestMapping(value = "/user/notices/update.do", method = RequestMethod.POST)
	public void updatePost(@ModelAttribute("UserNoticesVo") UserNoticesVo userNoticesVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		boolean rtn = userNoticesService.setUpdate(userNoticesVo);

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

	@RequestMapping(value = "/user/notices/delete.do", method = RequestMethod.POST)
	public void deletePost(@ModelAttribute("UserNoticesVo") UserNoticesVo userNoticesVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String year = request.getParameter("year") != null ? request.getParameter("year") : "";
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		boolean rtn = userNoticesService.setDelete(userNoticesVo);
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

}
