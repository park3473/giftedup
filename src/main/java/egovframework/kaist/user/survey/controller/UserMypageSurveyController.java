package egovframework.kaist.user.survey.controller;


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

import com.system.util.SUtil;

import egovframework.kaist.user.survey.model.UserSurveyVo;
import egovframework.kaist.user.survey.service.UserSurveyService;
import egovframework.kaist.user.survey_answer.model.UserSurveyAnswerVo;
import egovframework.kaist.user.survey_answer.service.UserSurveyAnswerService;
import egovframework.kaist.user.survey_question.model.UserSurveyQuestionVo;
import egovframework.kaist.user.survey_question.service.UserSurveyQuestionService;
import egovframework.kaist.user.survey_questionnaire.model.UserSurveyQuestionnaireVo;
import egovframework.kaist.user.survey_questionnaire.service.UserSurveyQuestionnaireService;
import egovframework.kaist.user.survey_select.model.UserSurveySelectVo;
import egovframework.kaist.user.survey_select.service.UserSurveySelectService;


@Controller
public class UserMypageSurveyController {

	
	
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
	
	
	private static final Logger Logger = LoggerFactory.getLogger(UserMypageSurveyController.class);
	
	@RequestMapping(value = "/user/mypage/{code}/list.do", method = RequestMethod.GET)
	public ModelAndView list(@PathVariable("code") String code,
	

			@ModelAttribute("UserSurveyVo") UserSurveyVo userSurveyVo,
			HttpServletRequest request, HttpServletResponse response) {

		String PAGE = request.getParameter("PAGE") != null ? request
				.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request
				.getParameter("ITEM_COUNT") : "10";
			

		userSurveyVo.setCODE(code);

		if(SUtil.getUserType(request).equals("1"))
		{
			userSurveyVo.setTYPE_SUB("1");	
		}
		else if(SUtil.getUserType(request).equals("2"))
		{
			userSurveyVo.setTYPE_SUB("2");	
		}else
		{
			userSurveyVo.setTYPE_SUB("0");
		}


		if(PAGE == null)
		{
			PAGE = "0";
		}
		if(ITEM_COUNT == null)
		{
			ITEM_COUNT = "10";
		}
		

		userSurveyVo.setCODE(code);

		userSurveyVo.setPAGE(Integer.parseInt(PAGE));
		userSurveyVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = userSurveyVo.getPAGE() * userSurveyVo.getITEM_COUNT();
		
		userSurveyVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		userSurveyVo.setOFFSET(pagelimit);
		
		
		model = userSurveyService.getList(userSurveyVo);
		

		model.put("SEARCH_TYPE", userSurveyVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", userSurveyVo.getSEARCH_TEXT());
		
		
		model.put("beforeDomain", userSurveyVo);

		model.put("CODE", code);

		return new ModelAndView("user/mypage/survey/list", "model", model);
	}

	@RequestMapping(value = "/user/mypage/{code}/{surveyIdx}/detail.do", method = RequestMethod.GET)
	public ModelAndView detail(
			@PathVariable("code") String code,
			@PathVariable("surveyIdx") String surveyIdx,
			@ModelAttribute("UserSurveyVo") UserSurveyVo userSurveyVo,
			HttpServletRequest request, HttpServletResponse response) {

		userSurveyVo.setCODE(code);
		
		ModelMap model = new ModelMap();
		
		model = userSurveyService.getView(surveyIdx);
		
		UserSurveyQuestionVo userSurveyQuestionVo = new UserSurveyQuestionVo();
		userSurveyQuestionVo.setSURVEY_IDX(surveyIdx);

		userSurveyQuestionVo.setLIMIT(99999);
		ModelMap QUESTION  = userSurveyQuestionService.getList(userSurveyQuestionVo);

		
		UserSurveyQuestionnaireVo userSurveyQuestionnaireVo = new UserSurveyQuestionnaireVo();
		userSurveyQuestionnaireVo.setSURVEY_IDX(surveyIdx);
		userSurveyQuestionnaireVo.setLIMIT(99999);
		ModelMap QUESTIONNAIRE = userSurveyQuestionnaireService.getList(userSurveyQuestionnaireVo);

		
		UserSurveySelectVo userSurveySelectVo = new UserSurveySelectVo();
		userSurveySelectVo.setSURVEY_IDX(surveyIdx);
		userSurveySelectVo.setLIMIT(99999);
		ModelMap QUESTIONSELECT = userSurveySelectService.getList(userSurveySelectVo);
		

		UserSurveyAnswerVo userSurveyAnswerVo = new UserSurveyAnswerVo();
		userSurveyAnswerVo.setSURVEY_IDX(surveyIdx);
		userSurveyAnswerVo.setLIMIT(99999);
		userSurveyAnswerVo.setMEMBER_ID(SUtil.getUserId(request));
		ModelMap QUESTIONANSWER = userSurveyAnswerService.getList(userSurveyAnswerVo);
		
		
		model.put("QUESTIONNAIRE", QUESTIONNAIRE);
		model.put("QUESTION", QUESTION);
		model.put("QUESTIONSELECT", QUESTIONSELECT);
		model.put("QUESTIONANSWER", QUESTIONANSWER);
		
		
		model.put("beforeDomain", userSurveyVo);
		
		

		return new ModelAndView("user/mypage/survey/detail", "model", model);
	}
	
	
	
	


	@RequestMapping(value = "/user/mypage/{code}/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(
			@PathVariable("code") String code,
			HttpServletRequest request, HttpServletResponse response) 
	{
		
		ModelMap model = new ModelMap();
		
		model.put("CODE", code);
		
		return new ModelAndView("user/mypage/survey/insert", "model", model);
	}


	
	
	@RequestMapping(value = "/user/mypage/survey/{surveyIdx}/detail.do", method = RequestMethod.POST)
	public String detailPost(@PathVariable("surveyIdx") String surveyIdx,
			@ModelAttribute("UserSurveyAnswerVo") UserSurveyAnswerVo userSurveyAnswerVo, HttpServletRequest  request,  HttpServletResponse response) {
		
		List<UserSurveyAnswerVo> list = userSurveyAnswerVo.getList();
		
		userSurveyAnswerVo.setSURVEY_IDX(surveyIdx);
		userSurveyAnswerVo.setMEMBER_ID(SUtil.getUserId(request));
		userSurveyAnswerService.setDelete(userSurveyAnswerVo);
		
		
		for(int i = 0; i < list.size(); i++)
		{
			UserSurveyAnswerVo vo = list.get(i);
			vo.setMEMBER_ID(SUtil.getUserId(request));
		
			
			if(vo.getIDX().equals(""))
			{
				String ss[] = vo.getSURVEY_SELECT().split(",");
				for(int j = 0; j < ss.length; j++)
				{
					vo.setSURVEY_SELECT(ss[j]);
					userSurveyAnswerService.setInsert(vo);	
				}
				if(ss.length == 0)
				{
					userSurveyAnswerService.setInsert(vo);		
				}
				
				//추가
			}else
			{
				String ss[] = vo.getSURVEY_SELECT().split(",");
				for(int j = 0; j < ss.length; j++)
				{
					vo.setSURVEY_SELECT(ss[j]);
					userSurveyAnswerService.setUpdate(vo);	
				}
				
				if(ss.length == 0)
				{
					userSurveyAnswerService.setUpdate(vo);	
				}
				
				
				//업데이트
			}
		}
		
		//userSurveyVo.setREAD_CNT("0");
		//userSurveyVo.setMEMBER_ID(SUtil.getUserId(request));
		
		ModelMap model = new ModelMap();

		//userSurveyService.setInsert(userSurveyVo);		
		
		return "redirect:../list.do";
	}
	

	@RequestMapping(value = "/user/mypage/{code}/insert.do", method = RequestMethod.POST)
	public String insertPost(@PathVariable("code") String code,
			@ModelAttribute("UserSurveyVo") UserSurveyVo userSurveyVo, HttpServletRequest  request,  HttpServletResponse response) {
		
		userSurveyVo.setREAD_CNT("0");
		userSurveyVo.setMEMBER_ID(SUtil.getUserId(request));
		userSurveyVo.setCODE(code);
		ModelMap model = new ModelMap();

		userSurveyService.setInsert(userSurveyVo);		
		
		return "redirect:./list.do";
	}
	
	@RequestMapping(value = "/user/mypage/{code}/{surveyid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(
			@PathVariable("code") String code,
			@PathVariable("surveyid") String surveyid, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		model = userSurveyService.getView(surveyid);

		
		return new ModelAndView("user/mypage/survey/update", "model", model);
	}
	
	@RequestMapping(value = "/user/mypage/{code}/{surveyid}/update.do", method = RequestMethod.POST)
	public String updatePost(@PathVariable("code") String code,
			@PathVariable("surveyid") String surveyid, @ModelAttribute("UserSurveyVo") UserSurveyVo userSurveyVo,
			HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		userSurveyVo.setIDX(surveyid);
		
		boolean rtn = userSurveyService.setUpdate(userSurveyVo);

		return "redirect:../list.do";

	}

	@RequestMapping(value = "/user/mypage/{code}/{surveyid}/delete.do", method = RequestMethod.GET)
	public String deletePost(@PathVariable("code") String code,
			@PathVariable("surveyid") String surveyid, @ModelAttribute("UserSurveyVo") UserSurveyVo userSurveyVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String year = request.getParameter("year") != null ? request.getParameter("year") : "";
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		userSurveyVo.setIDX(surveyid);
		boolean rtn = userSurveyService.setDelete(userSurveyVo);
		return "redirect:../list.do";
	}

}
