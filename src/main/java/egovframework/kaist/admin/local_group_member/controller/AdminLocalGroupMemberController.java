package egovframework.kaist.admin.local_group_member.controller;

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

import egovframework.kaist.admin.buseo.service.AdminBuseoService;
import egovframework.kaist.admin.local_group_member.model.AdminLocalGroupMemberVo;
import egovframework.kaist.admin.local_group_member.service.AdminLocalGroupMemberService;

@Controller
public class AdminLocalGroupMemberController {

	@Autowired
	AdminLocalGroupMemberService adminLocalGroupMemberService;

	@Autowired
	AdminBuseoService adminBuseoService;

	private static final Logger Logger = LoggerFactory.getLogger(AdminLocalGroupMemberController.class);

	@RequestMapping(value = "/admin/local_group_member/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("AdminLocalGroupMemberVo") AdminLocalGroupMemberVo adminLocalGroupMemberVo,
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
		

		adminLocalGroupMemberVo.setPAGE(Integer.parseInt(PAGE));
		adminLocalGroupMemberVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = adminLocalGroupMemberVo.getPAGE() * adminLocalGroupMemberVo.getITEM_COUNT();
		
		adminLocalGroupMemberVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		adminLocalGroupMemberVo.setOFFSET(pagelimit);
		
	
    			
		
		model = adminLocalGroupMemberService.getList(adminLocalGroupMemberVo);
		
		model.put("SEARCH_TYPE", adminLocalGroupMemberVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", adminLocalGroupMemberVo.getSEARCH_TEXT());
		
		
		
		model.put("beforeDomain", adminLocalGroupMemberVo);

		

		return new ModelAndView("admin/local_group_member/list", "model", model);
	}

	@RequestMapping(value = "/admin/local_group_member/{local_group_memberid}/list.do", method = RequestMethod.GET)
	public ModelAndView memberlist(@PathVariable("local_group_memberid") String local_group_memberid, 
			@ModelAttribute("AdminLocalGroupMemberVo") AdminLocalGroupMemberVo adminLocalGroupMemberVo,
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
		

		adminLocalGroupMemberVo.setPAGE(Integer.parseInt(PAGE));
		adminLocalGroupMemberVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = adminLocalGroupMemberVo.getPAGE() * adminLocalGroupMemberVo.getITEM_COUNT();
		
		adminLocalGroupMemberVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		adminLocalGroupMemberVo.setOFFSET(pagelimit);
		
		adminLocalGroupMemberVo.setLOCAL_GROUP_IDX(local_group_memberid);
		
		model = adminLocalGroupMemberService.getList(adminLocalGroupMemberVo);
		
		model.put("SEARCH_TYPE", adminLocalGroupMemberVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", adminLocalGroupMemberVo.getSEARCH_TEXT());
		
		model.put("beforeDomain", adminLocalGroupMemberVo);

		return new ModelAndView("admin/local_group_member/member/list", "model", model);
	}
	
	@RequestMapping(value = "/admin/local_group_member/insert.do", method = RequestMethod.GET)
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
		
		return new ModelAndView("admin/local_group_member/insert", "model", model);
	}

	@RequestMapping(value = "/admin/local_group_member/insert.do", method = RequestMethod.POST)
	public String insertPost(@ModelAttribute("AdminLocalGroupMemberVo") AdminLocalGroupMemberVo adminLocalGroupMemberVo,
			HttpServletRequest  request,  HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();
		
		adminLocalGroupMemberService.setInsert(adminLocalGroupMemberVo);		
		
		return "redirect:./list.do";
	}
	
	
	@RequestMapping(value = "/admin/local_group_member/{local_group_memberid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("local_group_memberid") String local_group_memberid, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		model = adminLocalGroupMemberService.getView(local_group_memberid);

		model.put("buseo", adminBuseoService.getListAll());
		return new ModelAndView("admin/local_group_member/update", "model", model);
	}
	
	@RequestMapping(value = "/admin/local_group_member/{local_group_memberid}/update.do", method = RequestMethod.POST)
	public String updatePost(@ModelAttribute("AdminLocalGroupMemberVo") AdminLocalGroupMemberVo adminLocalGroupMemberVo,
			HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		
		boolean rtn = adminLocalGroupMemberService.setUpdate(adminLocalGroupMemberVo);

		return "redirect:../list.do";
	}

	@RequestMapping(value = "/admin/local_group_member/{local_group_memberid}/delete.do", method = RequestMethod.GET)
	public String deletePost(@PathVariable("local_group_memberid") String local_group_memberid,
			@ModelAttribute("AdminLocalGroupMemberVo") AdminLocalGroupMemberVo adminLocalGroupMemberVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		adminLocalGroupMemberVo.setMEMBER_ID(local_group_memberid);
		boolean rtn = adminLocalGroupMemberService.setDelete(adminLocalGroupMemberVo);
		
		return "redirect:../list.do"; 
		
	}

	

	@RequestMapping(value = "/admin/local_group_member/{local_group_memberid}/deleteArr.do", method = RequestMethod.POST)
	public void deleteArrPost(@PathVariable("local_group_memberid") String local_group_memberid,
			@ModelAttribute("AdminLocalGroupMemberVo") AdminLocalGroupMemberVo adminLocalGroupMemberVo,
			HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		String idx = adminLocalGroupMemberVo.getMEMBER_ID();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				AdminLocalGroupMemberVo vo = new AdminLocalGroupMemberVo();
				vo.setMEMBER_ID(arrIdx[i]);
				adminLocalGroupMemberService.setDelete(vo);		
			}
		}
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	@RequestMapping(value = "/admin/local_group_member/deleteArr.do", method = RequestMethod.POST)
	public void deleteArrPost2(
			@ModelAttribute("AdminLocalGroupMemberVo") AdminLocalGroupMemberVo adminLocalGroupMemberVo,
			HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		String idx = adminLocalGroupMemberVo.getMEMBER_ID();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				AdminLocalGroupMemberVo vo = new AdminLocalGroupMemberVo();
				vo.setMEMBER_ID(arrIdx[i]);
				adminLocalGroupMemberService.setDelete(vo);		
			}
		}
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
}
