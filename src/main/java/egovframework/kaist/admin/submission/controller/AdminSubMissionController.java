package egovframework.kaist.admin.submission.controller;

import java.io.IOException;

import javax.enterprise.inject.Model;
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

import com.system.util.SUtil;

import egovframework.kaist.admin.award.model.AdminAwardVo;
import egovframework.kaist.admin.submission.model.AdminSubMissionDetailVo;
import egovframework.kaist.admin.submission.model.AdminSubMissionFileVo;
import egovframework.kaist.admin.submission.model.AdminSubMissionVo;
import egovframework.kaist.admin.submission.service.AdminSubMissionService;

@Controller
public class AdminSubMissionController {

	@Autowired
	AdminSubMissionService adminSubMissionService;
	
	@RequestMapping(value="/admin/submission/list.do" , method = RequestMethod.GET)
	public ModelAndView AdminSubMissionListGet(@ModelAttribute("AdminSubMissionVo")AdminSubMissionVo AdminSubMissionVo , HttpServletRequest request , HttpServletResponse response) {
		
		System.out.println("PAGE : " + AdminSubMissionVo.getPAGE());
		System.out.println("ITEM_COUNT : " + AdminSubMissionVo.getITEM_COUNT());
		
		String PAGE = request.getParameter("PAGE") != null ? request
				.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request
				.getParameter("ITEM_COUNT") : "10";
		
		AdminSubMissionVo.setPAGE(Integer.parseInt(PAGE));
		AdminSubMissionVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		int pagelimit = AdminSubMissionVo.getPAGE() * AdminSubMissionVo.getITEM_COUNT();
		
		AdminSubMissionVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		AdminSubMissionVo.setOFFSET(pagelimit);
		
		ModelMap model = new ModelMap();
		
		model = adminSubMissionService.getAllList(AdminSubMissionVo);
		
		model.put("before", model);
		
		return new ModelAndView("admin/submission/list" , "model" , model);
		
	}
	
	@RequestMapping(value="/admin/submission/insert.do" , method = RequestMethod.GET)
	public ModelAndView AdminSubMissionInsertGet(@ModelAttribute("AdminSubMissionVo")AdminSubMissionVo AdminSubMissionVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model.put("before", model);
		
		return new ModelAndView("admin/submission/insert" , "model" , model);
		
	}
	
	@RequestMapping(value="/admin/submission/insert.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public String AdminSubMissionInsertPost(@ModelAttribute("AdminSubMissionVo")AdminSubMissionVo AdminSubMissionVo , HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		String result = "";
		
		result = adminSubMissionService.setAdminSubMissionDataAjaxInsert(AdminSubMissionVo);
		
		return result;
		
	}
	
	@RequestMapping(value="/admin/submission/update.do" , method = RequestMethod.GET)
	public ModelAndView AdminSubMissionUpdateGet(@ModelAttribute("AdminSubMissionVo")AdminSubMissionVo AdminSubMissionVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = adminSubMissionService.getSubMissionDataView(AdminSubMissionVo);
		
		model.put("before", model);
		
		return new ModelAndView("admin/submission/update" , "model" , model);
		
	}
	
	@RequestMapping(value="/admin/submission/update.do" , method = RequestMethod.POST)
	public void AdminSubMissionUpdatePost(@ModelAttribute("AdminSubMissionVo")AdminSubMissionVo AdminSubMissionVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminSubMissionService.setAdminSubMissionData(AdminSubMissionVo , "update");
		
	}
	
	@RequestMapping(value="/admin/submission/status.do" , method = RequestMethod.POST)
	public void AdminSubMissionStatusPost(@ModelAttribute("AdminSubMissionVo")AdminSubMissionVo AdminSubMissionVo , HttpServletRequest request , HttpServletResponse response) {
	
		//합격 여부 확인
		adminSubMissionService.setAdminSubMissionData(AdminSubMissionVo , "update");
		
	}
	
	@RequestMapping(value="/admin/submission/delete.do" , method = RequestMethod.POST)
	public void AdminSubMissionDeletePost(@ModelAttribute("AdminSubMissionVo")AdminSubMissionVo AdminSubMissionVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminSubMissionService.setAdminSubMissionData(AdminSubMissionVo , "delete");
		
		AdminSubMissionDetailVo AdminSubMissionDetailVo = new AdminSubMissionDetailVo();
		
		AdminSubMissionDetailVo.setSubmission_idx(AdminSubMissionVo.getIdx());
		
		adminSubMissionService.setAdminSubMissionDetailData(AdminSubMissionDetailVo , "deleteAll");
		
	}
	
	@RequestMapping(value="/admin/submission/file/insert.do" , method = RequestMethod.POST)
	public void AdminSubMissionFileInsert(@ModelAttribute("AdminSubMissionFileVo")AdminSubMissionFileVo AdminSubMissionFileVo , MultipartHttpServletRequest request , HttpServletResponse response) {
		
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/submission/"+AdminSubMissionFileVo.getSubmission_idx()+"/file/";
		
		String filename = SUtil.setFileUpload(request, drv);
		
		AdminSubMissionFileVo.setFile(filename);
		
		adminSubMissionService.setAdminSubMissionFileData(AdminSubMissionFileVo , "insert");
		
	}
	
	@RequestMapping(value="/admin/submission/detail/insert.do" , method = RequestMethod.POST)
	public void AdminSubMissionDetailInsert(@ModelAttribute("AdminSubMissionDetailVo")AdminSubMissionDetailVo AdminSubMissionDetailVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminSubMissionService.setAdminSubMissionDetailData(AdminSubMissionDetailVo , "insert");
		
	}
	
	@RequestMapping(value="/admin/submission/detail/update.do" , method = RequestMethod.POST)
	public void AdminSubMissionDetailUpdate(@ModelAttribute("AdminSubMissionDetailVo")AdminSubMissionDetailVo AdminSubMissionDetailVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminSubMissionService.setAdminSubMissionDetailData(AdminSubMissionDetailVo , "update");
		
	}
	
	@RequestMapping(value="/admin/submission/detail/delete.do" , method = RequestMethod.POST)
	public void AdminSubMissionDetailDelete(@ModelAttribute("AdminSubMissionDetailVo")AdminSubMissionDetailVo AdminSubMissionDetailVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminSubMissionService.setAdminSubMissionDetailData(AdminSubMissionDetailVo , "delete");
		
	}
	
	
}
