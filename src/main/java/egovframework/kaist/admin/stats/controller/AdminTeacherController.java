package egovframework.kaist.admin.stats.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.system.util.SUtil;

import egovframework.kaist.admin.buseo.service.AdminBuseoService;
import egovframework.kaist.admin.member.model.AdminMemberVo;
import egovframework.kaist.admin.member.service.AdminMemberService;
import egovframework.kaist.admin.stats.service.AdminStatsService;

@Controller
public class AdminTeacherController {

	@Autowired
	AdminStatsService adminStatsService;


	private static final Logger Logger = LoggerFactory.getLogger(AdminTeacherController.class);

	

	@RequestMapping(value = "/admin/stats/teacher/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("AdminMemberVo") AdminMemberVo adminMemberVo,
			HttpServletRequest request, HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
	
		model = adminStatsService.getListADDRESS_LOCAL("2");
		
		return new ModelAndView("admin/stats/teacher/list", "model", model);
	}
	
	@RequestMapping(value = "/admin/stats/teacher/schoolType.do", method = RequestMethod.GET)
	public ModelAndView schoolType(@ModelAttribute("AdminMemberVo") AdminMemberVo adminMemberVo,
			HttpServletRequest request, HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
	
		model = adminStatsService.getListSCHOOL_TYPE("2");
		
		return new ModelAndView("admin/stats/teacher/schoolType", "model", model);
	}
	
	@RequestMapping(value = "/admin/stats/teacher/sex.do", method = RequestMethod.GET)
	public ModelAndView sex(@ModelAttribute("AdminMemberVo") AdminMemberVo adminMemberVo,
			HttpServletRequest request, HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
	
		model = adminStatsService.getListSEX("2");
		
		return new ModelAndView("admin/stats/teacher/sex", "model", model);
	}
	
	@RequestMapping(value = "/admin/stats/teacher/school_group.do", method = RequestMethod.GET)
	public ModelAndView school_group(@ModelAttribute("AdminMemberVo") AdminMemberVo adminMemberVo,
			HttpServletRequest request, HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
	
		model = adminStatsService.getListSCHOOL_GROUP("2");
		
		return new ModelAndView("admin/stats/student/school_group", "model", model);
	}
}
