package egovframework.kaist.user.portfolio.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import egovframework.kaist.admin.member.model.AdminMemberVo;
import egovframework.kaist.user.member.model.UserMemberVo;
import egovframework.kaist.user.member.service.UserMemberService;
import egovframework.kaist.user.portfolio.model.UserPortfolioVo;
import egovframework.kaist.user.portfolio.service.UserPortfolioService;
import egovframework.kaist.user.program.model.UserProgramVo;
import egovframework.kaist.user.program.service.UserProgramService;

@Controller
public class UserPortfolioController {

	@Autowired
	UserPortfolioService userPortfolioService;
	
	@Autowired
	UserProgramService userProgramService;

	@Autowired
	UserMemberService userMemberService;

	private static final Logger Logger = LoggerFactory.getLogger(UserPortfolioController.class);

	@RequestMapping(value = "/user/portfolio/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("UserMemberVo") UserMemberVo userMemberVo,
			HttpServletRequest request, HttpServletResponse response) {

		String PAGE = request.getParameter("PAGE") != null ? request.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request.getParameter("ITEM_COUNT") : "10";
			
		if(PAGE == null) {
			PAGE = "0";
		}
		if(ITEM_COUNT == null) {
			ITEM_COUNT = "10";
		}
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("ssion_user_id");		

		userMemberVo.setPAGE(Integer.parseInt(PAGE));
		userMemberVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		ModelMap model = new ModelMap();
	
		int pagelimit = userMemberVo.getPAGE() * userMemberVo.getITEM_COUNT();
		
		userMemberVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		userMemberVo.setOFFSET(pagelimit);
		
		//매칭된 학생리스트 가져오기
		userMemberVo.setTYPE("1");
		userMemberVo.setMEMBER_ID(member_id);
		
		model = userMemberService.getProfessorList(userMemberVo);
		
		model.put("SEARCH_TYPE", userMemberVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", userMemberVo.getSEARCH_TEXT());

		model.put("beforeDomain", userMemberVo);
		model.put("YEARLIST", userProgramService.getListGroupByYear());

		return new ModelAndView("user/portfolio/list", "model", model);
	}

	@RequestMapping(value = "/user/portfolio/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(HttpServletRequest request, HttpServletResponse response) {

		ModelMap model = new ModelMap();
		
		String TYPE = (String) (request.getParameter("TYPE") != null ? request.getParameter("TYPE") : "1");
		
		if(TYPE == null || TYPE.equals("")){
			TYPE = "1";
		}
		
		model.put("TYPE", TYPE);
		
		return new ModelAndView("user/portfolio/insert", "model", model);
	}

	@RequestMapping(value = "/user/portfolio/insert.do", method = RequestMethod.POST)
	public void insertPost(@ModelAttribute("UserPortfolioVo") UserPortfolioVo userPortfolioVo, MultipartHttpServletRequest  request,  HttpServletResponse response) {
		
		ModelMap model = new ModelMap();

		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/portfolio/";
		 
		String filename = SUtil.setFileUpload(request, drv);
		
		if(filename.length() > 1){
			userPortfolioVo.setFILES(filename);
		} else {
			userPortfolioVo.setFILES("");
		}
		userPortfolioService.setInsert(userPortfolioVo);		
		
		try {
			response.getWriter().print("true");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/user/portfolio/{portfolioid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@ModelAttribute("UserPortfolioVo") UserPortfolioVo userPortfolioVo, @PathVariable("portfolioid") String portfolioid, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		
		
		model = userPortfolioService.getView(userPortfolioVo);

		
		return new ModelAndView("user/portfolio/update", "model", model);
	}
	
	@RequestMapping(value = "/user/portfolio/update.do", method = RequestMethod.POST)
	public void updatePost(@ModelAttribute("UserPortfolioVo") UserPortfolioVo userPortfolioVo, MultipartHttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/portfolio/";
		 
		String filename = SUtil.setFileUpload(request, drv);
		
		if(filename.length()>1)
		{
			userPortfolioVo.setFILES(filename);
		}else
		{
			userPortfolioVo.setFILES("");
		}
			
		
		
		boolean rtn = userPortfolioService.setUpdate(userPortfolioVo);

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

	@RequestMapping(value = "/user/portfolio/delete.do", method = RequestMethod.POST)
	public void deletePost(@ModelAttribute("UserPortfolioVo") UserPortfolioVo userPortfolioVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String year = request.getParameter("year") != null ? request.getParameter("year") : "";
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		boolean rtn = userPortfolioService.setDelete(userPortfolioVo);
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
	
	@RequestMapping(value = "/user/portfolio/getProgramList.do", method = RequestMethod.GET)
	public ModelAndView getProgramList(
			HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("ssion_user_id");

		String YEAR = request.getParameter("YEAR") != null ? request
				.getParameter("YEAR") : SUtil.getNowDate().substring(0, 4);
		
		UserProgramVo userProgramVo = new UserProgramVo();
		userProgramVo.setMEMBER_ID(member_id);
		userProgramVo.setLIMIT(100000);
		userProgramVo.setOFFSET(0);
		userProgramVo.setYEAR(YEAR);
		model = userProgramService.getList(userProgramVo);
		
		return new ModelAndView("user/program/selectProgramBox", "model", model);
	}
	
}
