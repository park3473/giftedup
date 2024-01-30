package egovframework.kaist.admin.program_apply.controller;

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

import egovframework.kaist.admin.buseo.service.AdminBuseoService;
import egovframework.kaist.admin.program.model.AdminProgramVo;
import egovframework.kaist.admin.program_apply.model.AdminProgramApplyVo;
import egovframework.kaist.admin.program_apply.service.AdminProgramApplyService;

@Controller
public class AdminProgramApplyController {

	@Autowired
	AdminProgramApplyService adminProgramApplyService;

	@Autowired
	AdminBuseoService adminBuseoService;

	private static final Logger Logger = LoggerFactory.getLogger(AdminProgramApplyController.class);

	@RequestMapping(value = "/admin/program_apply/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("AdminProgramApplyVo") AdminProgramVo adminProgramVo,
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
		

		adminProgramVo.setPAGE(Integer.parseInt(PAGE));
		adminProgramVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = adminProgramVo.getPAGE() * adminProgramVo.getITEM_COUNT();
		
		adminProgramVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		adminProgramVo.setOFFSET(pagelimit);
		
	
		model = adminProgramApplyService.getList(adminProgramVo);
		
		model.put("SEARCH_TYPE", adminProgramVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", adminProgramVo.getSEARCH_TEXT());
		
		if(adminProgramVo.getSTART_TM().equals(""))
		{
			adminProgramVo.setSTART_TM(SUtil.getNowDate());	
		}
		if(adminProgramVo.getEND_TM().equals(""))
		{
			adminProgramVo.setEND_TM(SUtil.getNowDate());	
		}
		
		model.put("beforeDomain", adminProgramVo);

		

		return new ModelAndView("admin/program_apply/list", "model", model);
	}

	@RequestMapping(value = "/admin/program_apply/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(HttpServletRequest request, HttpServletResponse response) 
	
	
	{

		ModelMap model = new ModelMap();
		
		String TYPE = (String) (request.getParameter("TYPE") != null ? request.getParameter("TYPE") : "1");
		
		if(TYPE == null || TYPE.equals(""))
		{
			TYPE = "1";
		}
		
		model.put("buseo", adminBuseoService.getListAll());
		model.put("TYPE", TYPE);
		
		return new ModelAndView("admin/program_apply/insert", "model", model);
	}

	@RequestMapping(value = "/admin/program_apply/insert.do", method = RequestMethod.POST)
	public void insertPost(@ModelAttribute("AdminProgramApplyVo") AdminProgramApplyVo adminProgramApplyVo,
			HttpServletRequest  request,  HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		adminProgramApplyService.setInsert(adminProgramApplyVo);		
		
		try {
			response.getWriter().print("true");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/admin/program_apply/{program_applyid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("program_applyid") String program_applyid,
			HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		model = adminProgramApplyService.getView(program_applyid);

		model.put("buseo", adminBuseoService.getListAll());
		return new ModelAndView("admin/program_apply/update", "model", model);
	}
	
	@RequestMapping(value = "/admin/program_apply/update.do", method = RequestMethod.POST)
	public void updatePost(@ModelAttribute("AdminProgramApplyVo") AdminProgramApplyVo adminProgramApplyVo, 
			HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		boolean rtn = adminProgramApplyService.setUpdate(adminProgramApplyVo);

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

	@RequestMapping(value = "/admin/program_apply/delete.do", method = RequestMethod.POST)
	public void deletePost(@ModelAttribute("AdminProgramApplyVo") AdminProgramApplyVo adminProgramApplyVo, 
			HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String year = request.getParameter("year") != null ? request.getParameter("year") : "";
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		boolean rtn = adminProgramApplyService.setDelete(adminProgramApplyVo);
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
