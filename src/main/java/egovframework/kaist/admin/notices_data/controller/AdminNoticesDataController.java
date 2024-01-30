package egovframework.kaist.admin.notices_data.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

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

import egovframework.kaist.admin.notices.service.AdminNoticesService;
import egovframework.kaist.admin.notices_data.model.AdminNoticesDataVo;
import egovframework.kaist.admin.notices_data.service.AdminNoticesDataService;
import egovframework.kaist.user.member.model.UserMemberVo;

@Controller
public class AdminNoticesDataController {

	@Autowired
	AdminNoticesDataService adminNoticesDataService;

	@Autowired
	AdminNoticesService adminNoticesService;

	private static final Logger Logger = LoggerFactory.getLogger(AdminNoticesDataController.class);

	@RequestMapping(value = "/admin/notices_data/{notices}/list.do", method = RequestMethod.GET)
	public ModelAndView list(@PathVariable("notices") String notices,
			@ModelAttribute("AdminNoticesDataVo") AdminNoticesDataVo adminNoticesDataVo,
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
		
		adminNoticesDataVo.setNOTICES_IDX(notices);
		
		adminNoticesDataVo.setPAGE(Integer.parseInt(PAGE));
		adminNoticesDataVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = adminNoticesDataVo.getPAGE() * adminNoticesDataVo.getITEM_COUNT();
		
		adminNoticesDataVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		adminNoticesDataVo.setOFFSET(pagelimit);
		
		model = adminNoticesDataService.getList(adminNoticesDataVo);
		
		model.put("SEARCH_TYPE", adminNoticesDataVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", adminNoticesDataVo.getSEARCH_TEXT());
		
		if(adminNoticesDataVo.getSTART_TM().equals(""))
		{
			adminNoticesDataVo.setSTART_TM(SUtil.getNowDate());	
		}
		if(adminNoticesDataVo.getEND_TM().equals(""))
		{
			adminNoticesDataVo.setEND_TM(SUtil.getNowDate());	
		}
		
		model.put("beforeDomain", adminNoticesDataVo);
		
		model.put("NOTICES", adminNoticesService.getView(notices));


		return new ModelAndView("admin/notices_data/list", "model", model);
	}

	@RequestMapping(value = "/admin/notices_data/{notices}/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(
			@PathVariable("notices") String notices,
			HttpServletRequest request, HttpServletResponse response) 
	{

		ModelMap model = new ModelMap();
		
		
		model.put("NOTICES", adminNoticesService.getView(notices));
		
		return new ModelAndView("admin/notices_data/insert", "model", model);
	}

	@RequestMapping(value = "/admin/notices_data/{notices}/insert.do", method = RequestMethod.POST)
	public String insertPost(@ModelAttribute("AdminNoticesDataVo") AdminNoticesDataVo adminNoticesDataVo, 
			@PathVariable("notices") String notices,
			MultipartHttpServletRequest  request,  HttpServletResponse response) throws UnsupportedEncodingException {
		
		ModelMap model = new ModelMap();
		
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/notices_data/";
		 
		String filename = SUtil.setFileUpload(request, drv);
		
		String files[] = filename.split(",");
		String saveFileName = "";
		for(int i = 0; i < files.length; i++)
		{
			String ff = files[i];
			
			String ff2 = ""; 
			ff2 = SUtil.StringReplace(adminNoticesDataVo.getIMAGE());
			ff2 = URLEncoder.encode(ff2, "UTF-8"); 
			if(ff.indexOf(ff2) > -1 && ff2.length() > 1)
			{
				adminNoticesDataVo.setIMAGE(ff);
			}else {
				saveFileName += ff + ",";
			}
		}
		if(saveFileName.length() > 1)
		{
			saveFileName = saveFileName.substring(0, saveFileName.length()-1);
		}
		adminNoticesDataVo.setNOTICES_IDX(notices);
		adminNoticesDataVo.setFILES(saveFileName);
		
		int rtn = adminNoticesDataService.setInsert(adminNoticesDataVo);

		
		return "redirect:./list.do";
		
	}
	
	@RequestMapping(value = "/admin/notices_data/{notices}/{notices_dataid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(
			@PathVariable("notices_dataid") String notices_dataid,
			@PathVariable("notices") String notices,
			HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		model = adminNoticesDataService.getView(notices_dataid);
		
		model.put("NOTICES", adminNoticesService.getView(notices));
		
		
		
		return new ModelAndView("admin/notices_data/update", "model", model);
	}
	
	@RequestMapping(value = "/admin/notices_data/{notices}/{notices_dataid}/update.do", method = RequestMethod.POST)
	public String updatePost(@ModelAttribute("AdminNoticesDataVo") AdminNoticesDataVo adminNoticesDataVo, 
			@PathVariable("notices_dataid") String notices_dataid,
			@PathVariable("notices") String notices,
			MultipartHttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		ModelMap model = new ModelMap();
		
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/notices_data/";
		 
		String filename = SUtil.setFileUpload(request, drv);
		
		String files[] = filename.split(",");
		String saveFileName = "";
		for(int i = 0; i < files.length; i++)
		{
			String ff = files[i];
			String ff2 = ""; 
			ff2 = SUtil.StringReplace(adminNoticesDataVo.getIMAGE());
			ff2 = URLEncoder.encode(ff2, "UTF-8");
			if(ff.indexOf(ff2) > -1 && ff2.length() > 1)
			{
				
				adminNoticesDataVo.setIMAGE(ff);
			}else {
				saveFileName += ff + ",";
			}
		}
		
		if(saveFileName.length() > 1)
		{
			saveFileName = saveFileName.substring(0, saveFileName.length()-1);
		}
		
		saveFileName = adminNoticesDataVo.getFILES() + "," + saveFileName;
		
		adminNoticesDataVo.setNOTICES_IDX(notices);
		adminNoticesDataVo.setFILES(saveFileName);
		adminNoticesDataVo.setIDX(notices_dataid);
		
		boolean rtn = adminNoticesDataService.setUpdate(adminNoticesDataVo);

		
		return "redirect:../list.do";
	}

	@RequestMapping(value = "/admin/notices_data/{notices}/{notices_dataid}/delete.do", method = RequestMethod.POST)
	public void deletePost(@ModelAttribute("AdminNoticesDataVo") AdminNoticesDataVo adminNoticesDataVo,
			@PathVariable("notices_dataid") String notices_dataid,
			@PathVariable("notices") String notices,
			HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String year = request.getParameter("year") != null ? request.getParameter("year") : "";
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		boolean rtn = adminNoticesDataService.setDelete(adminNoticesDataVo);
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
	
	

	@RequestMapping(value = "/admin/notices_data/deleteArr.do", method = RequestMethod.POST)
	public void deleteArrPost(@ModelAttribute("AdminNoticesDataVo") AdminNoticesDataVo adminNoticesDataVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		String idx = adminNoticesDataVo.getIDX();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				AdminNoticesDataVo adminNoticesDataVo2 = new AdminNoticesDataVo();
				adminNoticesDataVo2.setIDX(arrIdx[i]);
				adminNoticesDataService.setDelete(adminNoticesDataVo2);		
			}
		}
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}

}
