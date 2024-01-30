package egovframework.kaist.admin.survey_questionnaire.controller;

import java.io.IOException;
import java.util.List;

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

import egovframework.kaist.admin.survey_question.model.AdminSurveyQuestionVo;
import egovframework.kaist.admin.survey_question.service.AdminSurveyQuestionService;
import egovframework.kaist.admin.survey_questionnaire.model.AdminSurveyQuestionnaireVo;
import egovframework.kaist.admin.survey_questionnaire.service.AdminSurveyQuestionnaireService;
import egovframework.kaist.admin.survey_select.model.AdminSurveySelectVo;
import egovframework.kaist.admin.survey_select.service.AdminSurveySelectService;

@Controller
public class AdminSurveyQuestionnaireController {

	@Autowired
	AdminSurveyQuestionnaireService adminSurveyQuestionnaireService;

	
	@Autowired
	AdminSurveyQuestionService adminSurveyQuestionService;
	
	@Autowired
	AdminSurveySelectService adminSurveySelectService;
	
	private static final Logger Logger = LoggerFactory.getLogger(AdminSurveyQuestionnaireController.class);

	@RequestMapping(value = "/admin/{survey}/survey_questionnaire/{surveyIdx}/list.do", method = RequestMethod.GET)
	public ModelAndView list(
			@PathVariable("survey") String survey,
			@PathVariable("surveyIdx") String surveyIdx,
			
			@ModelAttribute("AdminSurveyQuestionnaireVo") AdminSurveyQuestionnaireVo adminSurveyQuestionnaireVo,
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
		

		adminSurveyQuestionnaireVo.setPAGE(Integer.parseInt(PAGE));
		adminSurveyQuestionnaireVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		adminSurveyQuestionnaireVo.setSURVEY_IDX(surveyIdx);
		
		ModelMap model = new ModelMap();
	
		int pagelimit = adminSurveyQuestionnaireVo.getPAGE() * adminSurveyQuestionnaireVo.getITEM_COUNT();
		
		adminSurveyQuestionnaireVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		adminSurveyQuestionnaireVo.setOFFSET(pagelimit);
		
		
		model = adminSurveyQuestionnaireService.getList(adminSurveyQuestionnaireVo);
		
		model.put("SEARCH_TYPE", adminSurveyQuestionnaireVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", adminSurveyQuestionnaireVo.getSEARCH_TEXT());
		
		
		model.put("beforeDomain", adminSurveyQuestionnaireVo);
		
		model.put("CODE", survey);
		model.put("SURVEY_IDX", surveyIdx);
		return new ModelAndView("admin/survey_questionnaire/list", "model", model);
	}
	
	@RequestMapping(value = "/admin/{survey}/survey_questionnaire/{surveyidx}/{survey_questionnaireid}/view.do", method = RequestMethod.GET)
	public ModelAndView viewGet(
			@PathVariable("survey") String survey,
			@PathVariable("surveyidx") String surveyidx,
			@PathVariable("survey_questionnaireid") String survey_questionnaireid,
			HttpServletRequest request, HttpServletResponse response) 
	
	
	{

		ModelMap model = new ModelMap();
		
		AdminSurveyQuestionVo adminSurveyQuestionVo = new AdminSurveyQuestionVo();
		adminSurveyQuestionVo.setSURVEY_IDX(surveyidx);
		adminSurveyQuestionVo.setSURVEY_QUESLIONNAIRE_IDX(survey_questionnaireid);
		adminSurveyQuestionVo.setOFFSET(0);
		adminSurveyQuestionVo.setLIMIT(999999999);
		
		model = adminSurveyQuestionService.getListQuestionSelect(adminSurveyQuestionVo);
		
		
		AdminSurveySelectVo adminsurveySelectVo = new AdminSurveySelectVo();
		//adminsurveySelectVo.setSURVEY_QUESTION_IDX(idx+"");
		adminsurveySelectVo.setSURVEY_QUESLIONNAIRE_IDX(survey_questionnaireid);
		adminsurveySelectVo.setOFFSET(0);
		adminsurveySelectVo.setLIMIT(999999);
		model.put("SURVEY_SELECT", adminSurveySelectService.getList(adminsurveySelectVo));
		//List<?> list2 = adminSurveySeleteMapper.getList(adminsurveySelectVo);
		
		
		AdminSurveyQuestionnaireVo adminSurveyQuestionnaireVo = new AdminSurveyQuestionnaireVo();
		adminSurveyQuestionnaireVo.setIDX(survey_questionnaireid);
		adminSurveyQuestionnaireVo.setSURVEY_IDX(surveyidx);
		model.put("ZTREE", adminSurveyQuestionnaireService.getListZtreeAll(adminSurveyQuestionnaireVo));
		
		model.put("QUESTIONNAIRE", adminSurveyQuestionnaireService.getView(survey_questionnaireid)); 
		
		model.put("SURVEY_IDX", surveyidx);
		model.put("CODE", survey);
		
		
		return new ModelAndView("admin/survey_questionnaire/view", "model", model);
	}


	@RequestMapping(value = "/admin/{survey}/survey_questionnaire/{surveyidx}/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(
			@PathVariable("survey") String survey,
			@PathVariable("surveyidx") String surveyidx,
			HttpServletRequest request, HttpServletResponse response) 
	{

		ModelMap model = new ModelMap();
		
		model.put("SURVEY_IDX", surveyidx);
		
		return new ModelAndView("admin/survey_questionnaire/insert", "model", model);
	}

	@RequestMapping(value = "/admin/{survey}/survey_questionnaire/{surveyidx}/insert.do", method = RequestMethod.POST)
	public String insertPost(
			@PathVariable("survey") String survey,
			@PathVariable("surveyidx") String surveyidx,
			@ModelAttribute("AdminSurveyQuestionnaireVo") AdminSurveyQuestionnaireVo adminSurveyQuestionnaireVo,
			HttpServletRequest  request,  HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		adminSurveyQuestionnaireVo.setSURVEY_IDX(surveyidx);
		adminSurveyQuestionnaireService.setInsert(adminSurveyQuestionnaireVo);		
		
		return "redirect:./list.do";
	}
	
	
	
	

	@RequestMapping(value = "/admin/{survey}/survey_questionnaire/{surveyidx}/{survey_questionnaireid}/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(
			@PathVariable("survey") String survey,
			@PathVariable("surveyidx") String surveyidx,
			@PathVariable("survey_questionnaireid") String survey_questionnaireid,
			HttpServletRequest request, HttpServletResponse response) 
	
	
	{

		ModelMap model = new ModelMap();
		
		String TYPE = (String) (request.getParameter("TYPE") != null ? request.getParameter("TYPE") : "1");
		
		if(TYPE == null || TYPE.equals(""))
		{
			TYPE = "1";
		}
		
		
		model.put("SURVEY_IDX", survey);
		
		return new ModelAndView("admin/survey_questionnaire/insert", "model", model);
	}
	
		
	@RequestMapping(value = "/admin/{survey}/survey_questionnaire/{surveyidx}/{survey_questionnaireid}/insert.do", method = RequestMethod.POST)
	public String insertPost(
			@PathVariable("survey") String survey,
			@PathVariable("surveyidx") String surveyidx,
			@PathVariable("survey_questionnaireid") String survey_questionnaireid,
			@ModelAttribute("AdminSurveyQuestionnaireVo") AdminSurveyQuestionnaireVo adminSurveyQuestionnaireVo,
			HttpServletRequest  request,  HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		
		List<AdminSurveyQuestionnaireVo> list =  adminSurveyQuestionnaireVo.getList();
		for(int i = 0; i < list.size(); i++)
		{
			AdminSurveyQuestionnaireVo vo = list.get(i);
			System.out.println(vo.getQUESTION());
			System.out.println(vo.getTYPE());
			System.out.println(vo.getQUESTION_SELECT());
			
			
			
			
			AdminSurveyQuestionVo questionVo = new AdminSurveyQuestionVo();
			questionVo.setSURVEY_IDX(surveyidx);
			questionVo.setSURVEY_QUESLIONNAIRE_IDX(survey_questionnaireid);
			questionVo.setQUESTION(vo.getQUESTION());
			questionVo.setTYPE(vo.getTYPE());
			questionVo.setUSEKEY("1");
			questionVo.setIMAGE("");
			questionVo.setTURN("1");
			questionVo.setIDX(0);
			
			
			int idx = adminSurveyQuestionService.setInsert(questionVo);
			System.out.println("_____nks -__ idx : " + idx);
			AdminSurveySelectVo questionSelectVo = new AdminSurveySelectVo();
			try {
				String select[] = vo.getQUESTION_SELECT().split(",");

				questionSelectVo.setSURVEY_IDX(surveyidx);
				questionSelectVo.setSURVEY_QUESTION_IDX(idx+"");
				questionSelectVo.setSURVEY_QUESLIONNAIRE_IDX(survey_questionnaireid);
				for(int j = 0; j < select.length; j++)
				{
					questionSelectVo.setSELECT_ITEM(select[j]);
					
					adminSurveySelectService.setInsert(questionSelectVo);
				}
			}catch(java.lang.NullPointerException e)
			{
				
			}
			
			
		}
		
		
		
		//adminSurveyQuestionnaireVo.setSURVEY_IDX(survey);
		//adminSurveyQuestionnaireService.setInsert(adminSurveyQuestionnaireVo);		
		
		return "redirect:./view.do";
	}
	
	@RequestMapping(value = "/admin/{survey}/survey_questionnaire/{surveyidx}/{survey_questionnaireid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(
			@PathVariable("survey") String survey,
			@PathVariable("surveyidx") String surveyidx,
			@PathVariable("survey_questionnaireid") String survey_questionnaireid, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		model.put("SURVEY_IDX", survey);
		model = adminSurveyQuestionnaireService.getView(survey_questionnaireid);

		return new ModelAndView("admin/survey_questionnaire/update", "model", model);
	}
	
	@RequestMapping(value = "/admin/{survey}/survey_questionnaire/{surveyidx}/{survey_questionnaireid}/update.do", method = RequestMethod.POST)
	public String updatePost(@PathVariable("survey") String survey,
			@PathVariable("surveyidx") String surveyidx,
			@PathVariable("survey_questionnaireid") String survey_questionnaireid, @ModelAttribute("AdminSurveyQuestionnaireVo") AdminSurveyQuestionnaireVo adminSurveyQuestionnaireVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		adminSurveyQuestionnaireVo.setIDX(survey_questionnaireid);
		
		
		
		boolean rtn = adminSurveyQuestionnaireService.setUpdate(adminSurveyQuestionnaireVo);

		return "redirect:../list.do";

	}
	@RequestMapping(value = "/admin/{survey}/survey_questionnaire/{surveyidx}/{survey_questionnaireid}/ajaxupdate.do", method = {RequestMethod.GET,RequestMethod.POST})
	public void update2Post(
			@PathVariable("survey") String survey,
			@PathVariable("surveyidx") String surveyidx,
			@PathVariable("survey_questionnaireid") String survey_questionnaireid, @ModelAttribute("AdminSurveyQuestionnaireVo") AdminSurveyQuestionnaireVo adminSurveyQuestionnaireVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		if(adminSurveyQuestionnaireVo.getTYPE().equals("2"))
		{
			AdminSurveySelectVo adminSurveySelectVo = new AdminSurveySelectVo();
			adminSurveySelectVo.setIDX(adminSurveyQuestionnaireVo.getIDX());
			adminSurveySelectVo.setSELECT_ITEM(adminSurveyQuestionnaireVo.getNAME());
			adminSurveySelectService.setUpdate(adminSurveySelectVo);
		}
		else if(adminSurveyQuestionnaireVo.getTYPE().equals("1"))
		{
			AdminSurveyQuestionVo adminSurveyQuestionVo = new AdminSurveyQuestionVo();
			adminSurveyQuestionVo.setIDX(Long.parseLong(adminSurveyQuestionnaireVo.getIDX()));
			adminSurveyQuestionVo.setQUESTION(adminSurveyQuestionnaireVo.getNAME());
			adminSurveyQuestionService.setUpdate(adminSurveyQuestionVo);
		}
		else if(adminSurveyQuestionnaireVo.getTYPE().equals("3"))
		{
			adminSurveyQuestionnaireVo.setTITLE(adminSurveyQuestionnaireVo.getNAME());
			adminSurveyQuestionnaireService.setUpdate(adminSurveyQuestionnaireVo);
		}
		//boolean rtn = adminSurveyQuestionnaireService.setDelete(adminSurveyQuestionnaireVo);
		try {
			response.getWriter().print("true");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/admin/{survey}/survey_questionnaire/{surveyidx}/{survey_questionnaireid}/ajaxdelete.do", method = {RequestMethod.GET,RequestMethod.POST})
	public void delete2Post(
			@PathVariable("survey") String survey,
			@PathVariable("surveyidx") String surveyidx,
			@PathVariable("survey_questionnaireid") String survey_questionnaireid, @ModelAttribute("AdminSurveyQuestionnaireVo") AdminSurveyQuestionnaireVo adminSurveyQuestionnaireVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		
		
		if(adminSurveyQuestionnaireVo.getTYPE().equals("2"))
		{
			AdminSurveySelectVo adminSurveySelectVo = new AdminSurveySelectVo();
			adminSurveySelectVo.setIDX(adminSurveyQuestionnaireVo.getIDX());
			adminSurveySelectService.setDelete(adminSurveySelectVo);
		}
		if(adminSurveyQuestionnaireVo.getTYPE().equals("1"))
		{
			AdminSurveyQuestionVo adminSurveyQuestionVo = new AdminSurveyQuestionVo();
			adminSurveyQuestionVo.setIDX(Long.parseLong(adminSurveyQuestionnaireVo.getIDX()));
			adminSurveyQuestionService.setDelete(adminSurveyQuestionVo);
		}
		//boolean rtn = adminSurveyQuestionnaireService.setDelete(adminSurveyQuestionnaireVo);
		try {
			response.getWriter().print("true");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}										 
	@RequestMapping(value = "/admin/{survey}/survey_questionnaire/{surveyidx}/{survey_questionnaireid}/delete.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String deletePost(
			@PathVariable("survey") String survey,
			@PathVariable("surveyidx") String surveyidx,
			@PathVariable("survey_questionnaireid") String survey_questionnaireid, @ModelAttribute("AdminSurveyQuestionnaireVo") AdminSurveyQuestionnaireVo adminSurveyQuestionnaireVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		adminSurveyQuestionnaireVo.setIDX(survey_questionnaireid);
		boolean rtn = adminSurveyQuestionnaireService.setDelete(adminSurveyQuestionnaireVo);
		return "redirect:../list.do";
	}

}
