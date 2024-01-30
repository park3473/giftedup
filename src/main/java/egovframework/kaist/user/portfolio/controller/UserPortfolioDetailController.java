package egovframework.kaist.user.portfolio.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.system.util.SUtil;

import egovframework.kaist.user.member.model.UserMemberVo;
import egovframework.kaist.user.member.service.UserMemberService;
import egovframework.kaist.user.portfolio.model.UserPortfolioVo;
import egovframework.kaist.user.portfolio.service.UserPortfolioService;
import egovframework.kaist.user.program.model.UserProgramVo;
import egovframework.kaist.user.program.service.UserProgramService;
import egovframework.kaist.user.program.service.impl.UserProgramServiceImpl;
import egovframework.kaist.user.program_apply.service.UserProgramApplyService;

@Controller
public class UserPortfolioDetailController {

	@Autowired
	UserPortfolioService userPortfolioService;

	@Autowired
	UserProgramApplyService userProgramApplyService;
	
	@Autowired
	UserProgramService userProgramService;
	
	@Autowired
	UserMemberService userMemberService;

	private static final Logger Logger = LoggerFactory.getLogger(UserPortfolioDetailController.class);

	@RequestMapping(value = "/user/portfolio/detail/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("UserPortfolioVo") UserPortfolioVo userPortfolioVo,
			HttpServletRequest request, HttpServletResponse response) {

		String PAGE = request.getParameter("PAGE") != null ? request.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request.getParameter("ITEM_COUNT") : "10";
			
		if(PAGE == null){
			PAGE = "0";
		}
		if(ITEM_COUNT == null){
			ITEM_COUNT = "10";
		}

		UserMemberVo usermembervo = new UserMemberVo();
		
		System.out.println("abc"+userPortfolioVo.getYEAR());
		
		userPortfolioVo.setPAGE(Integer.parseInt(PAGE));
		userPortfolioVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		ModelMap model = new ModelMap();
	
		int pagelimit = userPortfolioVo.getPAGE() * userPortfolioVo.getITEM_COUNT();
		
		userPortfolioVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		userPortfolioVo.setOFFSET(pagelimit);
		
		HttpSession session2 = request.getSession();
	   
	    String getMemberType = (String) session2.getAttribute("ssion_member_type");

		System.out.println("member1"+userPortfolioVo.getMEMBER_ID());
		if(getMemberType.equals("1")){
			System.out.println(request);
			userPortfolioVo.setMEMBER_ID(SUtil.getUserId(request));
			System.out.println("??"+userPortfolioVo.getMEMBER_ID());
		}
		System.out.println("member2"+userPortfolioVo.getMEMBER_ID());
		
		String Year = "";
		
		String MatchingLastYear = userPortfolioService.getMatchingLastYear(userPortfolioVo);
		
		//현재 날짜 구하는 코드
		System.out.println("??"+userPortfolioVo.getYEAR());
		if(userPortfolioVo.getYEAR().equals("") || userPortfolioVo.getYEAR() == null) {
			Calendar cal = Calendar.getInstance();
			
			int year = cal.get(cal.YEAR);
			
			Year = String.valueOf(year);
			
			userPortfolioVo.setYEAR(Year);
			
			System.out.println(userPortfolioVo.getYEAR());
			
			List<?> MatchingList = userPortfolioService.getMatchingList(userPortfolioVo);
			
			userPortfolioVo.setYEAR(MatchingLastYear);
			
			model.put("MatchingList", MatchingList);
			
		}
		
		
		System.out.println("년도 테스트 =2= "+userPortfolioVo.getYEAR());
		
		Year = userPortfolioVo.getYEAR();
		System.out.println(Year);
		
		model = userPortfolioService.getList(userPortfolioVo);
		
		List<?> MatchingList = userPortfolioService.getMatchingList(userPortfolioVo);
		
		model.put("MatchingList", MatchingList);
		
		model.put("MatchingLastYear", MatchingLastYear);
		
		model.put("MatchingYear",Year);
		model.put("SEARCH_TYPE", userPortfolioVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", userPortfolioVo.getSEARCH_TEXT());
		
		model.put("beforeDomain", userPortfolioVo);
		
		model.put("MEMBER_ID", userPortfolioVo.getMEMBER_ID());
		
		UserProgramVo userProgramVo = new UserProgramVo();
		userProgramVo.setMEMBER_ID(userPortfolioVo.getMEMBER_ID());
		userProgramVo.setLIMIT(10);
		userProgramVo.setOFFSET(0);
		
		usermembervo.setMEMBER_ID(userPortfolioVo.getMEMBER_ID());
		usermembervo.setYEAR(userPortfolioVo.getYEAR());
		System.out.println("???");
		model.put("USER", userMemberService.getPortfolioUserView(usermembervo));
		
		model.put("SUMM", userPortfolioService.getSummary(userPortfolioVo));

		
		return new ModelAndView("user/portfolio/detail/list", "model", model);
	}

	@RequestMapping(value = "/user/portfolio/detail/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(HttpServletRequest request, HttpServletResponse response) {

		ModelMap model = new ModelMap();
		
		String TYPE = (String) (request.getParameter("TYPE") != null ? request.getParameter("TYPE") : "1");
		
		if(TYPE == null || TYPE.equals("")) {
			TYPE = "1";
		}
		
		model.put("TYPE", TYPE);
		
		return new ModelAndView("user/portfolio/detail/insert", "model", model);
	}

	@RequestMapping(value = "/user/portfolio/detail/view.do", method = RequestMethod.GET)
	public ModelAndView viewGet(HttpServletRequest request, HttpServletResponse response) {

		ModelMap model = new ModelMap();
		
		String TYPE = (String) (request.getParameter("TYPE") != null ? request.getParameter("TYPE") : "1");
		String MEMBER_ID = (String) (request.getParameter("MEMBER_ID") != null ? request.getParameter("MEMBER_ID") : "");
		
		if(TYPE == null || TYPE.equals("")) {
			TYPE = "1";
		}
		
		model.put("TYPE", TYPE);
		model.put("MEMBER_ID", MEMBER_ID);
		
		return new ModelAndView("user/portfolio/detail/view", "model", model);
	}
	
	@RequestMapping(value = "/user/portfolio/detail/{idx}/view.do", method = RequestMethod.GET)
	public ModelAndView view(@ModelAttribute("UserPortfolioVo") UserPortfolioVo userPortfolioVo,HttpServletRequest request, HttpServletResponse response, @PathVariable("idx") String idx) {
		
		String MEMBER_ID = (String) (request.getParameter("MEMBER_ID") != null ? request.getParameter("MEMBER_ID") : "");
		
		userPortfolioVo.setIDX(idx);
		
		ModelMap model = new ModelMap();
		
		ModelMap portfolioModel = new ModelMap();
		portfolioModel = userPortfolioService.getView(userPortfolioVo);
		model.put("pageDomain", portfolioModel.get("pageDomain"));
		model.put("MEMBER_ID", MEMBER_ID);
		
		return new ModelAndView("user/portfolio/detail/view", "model", model);
	}

	@RequestMapping(value = "/user/portfolio/detail/insert.do", method = RequestMethod.POST)
	public String insertPost(@ModelAttribute("UserPortfolioVo") UserPortfolioVo userPortfolioVo, MultipartHttpServletRequest  request,  HttpServletResponse response) {
		
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/portfolio/";
		 
		String filename = SUtil.setFileUpload(request, drv);
		
		if(filename.length()>0) { 
			userPortfolioVo.setFILES(filename);	
		} else {
			userPortfolioVo.setFILES("");
		}
		userPortfolioService.setInsert(userPortfolioVo);		
		
		return "redirect:/user/portfolio/detail/list.do?YEAR="+userPortfolioVo.getYEAR()+"&MEMBER_ID="+userPortfolioVo.getMEMBER_ID();
	}
	
	@RequestMapping(value = "/user/portfolio/detail/{idx}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@ModelAttribute("UserPortfolioVo") UserPortfolioVo userPortfolioVo,@PathVariable("idx") String idx, HttpServletRequest request, HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		userPortfolioVo.setIDX(idx);
		model = userPortfolioService.getView(userPortfolioVo);
		UserPortfolioVo vo = (UserPortfolioVo) model.get("pageDomain");
		
		if(StringUtils.equals(vo.getMEMBER_ID(), SUtil.getUserId(request))
			 || StringUtils.equals(vo.getPROFESSOR_MEMBER_ID(), SUtil.getUserId(request))) {
			return new ModelAndView("user/portfolio/detail/update", "model", model);
		} else {
			return new ModelAndView("redirect:"+request.getContextPath()+"/index.do", "model", model);
		}
		
	}
	

	@RequestMapping(value = "/user/portfolio/detail/{idx}/update.do", method = RequestMethod.POST)
	public String updatePost(@ModelAttribute("UserPortfolioVo") UserPortfolioVo userPortfolioVo, MultipartHttpServletRequest request, HttpServletResponse response,
			@PathVariable("idx") String idx) {
		
		ModelMap model = new ModelMap();
		userPortfolioVo.setIDX(idx);
		
		
		model = userPortfolioService.getView(userPortfolioVo);
		
		UserPortfolioVo vo = (UserPortfolioVo) model.get("pageDomain");
		
		if(StringUtils.equals(vo.getMEMBER_ID(), SUtil.getUserId(request))
				 || StringUtils.equals(vo.getPROFESSOR_MEMBER_ID(), SUtil.getUserId(request))) {
			// TODO 
			// 뭔가 로직 필요없나??
		} else {
			return "redirect:"+request.getContextPath()+"/index.do";
		}

		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/portfolio/";
		 
		String filename = SUtil.setFileUpload(request, drv);
		
		if(filename.length() > 0) {
			userPortfolioVo.setFILES(filename);	
		} else {
			userPortfolioVo.setFILES("");
		}
		
		HttpSession session = request.getSession();
	    String getMemberType = (String) session.getAttribute("ssion_member_type");
	    userPortfolioVo.setTYPE(getMemberType);
	    
		userPortfolioService.setUpdate(userPortfolioVo);
		
		return "redirect:/user/portfolio/detail/list.do?YEAR="+userPortfolioVo.getYEAR()+"&MEMBER_ID="+userPortfolioVo.getMEMBER_ID();
	}

	@RequestMapping(value = "/user/portfolio/detail/delete.do", method = RequestMethod.POST)
	public String deletePost(@ModelAttribute("UserPortfolioVo") UserPortfolioVo userPortfolioVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		
		
		
		model = userPortfolioService.getView(userPortfolioVo);
		
		UserPortfolioVo vo = (UserPortfolioVo) model.get("pageDomain");
		
		if(vo.getMEMBER_ID().equals(SUtil.getUserId(request))
				|| vo.getPROFESSOR_MEMBER_ID().equals(SUtil.getUserId(request))
				) {
			userPortfolioService.setDelete(userPortfolioVo);
		} else {
			return "redirect:"+request.getContextPath()+"/index.do";
		}
		
		return "redirect:/user/portfolio/detail/list.do?MEMBER_ID="+userPortfolioVo.getMEMBER_ID();
		
	}
	
	
	@RequestMapping(value = "/user/portfolio/detail/deleteArr.do", method = RequestMethod.POST)
	public void deleteArrPost(@ModelAttribute("UserPortfolioVo") UserPortfolioVo userPortfolioVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		String idx = userPortfolioVo.getIDX();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				UserPortfolioVo userProgramVo2 = new UserPortfolioVo();
				userProgramVo2.setIDX(arrIdx[i]);
				userPortfolioService.setDelete(userProgramVo2);		
			}
		}
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}

	@RequestMapping(value = "/user/portfolio/detail/{portfolioid}/{idx}/update2.do", method = RequestMethod.GET)
	public ModelAndView updateGet2(@PathVariable("portfolioid") String portfolioid,
			@PathVariable("idx") String idx,
			HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		
		//model = userProgramApplyService.getView(portfolioid);
		
		UserProgramVo userProgramVo = new UserProgramVo();
		userProgramVo.setMEMBER_ID(portfolioid);
		userProgramVo.setLIMIT(999999);
		userProgramVo.setOFFSET(0);
		
		model = userProgramApplyService.getList(userProgramVo);
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("ssion_user_id");
		
		model.put("PORTPOLIO", userPortfolioService.getView2(portfolioid));
		model.put("MEMBER", userMemberService.getView(member_id));
		
		return new ModelAndView("user/portfolio/detail/update", "model", model);
	}
	
	@RequestMapping(value = "/user/portfolio/detail/programInfo.do", method = RequestMethod.GET)
	public ModelAndView programInfo(
			@ModelAttribute("UserProgramVo") UserProgramVo userProgramVo, 
			HttpServletRequest request, HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = userProgramService.getView2(userProgramVo.getIDX());
	
		return new ModelAndView("user/portfolio/detail/selectAjax", "model", model);
	}
	
	@RequestMapping(value = "/user/portfolio/detail/{portfolioid}/update2.do", method = RequestMethod.POST)
	public String updatePost2(@PathVariable("portfolioid") String portfolioid,
			@ModelAttribute("UserPortfolioVo") UserPortfolioVo userPortfolioVo,
			MultipartHttpServletRequest request,
			HttpServletResponse response) {

		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/member/";
		 
		String filename = SUtil.setFileUpload(request, drv);
		
		if(filename.length()>0)
		{
			userPortfolioVo.setFILES(filename);	
		}else
		{
			userPortfolioVo.setFILES("");
		}
		ModelMap model = new ModelMap();

		boolean rtn = userPortfolioService.setUpdate(userPortfolioVo);

		return "redirect:../../list.do";

	}

	@RequestMapping(value = "/user/portfolio/detail/{idx}/pdf.do", method = RequestMethod.GET)
	public ModelAndView pdf(@ModelAttribute("UserPortfolioVo") UserPortfolioVo userPortfolioVo, HttpServletRequest request, HttpServletResponse response, @PathVariable("idx") String idx) {
		
		ModelMap model = new ModelMap();
		
		ModelMap portfolioModel = new ModelMap();
		userPortfolioVo.setIDX(idx);
		
		portfolioModel = userPortfolioService.getView(userPortfolioVo);
		model.put("pageDomain", portfolioModel.get("pageDomain"));
		
		return new ModelAndView("user/portfolio/detail/pdf", "model", model);
	}
	
	@RequestMapping(value = "/user/portfolio/detail/{portfolioid}/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(@ModelAttribute("UserPortfolioVo") UserPortfolioVo userPortfolioVo,@PathVariable("portfolioid") String portfolioid, HttpServletRequest request, HttpServletResponse response) {

		ModelMap model = new ModelMap();
		UserMemberVo userMemberVo = new UserMemberVo();
		userMemberVo.setMEMBER_ID(portfolioid);
		userMemberVo.setYEAR(userPortfolioVo.getYEAR());
		//21-08-04 회차 작업 진행되며 기존 getView 에서 변경
		ModelMap memberModel = userMemberService.getPortfolioYearView(userMemberVo);
		UserMemberVo userMemberPageDomain = (UserMemberVo) memberModel.get("pageDomain");
		userMemberPageDomain.setYEAR(userPortfolioVo.getYEAR());
		model.put("userMemberPageDomain", userMemberPageDomain);
		
		return new ModelAndView("user/portfolio/detail/insert", "model", model);
	}
	
}
