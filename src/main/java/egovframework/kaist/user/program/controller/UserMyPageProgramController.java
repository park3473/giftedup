package egovframework.kaist.user.program.controller;

import java.io.IOException;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.system.util.SUtil;

import egovframework.kaist.user.program.model.UserProgramVo;
import egovframework.kaist.user.member.model.UserMemberVo;
import egovframework.kaist.user.program.model.UserProgramVo;
import egovframework.kaist.user.program.service.UserProgramService;
import egovframework.kaist.user.program_apply.service.UserProgramApplyService;

@Controller
public class UserMyPageProgramController {

	@Autowired
	UserProgramService userProgramService;

	@Autowired
	UserProgramApplyService userProgramApplyService;

	private static final Logger Logger = LoggerFactory.getLogger(UserMyPageProgramController.class);

	
	
	@RequestMapping(value = "/user/mypage/program/{programid}/list.do", method = RequestMethod.GET)
	public ModelAndView list(@PathVariable("programid") String programid, 
			@ModelAttribute("UserProgramVo") UserProgramVo userProgramVo,
			HttpServletRequest request, 
			HttpServletResponse response) {

		
		if(programid.equals("participation"))
		{
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
			
			
			userProgramVo.setPAGE(Integer.parseInt(PAGE));
			userProgramVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
			
			
			ModelMap model = new ModelMap();
		
			int pagelimit = userProgramVo.getPAGE() * userProgramVo.getITEM_COUNT();
			
			userProgramVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
			userProgramVo.setOFFSET(pagelimit);
		
			model = userProgramApplyService.getList(userProgramVo);
			
			model.put("SEARCH_TYPE", userProgramVo.getSEARCH_TYPE());
			model.put("SEARCH_TEXT", userProgramVo.getSEARCH_TEXT());
			
		
			if(!userProgramVo.getYEAR().equals(""))
			{
				
				UserProgramVo userProgramVo2 = new UserProgramVo();
				userProgramVo.setLIMIT(100000);
				userProgramVo.setOFFSET(0);
				userProgramVo.setYEAR(userProgramVo.getYEAR());
				model.put("PROGRAM", userProgramService.getList(userProgramVo));
				
							
			}
			model.put("TYPE", programid);
			
			model.put("beforeDomain", userProgramVo);

			
			model.put("YEARLIST", userProgramService.getListGroupByYear());
			return new ModelAndView("user/mypage/program/participation/list", "model", model);
		}else
		{
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
			
			userProgramVo.setTYPE(programid);
			userProgramVo.setPAGE(Integer.parseInt(PAGE));
			userProgramVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
			
			
			ModelMap model = new ModelMap();
		
			int pagelimit = userProgramVo.getPAGE() * userProgramVo.getITEM_COUNT();
			
			userProgramVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
			userProgramVo.setOFFSET(pagelimit);
		
			model = userProgramApplyService.getList(userProgramVo);
			
			model.put("SEARCH_TYPE", userProgramVo.getSEARCH_TYPE());
			model.put("SEARCH_TEXT", userProgramVo.getSEARCH_TEXT());
			
		
			if(!userProgramVo.getYEAR().equals(""))
			{
				
				UserProgramVo userProgramVo2 = new UserProgramVo();
				userProgramVo.setLIMIT(100000);
				userProgramVo.setOFFSET(0);
				userProgramVo.setYEAR(userProgramVo.getYEAR());
				model.put("PROGRAM", userProgramService.getList(userProgramVo));
				
							
			}
			model.put("TYPE", programid);
			
			model.put("beforeDomain", userProgramVo);

			
			model.put("YEARLIST", userProgramService.getListGroupByYear());
			return new ModelAndView("user/mypage/program2/list", "model", model);
		}
		
		
	}
	@RequestMapping(value = "/user/mypage/program/list.do", method = RequestMethod.GET)
	public ModelAndView list(
			@ModelAttribute("UserProgramVo") UserProgramVo userProgramVo,
			HttpServletRequest request, 
			HttpServletResponse response) {


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
			
			
			userProgramVo.setPAGE(Integer.parseInt(PAGE));
			userProgramVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
			
			
			ModelMap model = new ModelMap();
		
			int pagelimit = userProgramVo.getPAGE() * userProgramVo.getITEM_COUNT();
			
			userProgramVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
			userProgramVo.setOFFSET(pagelimit);
		
			model = userProgramService.getList(userProgramVo);
			
			model.put("SEARCH_TYPE", userProgramVo.getSEARCH_TYPE());
			model.put("SEARCH_TEXT", userProgramVo.getSEARCH_TEXT());
			
			model.put("beforeDomain", userProgramVo);

			model.put("YEARLIST", userProgramService.getListGroupByYear());
			return new ModelAndView("user/mypage/program/list", "model", model);

		
	}

	@RequestMapping(value = "/user/mypage/program/{programid}/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(@PathVariable("programid") String programid,
			HttpServletRequest request, HttpServletResponse response) 
	{

		ModelMap model = new ModelMap();
		model.put("TYPE", programid);
		
		return new ModelAndView("user/mypage/program/insert", "model", model);
	}

	@RequestMapping(value = "/user/mypage/program/{programid}/insert.do", method = RequestMethod.POST)
	public String insertPost(@PathVariable("programid") String programid, 
			@ModelAttribute("UserProgramVo") UserProgramVo userProgramVo,
			MultipartHttpServletRequest  request,  HttpServletResponse response) {
		

		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/program/";
		 
		String filename = SUtil.setFileUpload(request, drv);
		
		String files[] = filename.split(",");
		String saveFileName = "";
		for(int i = 0; i < files.length; i++)
		{
			String ff = files[i];
			if(ff.indexOf(userProgramVo.getWORKBOOK()) > -1)
			{
				userProgramVo.setWORKBOOK(ff);
			}else {
				saveFileName += ff + ",";
			}
		}
		userProgramVo.setFILES(saveFileName);
		
		ModelMap model = new ModelMap();

		userProgramService.setInsert(userProgramVo);		
		
		return "redirect:./list.do";
	}
	
	@RequestMapping(value = "/user/mypage/program/{programid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("programid") String programid,
			HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		model = userProgramService.getView2(programid);

		return new ModelAndView("user/mypage/program/update", "model", model);
	}
	
	@RequestMapping(value = "/user/mypage/program/update.do", method = RequestMethod.POST)
	public void updatePost(@ModelAttribute("UserProgramVo") UserProgramVo userProgramVo,
			MultipartHttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		boolean rtn = userProgramService.setUpdate(userProgramVo);

		if (rtn) {
			try {
				response.getWriter().println("true");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				response.getWriter().println("false");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	@RequestMapping(value = "/user/mypage/program/delete.do", method = RequestMethod.POST)
	public void deletePost(@ModelAttribute("UserProgramVo") UserProgramVo userProgramVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String year = request.getParameter("year") != null ? request.getParameter("year") : "";
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		boolean rtn = userProgramService.setDelete(userProgramVo);
		if (rtn) {
			try {
				response.getWriter().println("true");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {

			try {
				response.getWriter().println("false");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	@RequestMapping(value = "/user/mypage/program/{programid}/getProgramList.do", method = RequestMethod.GET)
	public ModelAndView getProgramList(@PathVariable("programid") String programid,
			HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		String YEAR = request.getParameter("YEAR") != null ? request
				.getParameter("YEAR") : SUtil.getNowDate().substring(0, 4);
		
		UserProgramVo userProgramVo = new UserProgramVo();
		userProgramVo.setLIMIT(100000);
		userProgramVo.setOFFSET(0);
		userProgramVo.setYEAR(YEAR);
		model = userProgramService.getList(userProgramVo);

		
		
		return new ModelAndView("user/mypage/program/selectProgramBox", "model", model);
	}
	


	@RequestMapping(value = "/user/mypage/program/{programid}/deleteArr.do", method = RequestMethod.POST)
	public void deleteArrPost(@PathVariable("programid") String programid, @ModelAttribute("UserProgramVo") UserProgramVo userProgramVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		String idx = userProgramVo.getIDX();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				UserProgramVo userProgramVo2 = new UserProgramVo();
				userProgramVo2.setIDX(arrIdx[i]);
				userProgramService.setDelete(userProgramVo2);		
			}
		}
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
}
