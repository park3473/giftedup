package egovframework.kaist.user.survey_select.controller;

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


import egovframework.kaist.user.survey_select.model.UserSurveySelectVo;
import egovframework.kaist.user.survey_select.service.UserSurveySelectService;

@Controller
public class UserSurveySelectController {

	@Autowired
	UserSurveySelectService usersurveySelectService;



	private static final Logger Logger = LoggerFactory.getLogger(UserSurveySelectController.class);

	@RequestMapping(value = "/user/survey_select/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("UsersurveySelectVo") UserSurveySelectVo usersurveySelectVo,
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
		

		usersurveySelectVo.setPAGE(Integer.parseInt(PAGE));
		usersurveySelectVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = usersurveySelectVo.getPAGE() * usersurveySelectVo.getITEM_COUNT();
		
		usersurveySelectVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		usersurveySelectVo.setOFFSET(pagelimit);
		
		
		model = usersurveySelectService.getList(usersurveySelectVo);
		
		model.put("SEARCH_TYPE", usersurveySelectVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", usersurveySelectVo.getSEARCH_TEXT());
		
		
		model.put("beforeDomain", usersurveySelectVo);
		

		return new ModelAndView("user/survey_select/list", "model", model);
	}

	@RequestMapping(value = "/user/survey_select/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(HttpServletRequest request, HttpServletResponse response) 
	
	
	{

		ModelMap model = new ModelMap();
		
		String TYPE = (String) (request.getParameter("TYPE") != null ? request.getParameter("TYPE") : "1");
		
		if(TYPE == null || TYPE.equals(""))
		{
			TYPE = "1";
		}
		
		
		model.put("TYPE", TYPE);
		
		return new ModelAndView("user/survey_select/insert", "model", model);
	}

	@RequestMapping(value = "/user/survey_select/insert.do", method = RequestMethod.POST)
	public String insertPost(@ModelAttribute("UsersurveySelectVo") UserSurveySelectVo usersurveySelectVo, HttpServletRequest  request,  HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		usersurveySelectService.setInsert(usersurveySelectVo);		
		
		return "redirect:./list.do";
	}
	
	@RequestMapping(value = "/user/survey_select/{survey_selectid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("survey_selectid") String survey_selectid, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		model = usersurveySelectService.getView(survey_selectid);

		return new ModelAndView("user/survey_select/update", "model", model);
	}
	
	@RequestMapping(value = "/user/survey_select/{survey_selectid}/update.do", method = RequestMethod.POST)
	public String updatePost(@PathVariable("survey_selectid") String survey_selectid, @ModelAttribute("UsersurveySelectVo") UserSurveySelectVo usersurveySelectVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		usersurveySelectVo.setIDX(survey_selectid);
		
		boolean rtn = usersurveySelectService.setUpdate(usersurveySelectVo);

		return "redirect:../list.do";

	}

	@RequestMapping(value = "/user/survey_select/{survey_selectid}/delete.do", method = RequestMethod.GET)
	public String deletePost(@PathVariable("survey_selectid") String survey_selectid, @ModelAttribute("UsersurveySelectVo") UserSurveySelectVo usersurveySelectVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String year = request.getParameter("year") != null ? request.getParameter("year") : "";
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		usersurveySelectVo.setIDX(survey_selectid);
		boolean rtn = usersurveySelectService.setDelete(usersurveySelectVo);
		return "redirect:../list.do";
	}

}
