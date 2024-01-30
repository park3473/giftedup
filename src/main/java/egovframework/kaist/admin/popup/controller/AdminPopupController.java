package egovframework.kaist.admin.popup.controller;

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

import egovframework.kaist.admin.buseo.service.AdminBuseoService;
import egovframework.kaist.admin.popup.model.AdminPopupVo;
import egovframework.kaist.admin.popup.service.AdminPopupService;

@Controller
public class AdminPopupController {

	@Autowired
	AdminPopupService adminPopupService;

	@Autowired
	AdminBuseoService adminBuseoService;

	private static final Logger Logger = LoggerFactory.getLogger(AdminPopupController.class);

	@RequestMapping(value = "/admin/popup/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("AdminPopupVo") AdminPopupVo adminPopupVo,
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
		

		adminPopupVo.setPAGE(Integer.parseInt(PAGE));
		adminPopupVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = adminPopupVo.getPAGE() * adminPopupVo.getITEM_COUNT();
		
		adminPopupVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		adminPopupVo.setOFFSET(pagelimit);
		
		
		model = adminPopupService.getList(adminPopupVo);
		
		model.put("SEARCH_TYPE", adminPopupVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", adminPopupVo.getSEARCH_TEXT());
		
		
		model.put("beforeDomain", adminPopupVo);
		

		return new ModelAndView("admin/popup/list", "model", model);
	}

	@RequestMapping(value = "/admin/popup/insert.do", method = RequestMethod.GET)
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
		
		return new ModelAndView("admin/popup/insert", "model", model);
	}

	@RequestMapping(value = "/admin/popup/insert.do", method = RequestMethod.POST)
	public String insertPost(@ModelAttribute("AdminPopupVo") AdminPopupVo adminPopupVo, MultipartHttpServletRequest  request,  HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/popup/";
		 
		String filename = SUtil.setFileUpload(request, drv);
		
		if(filename.length() > 0)
		{
			adminPopupVo.setFILES(filename);	
		}else
		{
			adminPopupVo.setFILES("");
		}
		
		adminPopupService.setInsert(adminPopupVo);		
		
		return "redirect:./list.do";
	}
	
	@RequestMapping(value = "/admin/popup/{popupid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("popupid") String popupid, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
	
		model = adminPopupService.getView(popupid);

		model.put("buseo", adminBuseoService.getListAll());
		return new ModelAndView("admin/popup/update", "model", model);
	}
	
	@RequestMapping(value = "/admin/popup/{popupid}/update.do", method = RequestMethod.POST)
	public String updatePost(@PathVariable("popupid") String popupid, @ModelAttribute("AdminPopupVo") AdminPopupVo adminPopupVo, MultipartHttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		
		
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/popup/";
		 
		String filename = SUtil.setFileUpload(request, drv);
		
		if(filename.length() > 0)
		{
			adminPopupVo.setFILES(filename);	
		}else
		{
			adminPopupVo.setFILES("");
		}
		
		
		adminPopupVo.setIDX(popupid);
		
		boolean rtn = adminPopupService.setUpdate(adminPopupVo);

		return "redirect:../list.do";

	}

	@RequestMapping(value = "/admin/popup/{popupid}/delete.do", method = RequestMethod.GET)
	public String deletePost(@PathVariable("popupid") String popupid, @ModelAttribute("AdminPopupVo") AdminPopupVo adminPopupVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String year = request.getParameter("year") != null ? request.getParameter("year") : "";
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		adminPopupVo.setIDX(popupid);
		boolean rtn = adminPopupService.setDelete(adminPopupVo);
		return "redirect:../list.do";
	}

}
