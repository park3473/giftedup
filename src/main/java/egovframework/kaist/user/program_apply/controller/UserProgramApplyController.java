package egovframework.kaist.user.program_apply.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.system.util.SUtil;

import egovframework.kaist.user.program.model.UserProgramVo;
import egovframework.kaist.user.program.service.UserProgramService;
import egovframework.kaist.user.program_apply.model.UserProgramApplyVo;
import egovframework.kaist.user.program_apply.service.UserProgramApplyService;

@Controller
public class UserProgramApplyController {

	@Autowired
	UserProgramApplyService userProgramApplyService;

	@Autowired
	UserProgramService userProgramService;

	private static final Logger Logger = LoggerFactory.getLogger(UserProgramApplyController.class);

	@RequestMapping(value = "/user/program_apply/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("UserProgramApplyVo") UserProgramVo userProgramVo,
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
		

		userProgramVo.setPAGE(Integer.parseInt(PAGE));
		userProgramVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = userProgramVo.getPAGE() * userProgramVo.getITEM_COUNT();
		
		userProgramVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		userProgramVo.setOFFSET(pagelimit);
		
	
		model = userProgramApplyService.getList(userProgramVo);
		
		model.put("SEARCH_TYPE", userProgramVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", userProgramVo.getSEARCH_TEXT());
		
		if(userProgramVo.getSTART_TM().equals(""))
		{
			userProgramVo.setSTART_TM(SUtil.getNowDate());	
		}
		if(userProgramVo.getEND_TM().equals(""))
		{
			userProgramVo.setEND_TM(SUtil.getNowDate());	
		}
		
		model.put("beforeDomain", userProgramVo);

		

		return new ModelAndView("user/program_apply/list", "model", model);
	}

	@RequestMapping(value = "/user/program_apply/{programid}/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(@PathVariable("programid") String programid,
			HttpServletRequest request, HttpServletResponse response) 
	{

		ModelMap model = new ModelMap();
		
		
		model = userProgramService.getView(programid);
		
		return new ModelAndView("user/program_apply/insert", "model", model);
	}

	@RequestMapping(value = "/user/program_apply/insert.do", method = RequestMethod.POST)
	public void insertPost(@ModelAttribute("UserProgramApplyVo") UserProgramApplyVo userProgramApplyVo,
			HttpServletRequest  request,  HttpServletResponse response) {
		
		ModelMap model =  userProgramService.getView(userProgramApplyVo.getPROGRAM_IDX());
		
		UserProgramVo vo = (UserProgramVo) model.get("pageDomain");
		
		if(vo.getEND_TM_STEP().equals("1") && vo.getSTART_TM().equals("1"))
		{
			userProgramApplyService.setInsert(userProgramApplyVo);
			try {
				response.getWriter().print("true");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else
		{
			try {
				response.getWriter().print("false");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
			
			
		
		
		
	}
	
	@RequestMapping(value = "/user/program_apply/{program_applyid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("program_applyid") String program_applyid,
			HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		model = userProgramApplyService.getView(program_applyid);

		
		return new ModelAndView("user/program_apply/update", "model", model);
	}
	
	@RequestMapping(value = "/user/program_apply/update.do", method = RequestMethod.POST)
	public void updatePost(@ModelAttribute("UserProgramApplyVo") UserProgramApplyVo userProgramApplyVo, 
			HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		boolean rtn = userProgramApplyService.setUpdate(userProgramApplyVo);

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

	@RequestMapping(value = "/user/program_apply/delete.do", method = RequestMethod.POST)
	public void deletePost(@ModelAttribute("UserProgramApplyVo") UserProgramApplyVo userProgramApplyVo, 
			HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String year = request.getParameter("year") != null ? request.getParameter("year") : "";
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		boolean rtn = userProgramApplyService.setDelete(userProgramApplyVo);
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

}
