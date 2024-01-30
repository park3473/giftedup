package egovframework.kaist.admin.portfolio.controller;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.system.util.SUtil;

import egovframework.kaist.admin.member.service.AdminMemberService;
import egovframework.kaist.admin.portfolio.model.AdminPortfolioVo;
import egovframework.kaist.admin.portfolio.service.AdminPortfolioService;
import egovframework.kaist.admin.program.model.AdminProgramVo;
import egovframework.kaist.admin.program_apply.service.AdminProgramApplyService;

@Controller
public class AdminPortfolioDetailController {

	@Autowired
	AdminPortfolioService adminPortfolioService;

	@Autowired
	AdminProgramApplyService adminProgramApplyService;
	
	@Autowired
	AdminMemberService adminMemberService;
	

	private static final Logger Logger = LoggerFactory.getLogger(AdminPortfolioDetailController.class);

	@RequestMapping(value = "/admin/portfolio/detail/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("AdminPortfolioVo") AdminPortfolioVo adminPortfolioVo,
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
		

		adminPortfolioVo.setPAGE(Integer.parseInt(PAGE));
		adminPortfolioVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = adminPortfolioVo.getPAGE() * adminPortfolioVo.getITEM_COUNT();
		
		adminPortfolioVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		adminPortfolioVo.setOFFSET(pagelimit);
		

		
		model = adminPortfolioService.getList(adminPortfolioVo);
		
		model.put("SEARCH_TYPE", adminPortfolioVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", adminPortfolioVo.getSEARCH_TEXT());
		

		
		model.put("beforeDomain", adminPortfolioVo);

		model.put("MEMBER", adminMemberService.getView(adminPortfolioVo.getMEMBER_ID()));
		
		
		AdminProgramVo adminProgramVo = new AdminProgramVo();
		adminProgramVo.setMEMBER_ID(adminPortfolioVo.getMEMBER_ID());
		adminProgramVo.setLIMIT(999999);
		adminProgramVo.setOFFSET(0);
		
		model.put("PROGRAM", adminProgramApplyService.getList(adminProgramVo));

		return new ModelAndView("admin/portfolio/detail/list", "model", model);
	}

	@RequestMapping(value = "/admin/portfolio/detail/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(HttpServletRequest request, HttpServletResponse response) 
	
	
	{

		ModelMap model = new ModelMap();
		
		String TYPE = (String) (request.getParameter("TYPE") != null ? request.getParameter("TYPE") : "1");
		
		if(TYPE == null || TYPE.equals(""))
		{
			TYPE = "1";
		}
		
		
		model.put("TYPE", TYPE);
		
		return new ModelAndView("admin/portfolio/detail/insert", "model", model);
	}

	@RequestMapping(value = "/admin/portfolio/detail/insert.do", method = RequestMethod.POST)
	public String insertPost(@ModelAttribute("AdminPortfolioVo") AdminPortfolioVo adminPortfolioVo,
			MultipartHttpServletRequest  request,  HttpServletResponse response) {
		
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/portfolio/";
		 
		String filename = SUtil.setFileUpload(request, drv);
		
		if(filename.length()>0)
		{
			adminPortfolioVo.setFILES(filename);	
		}else
		{
			adminPortfolioVo.setFILES("");
		}
		
		ModelMap model = new ModelMap();

		adminPortfolioService.setInsert(adminPortfolioVo);		
		
		return "redirect:./list.do?MEMBER_ID="+adminPortfolioVo.getMEMBER_ID();
	}
	
	@RequestMapping(value = "/admin/portfolio/detail/{portfolioid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("portfolioid") String portfolioid, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		model = adminPortfolioService.getView(portfolioid);
		
		
		
		
		return new ModelAndView("admin/portfolio/detail/update", "model", model);
	}
	
	@RequestMapping(value = "/admin/portfolio/detail/{portfolioid}/update.do", method = RequestMethod.POST)
	public String updatePost(@PathVariable("portfolioid") String portfolioid, 
			@ModelAttribute("AdminPortfolioVo") AdminPortfolioVo adminPortfolioVo,
			MultipartHttpServletRequest request,
			HttpServletResponse response) {

		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/portfolio/";
		 
		String filename = SUtil.setFileUpload(request, drv);
		
		if(filename.length()>0)
		{
			adminPortfolioVo.setFILES(filename);	
		}else
		{
			adminPortfolioVo.setFILES("");
		}
		
		ModelMap model = new ModelMap();

		
		boolean rtn = adminPortfolioService.setUpdate(adminPortfolioVo);

		return "redirect:../list.do?MEMBER_ID="+adminPortfolioVo.getMEMBER_ID();

	}

	@RequestMapping(value = "/admin/portfolio/detail/delete.do", method = RequestMethod.POST)
	public void deletePost(@ModelAttribute("AdminPortfolioVo") AdminPortfolioVo adminPortfolioVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String year = request.getParameter("year") != null ? request.getParameter("year") : "";
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		boolean rtn = adminPortfolioService.setDelete(adminPortfolioVo);
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
	
	@RequestMapping(value = "/admin/portfolio/detail/deleteArr.do", method = RequestMethod.POST)
	public void deleteArrPost(
			@ModelAttribute("AdminPortfolioVo") AdminPortfolioVo adminPortfolioVo, 
			HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		String idx = adminPortfolioVo.getIDX();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				AdminPortfolioVo adminProgramVo2 = new AdminPortfolioVo();
				adminProgramVo2.setIDX(arrIdx[i]);
				adminPortfolioService.setDelete(adminProgramVo2);		
			}
		}
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}

}
