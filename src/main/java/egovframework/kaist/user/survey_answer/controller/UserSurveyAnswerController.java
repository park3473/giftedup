package egovframework.kaist.user.survey_answer.controller;

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

import com.system.util.SUtil;

import egovframework.kaist.user.survey.service.UserSurveyService;
import egovframework.kaist.user.survey_answer.model.UserSurveyAnswerVo;
import egovframework.kaist.user.survey_answer.service.UserSurveyAnswerService;
import egovframework.kaist.user.survey_question.service.UserSurveyQuestionService;
import egovframework.kaist.user.survey_questionnaire.service.UserSurveyQuestionnaireService;
import egovframework.kaist.user.survey_select.service.UserSurveySelectService;

@Controller
public class UserSurveyAnswerController {

	@Autowired
	UserSurveyService userSurveyService;

	@Autowired
	UserSurveyQuestionService userSurveyQuestionService;
	
	@Autowired
	UserSurveyQuestionnaireService	userSurveyQuestionnaireService;
	
	@Autowired
	UserSurveySelectService userSurveySelectService;
	
	@Autowired
	UserSurveyAnswerService userSurveyAnswerService;
	
	
	private static final Logger Logger = LoggerFactory.getLogger(UserSurveyAnswerController.class);
	
	@RequestMapping(value = "/user/survey_answer/list.do", method = RequestMethod.GET)
	public ModelAndView list(
			@ModelAttribute("UserSurveyAnswerVo") UserSurveyAnswerVo userSurveyAnswerVo,
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
		
		
		userSurveyAnswerVo.setPAGE(Integer.parseInt(PAGE));
		userSurveyAnswerVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = userSurveyAnswerVo.getPAGE() * userSurveyAnswerVo.getITEM_COUNT();
		
		userSurveyAnswerVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		userSurveyAnswerVo.setOFFSET(pagelimit);
		
		
		model = userSurveyAnswerService.getList(userSurveyAnswerVo);
		
		
		
		model.put("SEARCH_TYPE", userSurveyAnswerVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", userSurveyAnswerVo.getSEARCH_TEXT());
		
		
		model.put("beforeDomain", userSurveyAnswerVo);
		
		

		return new ModelAndView("user/survey_answer/list", "model", model);
	}
	
	
	
	

	@RequestMapping(value = "/user/survey_answer/{code}/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(
			@PathVariable("code") String code,
			HttpServletRequest request, HttpServletResponse response) 
	{
		
		ModelMap model = new ModelMap();
		
		model.put("CODE", code);
		
		return new ModelAndView("user/survey_answer/insert", "model", model);
	}

	
	
	@RequestMapping(value = "/user/survey_answer/{survey_answerIdx}/detail.do", method = RequestMethod.POST)
	public String detailPost(@PathVariable("survey_answerIdx") String survey_answerIdx,
			@ModelAttribute("UserSurveyAnswerVo") UserSurveyAnswerVo userSurveyAnswerVo, HttpServletRequest  request,  HttpServletResponse response) {
		
		
		userSurveyAnswerVo.setMEMBER_ID(SUtil.getUserId(request));
		
		ModelMap model = new ModelMap();

		userSurveyAnswerService.setInsert(userSurveyAnswerVo);		
		
		return "redirect:./list.do";
	}
	
	@RequestMapping(value = "/user/survey_answer/{code}/insert.do", method = RequestMethod.POST)
	public String insertPost(@PathVariable("code") String code,
			@ModelAttribute("UserSurveyAnswerVo") UserSurveyAnswerVo userSurveyAnswerVo, HttpServletRequest  request,  HttpServletResponse response) {
		
		
		userSurveyAnswerVo.setMEMBER_ID(SUtil.getUserId(request));
		
		ModelMap model = new ModelMap();

		userSurveyAnswerService.setInsert(userSurveyAnswerVo);		
		
		return "redirect:./list.do";
	}
	
	@RequestMapping(value = "/user/survey_answer/{code}/{survey_answerid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(
			@PathVariable("code") String code,
			@PathVariable("survey_answerid") String survey_answerid, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		model = userSurveyAnswerService.getView(survey_answerid);

		
		return new ModelAndView("user/survey_answer/update", "model", model);
	}
	
	@RequestMapping(value = "/user/survey_answer/{code}/{survey_answerid}/update.do", method = RequestMethod.POST)
	public String updatePost(@PathVariable("code") String code,
			@PathVariable("survey_answerid") String survey_answerid, @ModelAttribute("UserSurveyAnswerVo") UserSurveyAnswerVo userSurveyAnswerVo,
			HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		userSurveyAnswerVo.setIDX(survey_answerid);
		
		boolean rtn = userSurveyAnswerService.setUpdate(userSurveyAnswerVo);

		return "redirect:../list.do";

	}

	@RequestMapping(value = "/user/survey_answer/{code}/{survey_answerid}/delete.do", method = RequestMethod.GET)
	public String deletePost(@PathVariable("code") String code,
			@PathVariable("survey_answerid") String survey_answerid, @ModelAttribute("UserSurveyAnswerVo") UserSurveyAnswerVo userSurveyAnswerVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String year = request.getParameter("year") != null ? request.getParameter("year") : "";
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		userSurveyAnswerVo.setIDX(survey_answerid);
		boolean rtn = userSurveyAnswerService.setDelete(userSurveyAnswerVo);
		return "redirect:../list.do";
	}

}
