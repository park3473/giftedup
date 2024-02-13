package egovframework.kaist.user.submission.controller;

import java.io.IOException;

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

import egovframework.kaist.admin.submission.model.AdminSubMissionDetailVo;
import egovframework.kaist.admin.submission.model.AdminSubMissionFileVo;
import egovframework.kaist.admin.submission.model.AdminSubMissionVo;
import egovframework.kaist.user.submission.model.UserSubMissionDetailVo;
import egovframework.kaist.user.submission.model.UserSubMissionFileVo;
import egovframework.kaist.user.submission.model.UserSubMissionVo;
import egovframework.kaist.user.submission.service.UserSubMissionService;

@Controller
public class UserSubMissionContoller {

	@Autowired
	UserSubMissionService userSubMissionService;
	
	@RequestMapping(value="/user/submission/list.do" , method = RequestMethod.GET)
	public ModelAndView UserSubMissionListGet(@ModelAttribute("UserSubMissionVo")UserSubMissionVo UserSubMissionVo , HttpServletRequest request , HttpServletResponse response) {
		
		System.out.println("PAGE : " + UserSubMissionVo.getPAGE());
		System.out.println("ITEM_COUNT : " + UserSubMissionVo.getITEM_COUNT());
		
		String PAGE = request.getParameter("PAGE") != null ? request
				.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request
				.getParameter("ITEM_COUNT") : "10";
		
		UserSubMissionVo.setPAGE(Integer.parseInt(PAGE));
		UserSubMissionVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		int pagelimit = UserSubMissionVo.getPAGE() * UserSubMissionVo.getITEM_COUNT();
		
		UserSubMissionVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		UserSubMissionVo.setOFFSET(pagelimit);
		
		ModelMap model = new ModelMap();
		
		model = userSubMissionService.getAllList(UserSubMissionVo);
		
		model.put("before", model);
		
		return new ModelAndView("user/submission/list" , "model" , model);
		
	}
	
	@RequestMapping(value="/user/submission/insert.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public String UserSubMissionInsertPost(@ModelAttribute("UserSubMissionVo")UserSubMissionVo UserSubMissionVo , HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		String result = "";
		
		result = userSubMissionService.setUserSubMissionDataAjaxInsert(UserSubMissionVo);
		
		return result;
		
	}
	
	@RequestMapping(value="/user/submission/update.do" , method = RequestMethod.GET)
	public ModelAndView UserSubMissionUpdateGet(@ModelAttribute("UserSubMissionVo")UserSubMissionVo UserSubMissionVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = userSubMissionService.getSubMissionDataView(UserSubMissionVo);
		
		model.put("before", model);
		
		return new ModelAndView("user/submission/update" , "model" , model);
		
	}
	
	@RequestMapping(value="/user/submission/update.do" , method = RequestMethod.POST)
	public void UserSubMissionUpdatePost(@ModelAttribute("UserSubMissionVo")UserSubMissionVo UserSubMissionVo , HttpServletRequest request , HttpServletResponse response) {
		
		userSubMissionService.setUserSubMissionData(UserSubMissionVo , "update");
		
	}
	
	@RequestMapping(value="/user/submission/delete.do" , method = RequestMethod.POST)
	public void UserSubMissionDeletePost(@ModelAttribute("UserSubMissionVo")UserSubMissionVo UserSubMissionVo , HttpServletRequest request , HttpServletResponse response) {
		
		userSubMissionService.setUserSubMissionData(UserSubMissionVo , "delete");
		
		UserSubMissionDetailVo UserSubMissionDetailVo = new UserSubMissionDetailVo();
		
		UserSubMissionDetailVo.setSubmission_idx(UserSubMissionVo.getIdx());
		
		userSubMissionService.setUserSubMissionDetailData(UserSubMissionDetailVo , "deleteAll");
		
	}
	
	@RequestMapping(value="/user/submission/file/insert.do" , method = RequestMethod.POST)
	@ResponseBody
	public void UserSubMissionFileInsert(@ModelAttribute("UserSubMissionFileVo")UserSubMissionFileVo UserSubMissionFileVo , MultipartHttpServletRequest request , HttpServletResponse response) throws Exception {
		
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/submission/";
		
		String filename = SUtil.setFileUpload(request, drv);
		
		UserSubMissionFileVo.setFile(filename);
		
		System.out.println("ss : " + UserSubMissionFileVo.getFile());
		
		userSubMissionService.setUserSubMissionFileData(UserSubMissionFileVo , "insert");
		
	}
	
	@RequestMapping(value="/user/submission/detail/insert.do" , method = RequestMethod.POST)
	public void UserSubMissionDetailInsert(@ModelAttribute("UserSubMissionDetailVo")UserSubMissionDetailVo UserSubMissionDetailVo , HttpServletRequest request , HttpServletResponse response) {
		
		userSubMissionService.setUserSubMissionDetailData(UserSubMissionDetailVo , "insert");
		
	}
	
	@RequestMapping(value="/user/submission/detail/update.do" , method = RequestMethod.POST)
	public void UserSubMissionDetailUpdate(@ModelAttribute("UserSubMissionDetailVo")UserSubMissionDetailVo UserSubMissionDetailVo , HttpServletRequest request , HttpServletResponse response) {
		
		userSubMissionService.setUserSubMissionDetailData(UserSubMissionDetailVo , "update");
		
	}
	
	@RequestMapping(value="/user/submission/detail/delete.do" , method = RequestMethod.POST)
	public void UserSubMissionDetailDelete(@ModelAttribute("UserSubMissionDetailVo")UserSubMissionDetailVo UserSubMissionDetailVo , HttpServletRequest request , HttpServletResponse response) {
		
		userSubMissionService.setUserSubMissionDetailData(UserSubMissionDetailVo , "delete");
		
	}
	
	
}
