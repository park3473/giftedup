package egovframework.kaist.admin.survey.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.servlet.ModelAndView;

import com.system.util.SUtil;

import egovframework.kaist.admin.survey.model.AdminSurveyVo;
import egovframework.kaist.admin.survey.service.AdminSurveyService;
import egovframework.kaist.admin.survey_answer.model.AdminSurveyAnswerVo;
import egovframework.kaist.admin.survey_answer.service.AdminSurveyAnswerService;
import egovframework.kaist.admin.survey_question.model.AdminSurveyQuestionVo;
import egovframework.kaist.admin.survey_question.service.AdminSurveyQuestionService;
import egovframework.kaist.admin.survey_questionnaire.model.AdminSurveyQuestionnaireVo;
import egovframework.kaist.admin.survey_questionnaire.service.AdminSurveyQuestionnaireService;
import egovframework.kaist.admin.survey_select.model.AdminSurveySelectVo;
import egovframework.kaist.admin.survey_select.service.AdminSurveySelectService;

@Controller
public class AdminSurveyController {

	@Autowired
	AdminSurveyService adminSurveyService;

	@Autowired
	AdminSurveyQuestionService adminSurveyQuestionService;

	
	@Autowired
	AdminSurveyQuestionnaireService	adminSurveyQuestionnaireService;
	
	@Autowired
	AdminSurveySelectService adminSurveySelectService;
	
	
	@Autowired
	AdminSurveyAnswerService adminSurveyAnswerService;
	
	
	private static final Logger Logger = LoggerFactory.getLogger(AdminSurveyController.class);

	@RequestMapping(value = "/admin/survey/list.do", method = RequestMethod.GET)
	public ModelAndView list(
			@ModelAttribute("AdminSurveyVo") AdminSurveyVo adminSurveyVo,
			HttpServletRequest request, HttpServletResponse response) {

		String PAGE = request.getParameter("PAGE") != null ? request
				.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request
				.getParameter("ITEM_COUNT") : "10";
			
		String  code = "survey";
				
		adminSurveyVo.setCODE(code);



		if(PAGE == null)
		{
			PAGE = "0";
		}
		if(ITEM_COUNT == null)
		{
			ITEM_COUNT = "10";
		}
		
		adminSurveyVo.setCODE(code);
		adminSurveyVo.setPAGE(Integer.parseInt(PAGE));
		adminSurveyVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = adminSurveyVo.getPAGE() * adminSurveyVo.getITEM_COUNT();
		
		adminSurveyVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		adminSurveyVo.setOFFSET(pagelimit);
		
		
		model = adminSurveyService.getList(adminSurveyVo);
		
		
		
		model.put("SEARCH_TYPE", adminSurveyVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", adminSurveyVo.getSEARCH_TEXT());
		
		
		model.put("beforeDomain", adminSurveyVo);
		model.put("CODE", code);
		

		return new ModelAndView("admin/survey/list", "model", model);
	}
	
	@RequestMapping(value = "/admin/survey/{surveyIdx}/detail.do", method = RequestMethod.GET)
	public ModelAndView detail(
			@PathVariable("surveyIdx") String surveyIdx,
			@ModelAttribute("AdminSurveyVo") AdminSurveyVo adminSurveyVo,
			HttpServletRequest request, HttpServletResponse response) {

		String  code = "survey";
		
		ModelMap model = new ModelMap();
		
		model = adminSurveyService.getView(surveyIdx);
		
		AdminSurveyQuestionVo adminSurveyQuestionVo = new AdminSurveyQuestionVo();
		adminSurveyQuestionVo.setSURVEY_IDX(surveyIdx);

		adminSurveyQuestionVo.setLIMIT(99999);
		ModelMap QUESTION  = adminSurveyQuestionService.getList(adminSurveyQuestionVo);

		
		AdminSurveyQuestionnaireVo adminSurveyQuestionnaireVo = new AdminSurveyQuestionnaireVo();
		adminSurveyQuestionnaireVo.setSURVEY_IDX(surveyIdx);
		adminSurveyQuestionnaireVo.setLIMIT(99999);
		ModelMap QUESTIONNAIRE = adminSurveyQuestionnaireService.getList(adminSurveyQuestionnaireVo);

		
		AdminSurveySelectVo adminSurveySelectVo = new AdminSurveySelectVo();
		adminSurveySelectVo.setSURVEY_IDX(surveyIdx);
		adminSurveySelectVo.setLIMIT(99999);
		ModelMap QUESTIONSELECT = adminSurveySelectService.getList(adminSurveySelectVo);
		
		
		
		AdminSurveyAnswerVo adminSurveyAnswerVo = new AdminSurveyAnswerVo();
		adminSurveyAnswerVo.setSURVEY_IDX(surveyIdx);
		adminSurveyAnswerVo.setLIMIT(9999999);
		adminSurveyAnswerVo.setSURVEY_TEXT("ALL");
		
		ModelMap QUESTIONANSWER = adminSurveyAnswerService.getList(adminSurveyAnswerVo);
				
		
		
		
		model.put("QUESTIONNAIRE", QUESTIONNAIRE);
		model.put("QUESTION", QUESTION);
		model.put("QUESTIONSELECT", QUESTIONSELECT);
		
		model.put("QUESTIONANSWER", QUESTIONANSWER);
		
		model.put("beforeDomain", adminSurveyVo);
		model.put("CODE", code);
		

		return new ModelAndView("admin/survey/detail", "model", model);
	}

	@RequestMapping(value = "/admin/survey/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(

			HttpServletRequest request, HttpServletResponse response) 
	{
		String  code = "survey";
		ModelMap model = new ModelMap();
		
		model.put("CODE", code);
		
		return new ModelAndView("admin/survey/insert", "model", model);
	}

	@RequestMapping(value = "/admin/survey/insert.do", method = RequestMethod.POST)
	public String insertPost(
			@ModelAttribute("AdminSurveyVo") AdminSurveyVo adminSurveyVo, HttpServletRequest  request,  HttpServletResponse response) {
		
		String  code = "survey";
		adminSurveyVo.setREAD_CNT("0");
		adminSurveyVo.setMEMBER_ID(SUtil.getUserId(request));
		adminSurveyVo.setCODE(code);
		ModelMap model = new ModelMap();

		adminSurveyService.setInsert(adminSurveyVo);		
		
		return "redirect:./list.do";
	}
	
	@RequestMapping(value = "/admin/survey/{surveyid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(
			
			@PathVariable("surveyid") String surveyid, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		model = adminSurveyService.getView(surveyid);

		
		return new ModelAndView("admin/survey/update", "model", model);
	}
	
	@RequestMapping(value = "/admin/survey/{surveyid}/update.do", method = RequestMethod.POST)
	public String updatePost(
			@PathVariable("surveyid") String surveyid, @ModelAttribute("AdminSurveyVo") AdminSurveyVo adminSurveyVo,
			HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		adminSurveyVo.setIDX(surveyid);
		
		boolean rtn = adminSurveyService.setUpdate(adminSurveyVo);

		return "redirect:../list.do";

	}

	@RequestMapping(value = "/admin/survey/{surveyid}/delete.do", method = RequestMethod.GET)
	public String deletePost(
			@PathVariable("surveyid") String surveyid, @ModelAttribute("AdminSurveyVo") AdminSurveyVo adminSurveyVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String year = request.getParameter("year") != null ? request.getParameter("year") : "";
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		adminSurveyVo.setIDX(surveyid);
		boolean rtn = adminSurveyService.setDelete(adminSurveyVo);
		return "redirect:../list.do";
	}
	@RequestMapping(value = "/admin/survey/{surveyid}/excelDown.do", method = RequestMethod.GET)
	public void excelDown(
			@PathVariable("surveyid") String surveyid, @ModelAttribute("AdminSurveyVo") AdminSurveyVo adminSurveyVo, HttpServletRequest request,
			HttpServletResponse response) {

		
		List<HashMap> list = adminSurveyAnswerService.getListMemberAll(surveyid);

		Workbook wb = new HSSFWorkbook();

	    Sheet sheet = wb.createSheet("survey");

	    Row row = null;

	    Cell cell = null;

	    int rowNo = 0;

	    HashMap map = new HashMap();

		for(int i = 0; i < list.size(); i++)
		{
			HashMap tempMap = list.get(i);
			String MEMBER_ID = (String) tempMap.get("MEMBER_ID");
			
			AdminSurveyAnswerVo adminSurveyAnswerVo = new AdminSurveyAnswerVo();
			adminSurveyAnswerVo.setMEMBER_ID(MEMBER_ID);
			adminSurveyAnswerVo.setSURVEY_IDX(surveyid);

			List<HashMap> list2 = adminSurveyAnswerService.getListStat(adminSurveyAnswerVo);

			row = sheet.createRow(rowNo++);
			
			if(i == 0)
			{
				for(int j = 0; j < list2.size(); j++)
				{
					HashMap tempMap2 = list2.get(j);
					String QUESTION = (String) tempMap2.get("QUESTION");

					if(j == 0)
					{
						cell = row.createCell(j);
						cell.setCellValue("타임스탬프");	
					}else if(j == 1)
					{
						cell = row.createCell(j);
						cell.setCellValue("설문작성자");
					}
						
					
					cell = row.createCell(j+2);
					cell.setCellValue(QUESTION);	
				}	
				row = sheet.createRow(rowNo++);
			}
			
			for(int j = 0; j < list2.size(); j++)
			{
				
				HashMap tempMap2 = list2.get(j);
				String CREATE_TM = "";
				try {
					CREATE_TM =  tempMap2.get("CREATE_TM2")+"";
				}catch(java.lang.ClassCastException e)
				{
					CREATE_TM =  tempMap2.get("CREATE_TM2")+"";
				}
				
				
				String NAME = (String) tempMap2.get("NAME");
				String QUESTION = (String) tempMap2.get("QUESTION");
				String ITEM = (String) tempMap2.get("ITEM");
				
				int column = 0;

				
				if(j == 0)
				{
					cell = row.createCell(j);
					cell.setCellValue(CREATE_TM);	
				}else if(j == 1)
				{
					cell = row.createCell(j);
					cell.setCellValue(NAME);	
				}
				cell = row.createCell(j+2);
				cell.setCellValue(ITEM);	
			}
		}
		

	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename=survey.xls");


	    try {
			wb.write(response.getOutputStream());
			//wb.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	
	}
	
}
