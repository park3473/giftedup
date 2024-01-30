package egovframework.kaist.admin.survey_select.controller;

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
import egovframework.kaist.admin.survey_select.model.AdminSurveySelectVo;
import egovframework.kaist.admin.survey_select.service.AdminSurveySelectService;

@Controller
public class AdminSurveySelectController {

	@Autowired
	AdminSurveySelectService adminsurveySelectService;

	@Autowired
	AdminBuseoService adminBuseoService;

	private static final Logger Logger = LoggerFactory.getLogger(AdminSurveySelectController.class);

	@RequestMapping(value = "/admin/survey_select/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("AdminsurveySelectVo") AdminSurveySelectVo adminsurveySelectVo,
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
		

		adminsurveySelectVo.setPAGE(Integer.parseInt(PAGE));
		adminsurveySelectVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = adminsurveySelectVo.getPAGE() * adminsurveySelectVo.getITEM_COUNT();
		
		adminsurveySelectVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		adminsurveySelectVo.setOFFSET(pagelimit);
		
		
		model = adminsurveySelectService.getList(adminsurveySelectVo);
		
		model.put("SEARCH_TYPE", adminsurveySelectVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", adminsurveySelectVo.getSEARCH_TEXT());
		
		
		model.put("beforeDomain", adminsurveySelectVo);
		

		return new ModelAndView("admin/survey_select/list", "model", model);
	}

	@RequestMapping(value = "/admin/survey_select/insert.do", method = RequestMethod.GET)
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
		
		return new ModelAndView("admin/survey_select/insert", "model", model);
	}

	@RequestMapping(value = "/admin/survey_select/insert.do", method = RequestMethod.POST)
	public String insertPost(@ModelAttribute("AdminsurveySelectVo") AdminSurveySelectVo adminsurveySelectVo, HttpServletRequest  request,  HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		adminsurveySelectService.setInsert(adminsurveySelectVo);		
		
		return "redirect:./list.do";
	}
	
	@RequestMapping(value = "/admin/survey_select/{survey_selectid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("survey_selectid") String survey_selectid, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		model = adminsurveySelectService.getView(survey_selectid);

		model.put("buseo", adminBuseoService.getListAll());
		return new ModelAndView("admin/survey_select/update", "model", model);
	}
	
	@RequestMapping(value = "/admin/survey_select/{survey_selectid}/update.do", method = RequestMethod.POST)
	public String updatePost(@PathVariable("survey_selectid") String survey_selectid, @ModelAttribute("AdminsurveySelectVo") AdminSurveySelectVo adminsurveySelectVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		adminsurveySelectVo.setIDX(survey_selectid);
		
		boolean rtn = adminsurveySelectService.setUpdate(adminsurveySelectVo);

		return "redirect:../list.do";

	}

	@RequestMapping(value = "/admin/survey_select/{survey_selectid}/delete.do", method = RequestMethod.GET)
	public String deletePost(@PathVariable("survey_selectid") String survey_selectid, @ModelAttribute("AdminsurveySelectVo") AdminSurveySelectVo adminsurveySelectVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String year = request.getParameter("year") != null ? request.getParameter("year") : "";
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		adminsurveySelectVo.setIDX(survey_selectid);
		boolean rtn = adminsurveySelectService.setDelete(adminsurveySelectVo);
		return "redirect:../list.do";
	}

}
