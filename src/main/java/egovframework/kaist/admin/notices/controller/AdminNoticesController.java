package egovframework.kaist.admin.notices.controller;

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

import egovframework.kaist.admin.notices.model.AdminNoticesVo;
import egovframework.kaist.admin.notices.service.AdminNoticesService;

@Controller
public class AdminNoticesController {

	@Autowired
	AdminNoticesService adminNoticesService;


	private static final Logger Logger = LoggerFactory.getLogger(AdminNoticesController.class);

	@RequestMapping(value = "/admin/notices/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("AdminNoticesVo") AdminNoticesVo adminNoticesVo,
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
		

		adminNoticesVo.setPAGE(Integer.parseInt(PAGE));
		adminNoticesVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = adminNoticesVo.getPAGE() * adminNoticesVo.getITEM_COUNT();
		
		adminNoticesVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		adminNoticesVo.setOFFSET(pagelimit);
		
		model = adminNoticesService.getList(adminNoticesVo);
		
		model.put("SEARCH_TYPE", adminNoticesVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", adminNoticesVo.getSEARCH_TEXT());
		
		if(adminNoticesVo.getSTART_TM().equals(""))
		{
			adminNoticesVo.setSTART_TM(SUtil.getNowDate());	
		}
		if(adminNoticesVo.getEND_TM().equals(""))
		{
			adminNoticesVo.setEND_TM(SUtil.getNowDate());	
		}
		
		model.put("beforeDomain", adminNoticesVo);

		

		return new ModelAndView("admin/notices/list", "model", model);
	}

	@RequestMapping(value = "/admin/notices/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(HttpServletRequest request, HttpServletResponse response) 
	{

		ModelMap model = new ModelMap();
		
		String TYPE = (String) (request.getParameter("TYPE") != null ? request.getParameter("TYPE") : "1");
		
		if(TYPE == null || TYPE.equals(""))
		{
			TYPE = "1";
		}
		
		model.put("TYPE", TYPE);
		
		return new ModelAndView("admin/notices/insert", "model", model);
	}

	@RequestMapping(value = "/admin/notices/insert.do", method = RequestMethod.POST)
	public void insertPost(@ModelAttribute("AdminNoticesVo") AdminNoticesVo adminNoticesVo, HttpServletRequest  request,  HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		adminNoticesService.setInsert(adminNoticesVo);		
		
		try {
			response.getWriter().print("true");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/admin/notices/{noticesid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("noticesid") String noticesid, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		model = adminNoticesService.getView(noticesid);

		return new ModelAndView("admin/notices/update", "model", model);
	}
	
	@RequestMapping(value = "/admin/notices/update.do", method = RequestMethod.POST)
	public void updatePost(@ModelAttribute("AdminNoticesVo") AdminNoticesVo adminNoticesVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		boolean rtn = adminNoticesService.setUpdate(adminNoticesVo);

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

	@RequestMapping(value = "/admin/notices/delete.do", method = RequestMethod.POST)
	public void deletePost(@ModelAttribute("AdminNoticesVo") AdminNoticesVo adminNoticesVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String year = request.getParameter("year") != null ? request.getParameter("year") : "";
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		boolean rtn = adminNoticesService.setDelete(adminNoticesVo);
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
