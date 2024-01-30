package egovframework.kaist.user.portfolio.controller;

import java.io.IOException;

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
public class UserPortfolioDetailAdminController {

	@Autowired
	UserPortfolioService userPortfolioService;

	@Autowired
	UserProgramApplyService userProgramApplyService;
	
	@Autowired
	UserProgramService userProgramService;
	
	@Autowired
	UserMemberService userMemberService;

	private static final Logger Logger = LoggerFactory.getLogger(UserPortfolioDetailAdminController.class);

	@RequestMapping(value = "/user/portfolio/detail/{userId}/list.do", method = RequestMethod.GET)
	public ModelAndView list(@PathVariable("userId") String userId,
			@ModelAttribute("UserPortfolioVo") UserPortfolioVo userPortfolioVo,
			HttpServletRequest request, HttpServletResponse response) {

		String PAGE = request.getParameter("PAGE") != null ? request.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request.getParameter("ITEM_COUNT") : "999999";
		
		if(PAGE == null) {
			PAGE = "0";
		}
		if(ITEM_COUNT == null) {
			ITEM_COUNT = "999999";
		}
		
		UserMemberVo usermembervo = new UserMemberVo();
		
		if(SUtil.getUserLevel(request).equals("1"))
		{
	

			userPortfolioVo.setPAGE(Integer.parseInt(PAGE));
			userPortfolioVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
			
			ModelMap model = new ModelMap();
		
			int pagelimit = userPortfolioVo.getPAGE() * userPortfolioVo.getITEM_COUNT();
			
			userPortfolioVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
			userPortfolioVo.setOFFSET(pagelimit);
			
			HttpSession session2 = request.getSession();
		   
		    String getMemberType = (String) session2.getAttribute("ssion_member_type");

		    userPortfolioVo.setMEMBER_ID(userId);
		    userPortfolioVo.setTYPE("1");
			model = userPortfolioService.getList(userPortfolioVo);
			
			model.put("SEARCH_TYPE", userPortfolioVo.getSEARCH_TYPE());
			model.put("SEARCH_TEXT", userPortfolioVo.getSEARCH_TEXT());
			
			model.put("beforeDomain", userPortfolioVo);
			
			model.put("MEMBER_ID", userPortfolioVo.getMEMBER_ID());
			
			UserProgramVo userProgramVo = new UserProgramVo();
			userProgramVo.setMEMBER_ID(userPortfolioVo.getMEMBER_ID());
			userProgramVo.setLIMIT(999999);
			userProgramVo.setOFFSET(0);
			
			usermembervo.setYEAR(userPortfolioVo.getYEAR());
			usermembervo.setMEMBER_ID(userPortfolioVo.getMEMBER_ID());
			
			model.put("USER", userMemberService.getPortfolioUserView(usermembervo));
			
			model.put("SUMM", userPortfolioService.getSummary(userPortfolioVo));
			
			model.put("MatchingYear", userPortfolioVo.getYEAR());
			System.out.println(userPortfolioVo.getYEAR());
			
			return new ModelAndView("user/portfolio/detailAdmin/list", "model", model);
		}else
		{
			ModelMap model = new ModelMap();
			 
			return new ModelAndView("redirect:/user/member/login.do", "model", model);
		}
	}
	
	
	@RequestMapping(value = "/user/portfolio/detail/{userId}/{idx}/view.do", method = RequestMethod.GET)
	public ModelAndView useridViewGet(
			@ModelAttribute("UserPortfolioVo") UserPortfolioVo userPortfolioVo,
			@PathVariable("userId") String userId,
			@PathVariable("idx") String idx,
			HttpServletRequest request, HttpServletResponse response) {

		if(SUtil.getUserLevel(request).equals("1"))
		{
			String MEMBER_ID = (String) (request.getParameter("MEMBER_ID") != null ? request.getParameter("MEMBER_ID") : "");
			
			ModelMap model = new ModelMap();
			
			ModelMap portfolioModel = new ModelMap();
			
			userPortfolioVo.setIDX(idx);
			
			portfolioModel = userPortfolioService.getView(userPortfolioVo);
			model.put("pageDomain", portfolioModel.get("pageDomain"));
			model.put("MEMBER_ID", MEMBER_ID);
			System.out.println("sss");
			return new ModelAndView("user/portfolio/detailAdmin/view", "model", model);
		}else
		{
			ModelMap model = new ModelMap();
			 
			return new ModelAndView("redirect:/user/member/login.do", "model", model);
		}
		
	}
	
	@RequestMapping(value = "/user/portfolio/detail/{userId}/{idx}/delete.do", method = {RequestMethod.GET, RequestMethod.POST} )
	public String deletePost(
			@PathVariable("userId") String userId,
			@PathVariable("idx") String idx,
			@ModelAttribute("UserPortfolioVo") UserPortfolioVo userPortfolioVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		userPortfolioVo.setIDX(idx);
		model = userPortfolioService.getView(userPortfolioVo);
		
		UserPortfolioVo vo = (UserPortfolioVo) model.get("pageDomain");
		
		if(SUtil.getUserLevel(request).equals("1"))
		{
			userPortfolioService.setDelete(userPortfolioVo);
		
		} else {
			return "redirect:"+request.getContextPath()+"/index.do";
		}
		
		return "redirect:/user/portfolio/detail/"+userId+"/list.do?MEMBER_ID="+userPortfolioVo.getMEMBER_ID();
		
	}
		
}
