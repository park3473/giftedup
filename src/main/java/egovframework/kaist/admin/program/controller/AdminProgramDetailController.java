package egovframework.kaist.admin.program.controller;

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

import egovframework.kaist.admin.program.model.AdminProgramVo;
import egovframework.kaist.admin.program.service.AdminProgramService;
import egovframework.kaist.admin.program_apply.model.AdminProgramApplyVo;
import egovframework.kaist.admin.program_apply.service.AdminProgramApplyService;

@Controller
public class AdminProgramDetailController {

	@Autowired
	AdminProgramService adminProgramService;

	@Autowired
	AdminProgramApplyService adminProgramApplyService;

	private static final Logger Logger = LoggerFactory.getLogger(AdminProgramDetailController.class);

	@RequestMapping(value = "/admin/program/{programid}/{programidx}/detail/list.do", method = RequestMethod.GET)
	public ModelAndView list(
			@PathVariable("programid") String programid,
			@PathVariable("programidx") String programidx, 
			@ModelAttribute("AdminProgramVo") AdminProgramVo adminProgramVo,
			HttpServletRequest request, 
			HttpServletResponse response) {

		
		if(programid.equals("participation"))
		{
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
			
			
			adminProgramVo.setPAGE(Integer.parseInt(PAGE));
			adminProgramVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
			
			
			ModelMap model = new ModelMap();
		
			int pagelimit = adminProgramVo.getPAGE() * adminProgramVo.getITEM_COUNT();
			
			adminProgramVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
			adminProgramVo.setOFFSET(pagelimit);
		
			model = adminProgramApplyService.getList(adminProgramVo);
			
			model.put("SEARCH_TYPE", adminProgramVo.getSEARCH_TYPE());
			model.put("SEARCH_TEXT", adminProgramVo.getSEARCH_TEXT());
			
		
			if(!adminProgramVo.getYEAR().equals(""))
			{
				
				AdminProgramVo adminProgramVo2 = new AdminProgramVo();
				adminProgramVo.setLIMIT(100000);
				adminProgramVo.setOFFSET(0);
				adminProgramVo.setYEAR(adminProgramVo.getYEAR());
				model.put("PROGRAM", adminProgramService.getList(adminProgramVo));
				
							
			}
			model.put("TYPE", programid);
			model.put("programid", programid);
			
			
			model.put("beforeDomain", adminProgramVo);

			
			model.put("YEARLIST", adminProgramService.getListGroupByYear());
			return new ModelAndView("admin/program/participation/list", "model", model);
		}else
		{
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
			
			//adminProgramVo.setTYPE(type);
			adminProgramVo.setIDX(programidx);
			adminProgramVo.setPAGE(Integer.parseInt(PAGE));
			adminProgramVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
			
			
			ModelMap model = new ModelMap();
		
			int pagelimit = adminProgramVo.getPAGE() * adminProgramVo.getITEM_COUNT();
			
			adminProgramVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
			adminProgramVo.setOFFSET(pagelimit);
		
			if(programid.equals("201")
					|| programid.equals("202")
					|| programid.equals("203")
					|| programid.equals("204")
					|| programid.equals("205")
					|| programid.equals("206"))
			{
			//	adminProgramVo.setMEMBER_TYPE("2");
			}else
			{
				adminProgramVo.setMEMBER_TYPE("1");
			}
			
			
			model = adminProgramApplyService.getList(adminProgramVo);
			
			model.put("SEARCH_TYPE", adminProgramVo.getSEARCH_TYPE());
			model.put("SEARCH_TEXT", adminProgramVo.getSEARCH_TEXT());
			
		
			if(!adminProgramVo.getYEAR().equals(""))
			{
				
				AdminProgramVo adminProgramVo2 = new AdminProgramVo();
				adminProgramVo.setLIMIT(100000);
				adminProgramVo.setOFFSET(0);
				adminProgramVo.setYEAR(adminProgramVo.getYEAR());
				model.put("PROGRAM", adminProgramService.getList(adminProgramVo));
				
							
			}
			model.put("TYPE", programid);
			model.put("programid", programid);
			
			
			model.put("beforeDomain", adminProgramVo);

			
			model.put("YEARLIST", adminProgramService.getListGroupByYear());
			return new ModelAndView("admin/program/detail/list", "model", model);
		}
		
	}

	@RequestMapping(value = "/admin/program/{type}/{programid}/detail/deleteArr.do", method = RequestMethod.POST)
	public void deleteArrPost(
			@PathVariable("programid") String programid,
			@PathVariable("type") String type,
			@ModelAttribute("AdminProgramVo") AdminProgramVo adminProgramVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		String idx = adminProgramVo.getIDX();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				AdminProgramApplyVo adminProgramApplyVo2 = new AdminProgramApplyVo();
				adminProgramApplyVo2.setIDX(arrIdx[i]);
				adminProgramApplyService.setDelete(adminProgramApplyVo2);		
			}
		}
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
}
