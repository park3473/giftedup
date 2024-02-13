package egovframework.kaist.admin.award.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.kaist.admin.award.model.AdminAwardRequireVo;
import egovframework.kaist.admin.award.model.AdminAwardVo;
import egovframework.kaist.admin.award.service.AdminAwardService;

@Controller
public class AdminAwardController {

	@Autowired
	AdminAwardService adminAwardService;
	
	@RequestMapping(value="/admin/award/list.do" , method = RequestMethod.GET)
	public ModelAndView AdminAwardListGet(@ModelAttribute("AdminAwardVo")AdminAwardVo AdminAwardVo , HttpServletRequest request , HttpServletResponse response) {
		
		System.out.println("PAGE : " + AdminAwardVo.getPAGE());
		System.out.println("ITEM_COUNT : " + AdminAwardVo.getITEM_COUNT());
		
		String PAGE = request.getParameter("PAGE") != null ? request
				.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request
				.getParameter("ITEM_COUNT") : "10";
		
		AdminAwardVo.setPAGE(Integer.parseInt(PAGE));
		AdminAwardVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		int pagelimit = AdminAwardVo.getPAGE() * AdminAwardVo.getITEM_COUNT();
		
		AdminAwardVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		AdminAwardVo.setOFFSET(pagelimit);
		
		ModelMap model = new ModelMap();
		
		model = adminAwardService.getAllList(AdminAwardVo);
		
		model.put("before", model);
		
		return new ModelAndView("admin/award/list" , "model" , model);
		
	}
	
	@RequestMapping(value="/admin/award/insert.do" , method = RequestMethod.GET)
	public ModelAndView AdminAwardInsertGet(@ModelAttribute("AdminAwardVo")AdminAwardVo AdminAwardVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model.put("before", AdminAwardVo);
		
		return new ModelAndView("admin/award/insert" , "model" , model);
		
	}
	
	@RequestMapping(value="/admin/award/insert.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public String AdminAwardInsertPost(@ModelAttribute("AdminAwardVo")AdminAwardVo AdminAwardVo , HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		String result = "";
		
		result = adminAwardService.setAdminAwardDataAjaxInsert(AdminAwardVo);
		
		return result;
		
	}
	
	@RequestMapping(value="/admin/award/update.do" , method = RequestMethod.GET)
	public ModelAndView AdminAwardUpdateGet(@ModelAttribute("AdminAwardVo")AdminAwardVo AdminAwardVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = adminAwardService.getAwardDataView(AdminAwardVo);
		
		AdminAwardRequireVo adminAwardRequireVo = new AdminAwardRequireVo();
		
		adminAwardRequireVo.setAward_idx(AdminAwardVo.getIdx());
		
		List<?> require = adminAwardService.getRequireAllList(adminAwardRequireVo);
		
		model.put("require", require);
		
		model.put("before", AdminAwardVo);
		
		return new ModelAndView("admin/award/update" , "model" , model);
		
	}
	
	@RequestMapping(value="/admin/award/update.do" , method = RequestMethod.POST)
	public void AdminAwardUpdatePost(@ModelAttribute("AdminAwardVo")AdminAwardVo AdminAwardVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminAwardService.setAdminAwardData(AdminAwardVo , "update");
		
	}
	
	@RequestMapping(value="/admin/award/delete.do" , method = RequestMethod.POST)
	public void AdminAwardDeletePost(@ModelAttribute("AdminAwardVo")AdminAwardVo AdminAwardVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminAwardService.setAdminAwardData(AdminAwardVo , "delete");
		
	}
	
	@RequestMapping(value="/admin/award/require/list.do" , method = RequestMethod.POST)
	public ModelAndView AdminAwardRequireListPost(@ModelAttribute("AdminAwardRequireVo")AdminAwardRequireVo AdminAwardRequireVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		List<?> require = adminAwardService.getRequireAllList(AdminAwardRequireVo);
		
		model.put("require", require);
		
		return new ModelAndView("admin/award/require" , "model" , model);
		
	}
	
	@RequestMapping(value="/admin/award/require/insert.do" , method = RequestMethod.POST)
	public void AdminAwardRequireInsertPost(@ModelAttribute("AdminAwardRequireVo")AdminAwardRequireVo AdminAwardRequireVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminAwardService.setAdminAwardRequireData(AdminAwardRequireVo , "insert");
		
	}
	
	@RequestMapping(value="/admin/award/require/update.do" , method = RequestMethod.POST)
	public void AdminAwardRequireUpdatePost(@ModelAttribute("AdminAwardRequireVo")AdminAwardRequireVo AdminAwardRequireVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminAwardService.setAdminAwardRequireData(AdminAwardRequireVo , "update");
		
	}
	
	@RequestMapping(value="/admin/award/require/delete.do" , method = RequestMethod.POST)
	public void AdminAwardRequireDeletePost(@ModelAttribute("AdminAwardRequireVo")AdminAwardRequireVo AdminAwardRequireVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminAwardService.setAdminAwardRequireData(AdminAwardRequireVo , "delete");
		
	}
	
	
}
