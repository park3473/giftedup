package egovframework.kaist.user.survey_question.controller;

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

@Controller
public class UserSurveyQuestionController {

	@Autowired
	UserSurveyQuestionService usersurveyQuestionService;

	private static final Logger Logger = LoggerFactory.getLogger(UserSurveyQuestionController.class);

	@RequestMapping(value = "/user/survey_question/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("UsersurveyQuestionVo") UserSurveyQuestionVo usersurveyQuestionVo,
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
		

		usersurveyQuestionVo.setPAGE(Integer.parseInt(PAGE));
		usersurveyQuestionVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = usersurveyQuestionVo.getPAGE() * usersurveyQuestionVo.getITEM_COUNT();
		
		usersurveyQuestionVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		usersurveyQuestionVo.setOFFSET(pagelimit);
		
		
		model = usersurveyQuestionService.getList(usersurveyQuestionVo);
		
		model.put("SEARCH_TYPE", usersurveyQuestionVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", usersurveyQuestionVo.getSEARCH_TEXT());
		
		
		model.put("beforeDomain", usersurveyQuestionVo);
		

		return new ModelAndView("user/survey_question/list", "model", model);
	}

	@RequestMapping(value = "/user/survey_question/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(HttpServletRequest request, HttpServletResponse response) 
	
	
	{

		ModelMap model = new ModelMap();
		
		String TYPE = (String) (request.getParameter("TYPE") != null ? request.getParameter("TYPE") : "1");
		
		if(TYPE == null || TYPE.equals(""))
		{
			TYPE = "1";
		}
		
		
		model.put("TYPE", TYPE);
		
		return new ModelAndView("user/survey_question/insert", "model", model);
	}

	@RequestMapping(value = "/user/survey_question/insert.do", method = RequestMethod.POST)
	public String insertPost(@ModelAttribute("UsersurveyQuestionVo") UserSurveyQuestionVo usersurveyQuestionVo, HttpServletRequest  request,  HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		usersurveyQuestionService.setInsert(usersurveyQuestionVo);		
		
		return "redirect:./list.do";
	}
	
	@RequestMapping(value = "/user/survey_question/{survey_questionid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("survey_questionid") String survey_questionid, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		model = usersurveyQuestionService.getView(survey_questionid);

		return new ModelAndView("user/survey_question/update", "model", model);
	}
	
	@RequestMapping(value = "/user/survey_question/{survey_questionid}/update.do", method = RequestMethod.POST)
	public String updatePost(@PathVariable("survey_questionid") int survey_questionid, @ModelAttribute("UsersurveyQuestionVo") UserSurveyQuestionVo usersurveyQuestionVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		usersurveyQuestionVo.setIDX(survey_questionid);
		
		boolean rtn = usersurveyQuestionService.setUpdate(usersurveyQuestionVo);

		return "redirect:../list.do";

	}

	@RequestMapping(value = "/user/survey_question/{survey_questionid}/delete.do", method = RequestMethod.GET)
	public String deletePost(@PathVariable("survey_questionid") int survey_questionid, @ModelAttribute("UsersurveyQuestionVo") UserSurveyQuestionVo usersurveyQuestionVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String year = request.getParameter("year") != null ? request.getParameter("year") : "";
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		usersurveyQuestionVo.setIDX(survey_questionid);
		boolean rtn = usersurveyQuestionService.setDelete(usersurveyQuestionVo);
		return "redirect:../list.do";
	}

}
