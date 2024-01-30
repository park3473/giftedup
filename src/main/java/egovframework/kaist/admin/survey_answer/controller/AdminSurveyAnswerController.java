﻿package egovframework.kaist.admin.survey_answer.controller;

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

import egovframework.kaist.admin.survey.service.AdminSurveyService;
import egovframework.kaist.admin.survey_answer.model.AdminSurveyAnswerVo;
import egovframework.kaist.admin.survey_answer.service.AdminSurveyAnswerService;
import egovframework.kaist.admin.survey_question.service.AdminSurveyQuestionService;
import egovframework.kaist.admin.survey_questionnaire.service.AdminSurveyQuestionnaireService;
import egovframework.kaist.admin.survey_select.service.AdminSurveySelectService;

@Controller
public class AdminSurveyAnswerController {

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
	
	
	private static final Logger Logger = LoggerFactory.getLogger(AdminSurveyAnswerController.class);
	


}
