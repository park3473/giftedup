package egovframework.kaist.admin.stats.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.kaist.admin.member.model.AdminMemberVo;
import egovframework.kaist.admin.member_re.model.AdminMemberReVo;
import egovframework.kaist.admin.stats.service.AdminStatsService;

@Controller
public class AdminStudentController {

	@Autowired
	AdminStatsService adminStatsService;

	private static final Logger Logger = LoggerFactory.getLogger(AdminStudentController.class);

	@RequestMapping(value = "/admin/stats/student/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("AdminMemberVo") AdminMemberVo adminMemberVo,
			HttpServletRequest request, HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
	
		model = adminStatsService.getListADDRESS_LOCAL("1");
		
		return new ModelAndView("admin/stats/student/list", "model", model);
	}
	
	@RequestMapping(value = "/admin/stats/student/schoolType.do", method = RequestMethod.GET)
	public ModelAndView schoolType(@ModelAttribute("AdminMemberVo") AdminMemberVo adminMemberVo,
			HttpServletRequest request, HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
	
		model = adminStatsService.getListSCHOOL_TYPE("1");
		
		return new ModelAndView("admin/stats/student/schoolType", "model", model);
	}
	
	@RequestMapping(value = "/admin/stats/student/sex.do", method = RequestMethod.GET)
	public ModelAndView sex(@ModelAttribute("AdminMemberVo") AdminMemberVo adminMemberVo,
			HttpServletRequest request, HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
	
		model = adminStatsService.getListSEX("1");
		
		return new ModelAndView("admin/stats/student/sex", "model", model);
	}
	
	@RequestMapping(value = "/admin/stats/student/school_group.do", method = RequestMethod.GET)
	public ModelAndView school_group(@ModelAttribute("AdminMemberVo") AdminMemberVo adminMemberVo,
			HttpServletRequest request, HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
	
		model = adminStatsService.getListSCHOOL_GROUP("1");
		
		return new ModelAndView("admin/stats/student/school_group", "model", model);
	}
	
}
