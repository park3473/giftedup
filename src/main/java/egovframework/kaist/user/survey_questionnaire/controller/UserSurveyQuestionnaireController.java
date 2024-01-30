package egovframework.kaist.user.survey_questionnaire.controller;

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

import egovframework.kaist.user.survey_question.model.UserSurveyQuestionVo;
import egovframework.kaist.user.survey_question.service.UserSurveyQuestionService;
import egovframework.kaist.user.survey_questionnaire.model.UserSurveyQuestionnaireVo;
import egovframework.kaist.user.survey_questionnaire.service.UserSurveyQuestionnaireService;
import egovframework.kaist.user.survey_select.model.UserSurveySelectVo;
import egovframework.kaist.user.survey_select.service.UserSurveySelectService;

@Controller
public class UserSurveyQuestionnaireController {

	@Autowired
	UserSurveyQuestionnaireService userSurveyQuestionnaireService;

	
	@Autowired
	UserSurveyQuestionService userSurveyQuestionService;
	
	@Autowired
	UserSurveySelectService userSurveySelectService;
	
	private static final Logger Logger = LoggerFactory.getLogger(UserSurveyQuestionnaireController.class);

	@RequestMapping(value = "/user/{survey}/survey_questionnaire/{surveyIdx}/list.do", method = RequestMethod.GET)
	public ModelAndView list(
			@PathVariable("survey") String survey,
			@PathVariable("surveyIdx") String surveyIdx,
			
			@ModelAttribute("UserSurveyQuestionnaireVo") UserSurveyQuestionnaireVo userSurveyQuestionnaireVo,
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
		

		userSurveyQuestionnaireVo.setPAGE(Integer.parseInt(PAGE));
		userSurveyQuestionnaireVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = userSurveyQuestionnaireVo.getPAGE() * userSurveyQuestionnaireVo.getITEM_COUNT();
		
		userSurveyQuestionnaireVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		userSurveyQuestionnaireVo.setOFFSET(pagelimit);
		
		userSurveyQuestionnaireVo.setSURVEY_IDX(surveyIdx);
		
		model = userSurveyQuestionnaireService.getList(userSurveyQuestionnaireVo);
		
		model.put("SEARCH_TYPE", userSurveyQuestionnaireVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", userSurveyQuestionnaireVo.getSEARCH_TEXT());
		
		
		model.put("beforeDomain", userSurveyQuestionnaireVo);
		
		model.put("CODE", survey);
		model.put("SURVEY_IDX", surveyIdx);
		return new ModelAndView("user/survey_questionnaire/list", "model", model);
	}
	
	@RequestMapping(value = "/user/{survey}/survey_questionnaire/{surveyidx}/{survey_questionnaireid}/view.do", method = RequestMethod.GET)
	public ModelAndView viewGet(
			@PathVariable("survey") String survey,
			@PathVariable("surveyidx") String surveyidx,
			@PathVariable("survey_questionnaireid") String survey_questionnaireid,
			HttpServletRequest request, HttpServletResponse response) 
	
	
	{

		ModelMap model = new ModelMap();
		
		UserSurveyQuestionVo userSurveyQuestionVo = new UserSurveyQuestionVo();
		userSurveyQuestionVo.setSURVEY_IDX(surveyidx);
		userSurveyQuestionVo.setSURVEY_QUESLIONNAIRE_IDX(survey_questionnaireid);
		userSurveyQuestionVo.setOFFSET(0);
		userSurveyQuestionVo.setLIMIT(999999999);
		
		model = userSurveyQuestionService.getListQuestionSelect(userSurveyQuestionVo);
		
		
		UserSurveySelectVo usersurveySelectVo = new UserSurveySelectVo();
		//usersurveySelectVo.setSURVEY_QUESTION_IDX(idx+"");
		usersurveySelectVo.setSURVEY_QUESLIONNAIRE_IDX(survey_questionnaireid);
		usersurveySelectVo.setOFFSET(0);
		usersurveySelectVo.setLIMIT(999999);
		model.put("SURVEY_SELECT", userSurveySelectService.getList(usersurveySelectVo));
		//List<?> list2 = userSurveySeleteMapper.getList(usersurveySelectVo);
		
		
		UserSurveyQuestionnaireVo userSurveyQuestionnaireVo = new UserSurveyQuestionnaireVo();
		userSurveyQuestionnaireVo.setIDX(survey_questionnaireid);
		userSurveyQuestionnaireVo.setSURVEY_IDX(surveyidx);
		
		
		model.put("QUESTIONNAIRE", userSurveyQuestionnaireService.getView(survey_questionnaireid)); 
		
		model.put("SURVEY_IDX", surveyidx);
		model.put("CODE", survey);
		
		
		return new ModelAndView("user/survey_questionnaire/view", "model", model);
	}


	@RequestMapping(value = "/user/{survey}/survey_questionnaire/{surveyidx}/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(
			@PathVariable("survey") String survey,
			@PathVariable("surveyidx") String surveyidx,
			HttpServletRequest request, HttpServletResponse response) 
	{

		ModelMap model = new ModelMap();
		
		model.put("SURVEY_IDX", surveyidx);
		
		return new ModelAndView("user/survey_questionnaire/insert", "model", model);
	}

	@RequestMapping(value = "/user/{survey}/survey_questionnaire/{surveyidx}/insert.do", method = RequestMethod.POST)
	public String insertPost(
			@PathVariable("survey") String survey,
			@PathVariable("surveyidx") String surveyidx,
			@ModelAttribute("UserSurveyQuestionnaireVo") UserSurveyQuestionnaireVo userSurveyQuestionnaireVo,
			HttpServletRequest  request,  HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		userSurveyQuestionnaireVo.setSURVEY_IDX(surveyidx);
		userSurveyQuestionnaireService.setInsert(userSurveyQuestionnaireVo);		
		
		return "redirect:./list.do";
	}
	
	
	
	

	@RequestMapping(value = "/user/{survey}/survey_questionnaire/{surveyidx}/{survey_questionnaireid}/insert.do", method = RequestMethod.GET)
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
		
		return new ModelAndView("user/survey_questionnaire/insert", "model", model);
	}
	
		
	@RequestMapping(value = "/user/{survey}/survey_questionnaire/{surveyidx}/{survey_questionnaireid}/insert.do", method = RequestMethod.POST)
	public String insertPost(
			@PathVariable("survey") String survey,
			@PathVariable("surveyidx") String surveyidx,
			@PathVariable("survey_questionnaireid") String survey_questionnaireid,
			@ModelAttribute("UserSurveyQuestionnaireVo") UserSurveyQuestionnaireVo userSurveyQuestionnaireVo,
			HttpServletRequest  request,  HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		
		List<UserSurveyQuestionnaireVo> list =  userSurveyQuestionnaireVo.getList();
		for(int i = 0; i < list.size(); i++)
		{
			UserSurveyQuestionnaireVo vo = list.get(i);
			System.out.println(vo.getQUESTION());
			System.out.println(vo.getTYPE());
			System.out.println(vo.getQUESTION_SELECT());
			
			
			
			
			UserSurveyQuestionVo questionVo = new UserSurveyQuestionVo();
			questionVo.setSURVEY_IDX(surveyidx);
			questionVo.setSURVEY_QUESLIONNAIRE_IDX(survey_questionnaireid);
			questionVo.setQUESTION(vo.getQUESTION());
			questionVo.setTYPE(vo.getTYPE());
			questionVo.setUSEKEY("1");
			questionVo.setIMAGE("");
			questionVo.setTURN("1");
			questionVo.setIDX(0);
			
			
			int idx = userSurveyQuestionService.setInsert(questionVo);
			System.out.println("_____nks -__ idx : " + idx);
			UserSurveySelectVo questionSelectVo = new UserSurveySelectVo();
			try {
				String select[] = vo.getQUESTION_SELECT().split(",");

				questionSelectVo.setSURVEY_IDX(surveyidx);
				questionSelectVo.setSURVEY_QUESTION_IDX(idx+"");
				questionSelectVo.setSURVEY_QUESLIONNAIRE_IDX(survey_questionnaireid);
				for(int j = 0; j < select.length; j++)
				{
					questionSelectVo.setSELECT_ITEM(select[j]);
					
					userSurveySelectService.setInsert(questionSelectVo);
				}
			}catch(java.lang.NullPointerException e)
			{
				
			}
			
			
		}
		
		
		
		//userSurveyQuestionnaireVo.setSURVEY_IDX(survey);
		//userSurveyQuestionnaireService.setInsert(userSurveyQuestionnaireVo);		
		
		return "redirect:./view.do";
	}
	
	@RequestMapping(value = "/user/{survey}/survey_questionnaire/{surveyidx}/{survey_questionnaireid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(
			@PathVariable("survey") String survey,
			@PathVariable("surveyidx") String surveyidx,
			@PathVariable("survey_questionnaireid") String survey_questionnaireid, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		model.put("SURVEY_IDX", survey);
		model = userSurveyQuestionnaireService.getView(survey_questionnaireid);

		return new ModelAndView("user/survey_questionnaire/update", "model", model);
	}
	
	@RequestMapping(value = "/user/{survey}/survey_questionnaire/{surveyidx}/{survey_questionnaireid}/update.do", method = RequestMethod.POST)
	public String updatePost(@PathVariable("survey") String survey,
			@PathVariable("surveyidx") String surveyidx,
			@PathVariable("survey_questionnaireid") String survey_questionnaireid, @ModelAttribute("UserSurveyQuestionnaireVo") UserSurveyQuestionnaireVo userSurveyQuestionnaireVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		userSurveyQuestionnaireVo.setIDX(survey_questionnaireid);
		
		
		
		boolean rtn = userSurveyQuestionnaireService.setUpdate(userSurveyQuestionnaireVo);

		return "redirect:../list.do";

	}
	@RequestMapping(value = "/user/{survey}/survey_questionnaire/{surveyidx}/{survey_questionnaireid}/ajaxupdate.do", method = {RequestMethod.GET,RequestMethod.POST})
	public void update2Post(
			@PathVariable("survey") String survey,
			@PathVariable("surveyidx") String surveyidx,
			@PathVariable("survey_questionnaireid") String survey_questionnaireid, @ModelAttribute("UserSurveyQuestionnaireVo") UserSurveyQuestionnaireVo userSurveyQuestionnaireVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		if(userSurveyQuestionnaireVo.getTYPE().equals("2"))
		{
			UserSurveySelectVo userSurveySelectVo = new UserSurveySelectVo();
			userSurveySelectVo.setIDX(userSurveyQuestionnaireVo.getIDX());
			userSurveySelectVo.setSELECT_ITEM(userSurveyQuestionnaireVo.getNAME());
			userSurveySelectService.setUpdate(userSurveySelectVo);
		}
		else if(userSurveyQuestionnaireVo.getTYPE().equals("1"))
		{
			UserSurveyQuestionVo userSurveyQuestionVo = new UserSurveyQuestionVo();
			userSurveyQuestionVo.setIDX(Long.parseLong(userSurveyQuestionnaireVo.getIDX()));
			userSurveyQuestionVo.setQUESTION(userSurveyQuestionnaireVo.getNAME());
			userSurveyQuestionService.setUpdate(userSurveyQuestionVo);
		}
		else if(userSurveyQuestionnaireVo.getTYPE().equals("3"))
		{
			userSurveyQuestionnaireVo.setTITLE(userSurveyQuestionnaireVo.getNAME());
			userSurveyQuestionnaireService.setUpdate(userSurveyQuestionnaireVo);
		}
		//boolean rtn = userSurveyQuestionnaireService.setDelete(userSurveyQuestionnaireVo);
		try {
			response.getWriter().print("true");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/user/{survey}/survey_questionnaire/{surveyidx}/{survey_questionnaireid}/ajaxdelete.do", method = {RequestMethod.GET,RequestMethod.POST})
	public void delete2Post(
			@PathVariable("survey") String survey,
			@PathVariable("surveyidx") String surveyidx,
			@PathVariable("survey_questionnaireid") String survey_questionnaireid, @ModelAttribute("UserSurveyQuestionnaireVo") UserSurveyQuestionnaireVo userSurveyQuestionnaireVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		
		
		if(userSurveyQuestionnaireVo.getTYPE().equals("2"))
		{
			UserSurveySelectVo userSurveySelectVo = new UserSurveySelectVo();
			userSurveySelectVo.setIDX(userSurveyQuestionnaireVo.getIDX());
			userSurveySelectService.setDelete(userSurveySelectVo);
		}
		if(userSurveyQuestionnaireVo.getTYPE().equals("1"))
		{
			UserSurveyQuestionVo userSurveyQuestionVo = new UserSurveyQuestionVo();
			userSurveyQuestionVo.setIDX(Long.parseLong(userSurveyQuestionnaireVo.getIDX()));
			userSurveyQuestionService.setDelete(userSurveyQuestionVo);
		}
		//boolean rtn = userSurveyQuestionnaireService.setDelete(userSurveyQuestionnaireVo);
		try {
			response.getWriter().print("true");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}										 
	@RequestMapping(value = "/user/{survey}/survey_questionnaire/{surveyidx}/{survey_questionnaireid}/delete.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String deletePost(
			@PathVariable("survey") String survey,
			@PathVariable("surveyidx") String surveyidx,
			@PathVariable("survey_questionnaireid") String survey_questionnaireid, @ModelAttribute("UserSurveyQuestionnaireVo") UserSurveyQuestionnaireVo userSurveyQuestionnaireVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		userSurveyQuestionnaireVo.setIDX(survey_questionnaireid);
		boolean rtn = userSurveyQuestionnaireService.setDelete(userSurveyQuestionnaireVo);
		return "redirect:../list.do";
	}

}
