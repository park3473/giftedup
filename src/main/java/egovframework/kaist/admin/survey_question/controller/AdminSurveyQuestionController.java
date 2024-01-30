package egovframework.kaist.admin.survey_question.controller;

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

import egovframework.kaist.admin.buseo.service.AdminBuseoService;
import egovframework.kaist.admin.survey_question.model.AdminSurveyQuestionVo;
import egovframework.kaist.admin.survey_question.service.AdminSurveyQuestionService;

@Controller
public class AdminSurveyQuestionController {

	@Autowired
	AdminSurveyQuestionService adminsurveyQuestionService;

	@Autowired
	AdminBuseoService adminBuseoService;

	private static final Logger Logger = LoggerFactory.getLogger(AdminSurveyQuestionController.class);

	@RequestMapping(value = "/admin/survey_question/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("AdminsurveyQuestionVo") AdminSurveyQuestionVo adminsurveyQuestionVo,
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
		

		adminsurveyQuestionVo.setPAGE(Integer.parseInt(PAGE));
		adminsurveyQuestionVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = adminsurveyQuestionVo.getPAGE() * adminsurveyQuestionVo.getITEM_COUNT();
		
		adminsurveyQuestionVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		adminsurveyQuestionVo.setOFFSET(pagelimit);
		
		
		model = adminsurveyQuestionService.getList(adminsurveyQuestionVo);
		
		model.put("SEARCH_TYPE", adminsurveyQuestionVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", adminsurveyQuestionVo.getSEARCH_TEXT());
		
		
		model.put("beforeDomain", adminsurveyQuestionVo);
		

		return new ModelAndView("admin/survey_question/list", "model", model);
	}

	@RequestMapping(value = "/admin/survey_question/insert.do", method = RequestMethod.GET)
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
		
		return new ModelAndView("admin/survey_question/insert", "model", model);
	}

	@RequestMapping(value = "/admin/survey_question/insert.do", method = RequestMethod.POST)
	public String insertPost(@ModelAttribute("AdminsurveyQuestionVo") AdminSurveyQuestionVo adminsurveyQuestionVo, HttpServletRequest  request,  HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		adminsurveyQuestionService.setInsert(adminsurveyQuestionVo);		
		
		return "redirect:./list.do";
	}
	
	@RequestMapping(value = "/admin/survey_question/{survey_questionid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("survey_questionid") String survey_questionid, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		model = adminsurveyQuestionService.getView(survey_questionid);

		model.put("buseo", adminBuseoService.getListAll());
		return new ModelAndView("admin/survey_question/update", "model", model);
	}
	
	@RequestMapping(value = "/admin/survey_question/{survey_questionid}/update.do", method = RequestMethod.POST)
	public String updatePost(@PathVariable("survey_questionid") int survey_questionid, @ModelAttribute("AdminsurveyQuestionVo") AdminSurveyQuestionVo adminsurveyQuestionVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		adminsurveyQuestionVo.setIDX(survey_questionid);
		
		boolean rtn = adminsurveyQuestionService.setUpdate(adminsurveyQuestionVo);

		return "redirect:../list.do";

	}

	@RequestMapping(value = "/admin/survey_question/{survey_questionid}/delete.do", method = RequestMethod.GET)
	public String deletePost(@PathVariable("survey_questionid") int survey_questionid, @ModelAttribute("AdminsurveyQuestionVo") AdminSurveyQuestionVo adminsurveyQuestionVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String year = request.getParameter("year") != null ? request.getParameter("year") : "";
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		adminsurveyQuestionVo.setIDX(survey_questionid);
		boolean rtn = adminsurveyQuestionService.setDelete(adminsurveyQuestionVo);
		return "redirect:../list.do";
	}

}
