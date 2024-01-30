package egovframework.kaist.admin.local_group.controller;

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
import egovframework.kaist.admin.local_group.model.AdminLocalGroupVo;
import egovframework.kaist.admin.local_group.service.AdminLocalGroupService;
import egovframework.kaist.admin.local_group_member.model.AdminLocalGroupMemberVo;
import egovframework.kaist.admin.local_group_member.service.AdminLocalGroupMemberService;
import egovframework.kaist.admin.member.model.AdminMemberVo;

@Controller
public class AdminLocalGroupController {

	@Autowired
	AdminLocalGroupMemberService adminLocalGroupMemberService;
	

	@Autowired
	AdminLocalGroupService adminLocalGroupService;

	@Autowired
	AdminBuseoService adminBuseoService;

	private static final Logger Logger = LoggerFactory.getLogger(AdminLocalGroupController.class);

	@RequestMapping(value = "/admin/local_group/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("AdminlocalGroupVo") AdminLocalGroupVo adminlocalGroupVo,
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
		

		adminlocalGroupVo.setPAGE(Integer.parseInt(PAGE));
		adminlocalGroupVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = adminlocalGroupVo.getPAGE() * adminlocalGroupVo.getITEM_COUNT();
		
		adminlocalGroupVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		adminlocalGroupVo.setOFFSET(pagelimit);
		
	
		model = adminLocalGroupService.getList(adminlocalGroupVo);
		
		model.put("SEARCH_TYPE", adminlocalGroupVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", adminlocalGroupVo.getSEARCH_TEXT());

		
		model.put("beforeDomain", adminlocalGroupVo);

		

		return new ModelAndView("admin/local_group/list", "model", model);
	}
	
	
	@RequestMapping(value = "/admin/local_group/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(HttpServletRequest request, HttpServletResponse response) 
	{

		ModelMap model = new ModelMap();
		
		
		
		String LOCAL_GROUP_IDX = (String) (request.getParameter("LOCAL_GROUP_IDX") != null ? request.getParameter("LOCAL_GROUP_IDX") : "");
		String TYPE = (String) (request.getParameter("TYPE") != null ? request.getParameter("TYPE") : "1");
		
		if(TYPE == null || TYPE.equals(""))
		{
			TYPE = "1";
		}
		
		model.put("GROUPLIST", adminLocalGroupService.getListGroupMemberId());
		model.put("TYPE", TYPE);
		model.put("LOCAL_GROUP_IDX", LOCAL_GROUP_IDX);
		
		return new ModelAndView("admin/local_group/insert", "model", model);
	}

	@RequestMapping(value = "/admin/local_group/insert.do", method = RequestMethod.POST)
	public void insertPost(@ModelAttribute("AdminLocalGroupMemberVo") AdminLocalGroupMemberVo adminLocalGroupMemberVo,
			HttpServletRequest  request,  HttpServletResponse response) {
		
		
		
		ModelMap model = adminLocalGroupService.getView(adminLocalGroupMemberVo.getLOCAL_GROUP_IDX());
		
		//그룹장이 없을 경우 추가
		AdminLocalGroupVo vo  = (AdminLocalGroupVo) model.get("pageDomain");
		if(vo.getMEMBER_ID().equals(""))
		{
			
			vo.setMEMBER_ID(adminLocalGroupMemberVo.getLOCAL_GROUP_IDX());
			vo.setLOCATION(adminLocalGroupMemberVo.getLOCATION());
			adminLocalGroupService.setInsert(vo);	
		}
		
		String idx = adminLocalGroupMemberVo.getMEMBER_ID();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				AdminLocalGroupMemberVo vo2 = new AdminLocalGroupMemberVo();
				vo2.setMEMBER_ID(arrIdx[i]);
				vo2.setLOCAL_GROUP_IDX(adminLocalGroupMemberVo.getLOCAL_GROUP_IDX());
				adminLocalGroupMemberService.setInsert(vo2);		
			}
		}
		
		try {
			response.getWriter().print("true");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	@RequestMapping(value = "/admin/local_group/{local_groupid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("local_groupid") String local_groupid, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		
		model = adminLocalGroupMemberService.getView(local_groupid);

		return new ModelAndView("admin/local_group/update", "model", model);
	}
	
	@RequestMapping(value = "/admin/local_group/{local_groupid}/update.do", method = RequestMethod.POST)
	public String updatePost(@ModelAttribute("AdminlocalGroupVo") AdminLocalGroupVo adminlocalGroupVo,
			HttpServletRequest request,
			HttpServletResponse response) {

		boolean rtn = adminLocalGroupService.setUpdate(adminlocalGroupVo);

		return "redirect:../list.do";
	}

	@RequestMapping(value = "/admin/local_group/{local_groupid}/delete.do", method = RequestMethod.GET)
	public String deletePost(@PathVariable("local_groupid") String local_groupid, 
			@ModelAttribute("AdminlocalGroupVo") AdminLocalGroupVo adminlocalGroupVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		adminlocalGroupVo.setMEMBER_ID(local_groupid);
		boolean rtn = adminLocalGroupService.setDelete(adminlocalGroupVo);
		
		return "redirect:../list.do"; 
	}

	@RequestMapping(value = "/admin/local_group/deleteArr.do", method = RequestMethod.POST)
	public void deleteArrPost(@ModelAttribute("AdminlocalGroupVo") AdminLocalGroupVo adminlocalGroupVo,
			HttpServletRequest request, HttpServletResponse response) {
		
		ModelMap model = new ModelMap();

		String idx = adminlocalGroupVo.getMEMBER_ID();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				AdminLocalGroupVo vo = new AdminLocalGroupVo();
				vo.setMEMBER_ID(arrIdx[i]);
				adminLocalGroupService.setDelete(vo);		
				adminLocalGroupService.setDeleteGroupIdx(vo);
				
				
			}
		}
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	@RequestMapping(value = "/admin/local_group/idCheck.do", method = RequestMethod.GET)
	public ModelAndView idCheck(
			@ModelAttribute("AdminlocalGroupVo") AdminLocalGroupVo adminlocalGroupVo,
			HttpServletRequest request, HttpServletResponse response) {
		
		ModelMap model = new ModelMap();

		
		//그룹장 상세
		model = adminLocalGroupService.getView(adminlocalGroupVo.getMEMBER_ID());
		
		AdminLocalGroupVo vo = (AdminLocalGroupVo) model.get("pageDomain");
		
		AdminLocalGroupMemberVo adminLocalGroupMemberVo =  new AdminLocalGroupMemberVo();
		adminLocalGroupMemberVo.setLOCAL_GROUP_IDX(adminlocalGroupVo.getMEMBER_ID());
		adminLocalGroupMemberVo.setLIMIT(9999999);
		//현재 그룹에 등록된 리스트
		model.put("MEMBER2", adminLocalGroupMemberService.getList(adminLocalGroupMemberVo));
		
		//그룹에 속하지 않은 리스트
		model.put("MEMBER_NOT", adminLocalGroupMemberService.getListNotGroupMemberId(vo));
		
		model.put("LOCAL_GROUP_IDX", adminlocalGroupVo.getMEMBER_ID());
		
		
		
		return new ModelAndView("admin/local_group/ajaxList", "model", model);
	}
	
	@RequestMapping(value = "/admin/local_group/getLOCATION.do", method = RequestMethod.GET)
	public void getLOCATION(@ModelAttribute("AdminLocalGroupMemberVo") AdminLocalGroupMemberVo adminLocalGroupMemberVo,
			HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = adminLocalGroupService.getView(adminLocalGroupMemberVo.getLOCAL_GROUP_IDX());
		
		//그룹장이 없을 경우 추가
		AdminLocalGroupVo vo  = (AdminLocalGroupVo) model.get("pageDomain");
		if(vo.getMEMBER_ID().equals(""))
		{
			
			vo.setMEMBER_ID(adminLocalGroupMemberVo.getLOCAL_GROUP_IDX());
			vo.setLOCATION(adminLocalGroupMemberVo.getLOCATION());
			adminLocalGroupService.setInsert(vo);	
		}else
		{
			vo.setMEMBER_ID(adminLocalGroupMemberVo.getLOCAL_GROUP_IDX());
			vo.setLOCATION(adminLocalGroupMemberVo.getLOCATION());
			adminLocalGroupService.setUpdate(vo);	
		}
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	
	
}
