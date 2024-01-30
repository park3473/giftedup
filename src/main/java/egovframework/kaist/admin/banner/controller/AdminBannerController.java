package egovframework.kaist.admin.banner.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
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
import egovframework.kaist.admin.banner.model.AdminBannerVo;
import egovframework.kaist.admin.banner.service.AdminBannerService;

@Controller
public class AdminBannerController {

	@Autowired
	AdminBannerService adminBannerService;

	@Autowired
	AdminBuseoService adminBuseoService;

	private static final Logger Logger = LoggerFactory.getLogger(AdminBannerController.class);

	@RequestMapping(value = "/admin/banner/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("AdminBannerVo") AdminBannerVo adminBannerVo,
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
		

		adminBannerVo.setPAGE(Integer.parseInt(PAGE));
		adminBannerVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = adminBannerVo.getPAGE() * adminBannerVo.getITEM_COUNT();
		
		adminBannerVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		adminBannerVo.setOFFSET(pagelimit);
		
	
    			
		
		model = adminBannerService.getList(adminBannerVo);
		
		model.put("SEARCH_TYPE", adminBannerVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", adminBannerVo.getSEARCH_TEXT());
		
		
		
		model.put("beforeDomain", adminBannerVo);

		

		return new ModelAndView("admin/banner/list", "model", model);
	}

	@RequestMapping(value = "/admin/banner/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(HttpServletRequest request, HttpServletResponse response) 
	
	
	{

		ModelMap model = new ModelMap();
		
		String TYPE = (String) (request.getParameter("TYPE") != null ? request.getParameter("TYPE") : "1");
		
		if(TYPE == null || TYPE.equals(""))
		{
			TYPE = "1";
		}
		
		model.put("TYPE", TYPE);
		
		return new ModelAndView("admin/banner/insert", "model", model);
	}

	@RequestMapping(value = "/admin/banner/insert.do", method = RequestMethod.POST)
	public String insertPost(@ModelAttribute("AdminBannerVo") AdminBannerVo adminBannerVo,
			MultipartHttpServletRequest  request,  HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/banner/";
		 
		String filename = SUtil.setFileUpload(request, drv);
		
		if(filename.length() > 0)
		{
			adminBannerVo.setFILES(filename);	
		}else
		{
			adminBannerVo.setFILES("");
		}
		
		
		adminBannerService.setInsert(adminBannerVo);		
		
		return "redirect:./list.do";
	}
	
	
	@RequestMapping(value = "/admin/banner/{bannerid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("bannerid") String bannerid, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		model = adminBannerService.getView(bannerid);

		model.put("buseo", adminBuseoService.getListAll());
		return new ModelAndView("admin/banner/update", "model", model);
	}
	
	@RequestMapping(value = "/admin/banner/{bannerid}/update.do", method = RequestMethod.POST)
	public String updatePost(@ModelAttribute("AdminBannerVo") AdminBannerVo adminBannerVo,
			MultipartHttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/banner/";
		 
		String filename = SUtil.setFileUpload(request, drv);
		
		if(filename.length() > 0)
		{
			adminBannerVo.setFILES(filename);	
		}else
		{
			adminBannerVo.setFILES("");
		}
		
		
		boolean rtn = adminBannerService.setUpdate(adminBannerVo);

		return "redirect:../list.do";
	}

	@RequestMapping(value = "/admin/banner/{bannerid}/delete.do", method = RequestMethod.GET)
	public String deletePost(@PathVariable("bannerid") String bannerid, @ModelAttribute("AdminBannerVo") AdminBannerVo adminBannerVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		adminBannerVo.setIDX(bannerid);
		boolean rtn = adminBannerService.setDelete(adminBannerVo);
		
		return "redirect:../list.do"; 
		
	}

}
