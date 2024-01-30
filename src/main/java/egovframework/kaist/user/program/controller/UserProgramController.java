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
import org.springframework.web.servlet.ModelAndView;

import com.system.util.SUtil;

import egovframework.kaist.user.member.service.UserMemberService;
import egovframework.kaist.user.program.model.UserProgramVo;
import egovframework.kaist.user.program.service.UserProgramService;
import egovframework.kaist.user.program_apply.model.UserProgramApplyVo;
import egovframework.kaist.user.program_apply.service.UserProgramApplyService;

@Controller
public class UserProgramController {

	@Autowired
	UserProgramService userProgramService;

	@Autowired
	UserProgramApplyService userProgramApplyService;
	

	@Autowired
	UserMemberService userMemberService;
	


	private static final Logger Logger = LoggerFactory.getLogger(UserProgramController.class);

	
	
	@RequestMapping(value = "/user/program/{programid}/list.do", method = RequestMethod.GET)
	public ModelAndView list(@PathVariable("programid") String programid, 
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
		
		userProgramVo.setTYPE(programid);
		userProgramVo.setPAGE(Integer.parseInt(PAGE));
		userProgramVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = userProgramVo.getPAGE() * userProgramVo.getITEM_COUNT();
		
		userProgramVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		userProgramVo.setOFFSET(pagelimit);
	
		model = userProgramService.getList(userProgramVo);
		
		//교수신청
		if(programid.equals("201")
				|| programid.equals("202")
				|| programid.equals("204")
				|| programid.equals("203"))
		{
			model.put("TYPE", "1");
		}else
		{
			//학생신청
			model.put("TYPE", "2");
		}
		
		model.put("beforeDomain", userProgramVo);
		model.put("PROGRAM_TYPE", programid);
		
		model.put("YEARLIST", userProgramService.getListGroupByYear());
		return new ModelAndView("user/program/list", "model", model);
	}
	

	//type 2 교수, 1 학생
	@RequestMapping(value = "/user/program/{programid}/{idx}/{type}/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(@PathVariable("programid") String programid,
			@PathVariable("type") String type,
			@PathVariable("idx") String idx,
			HttpServletRequest request, HttpServletResponse response) 
	{

		ModelMap model = new ModelMap();
		
		model = userProgramService.getView(idx);
		
		if(programid.equals("204"))
		{
			UserProgramApplyVo userProgramApplyDomain2 = new UserProgramApplyVo();
			userProgramApplyDomain2.setMEMBER_ID(SUtil.getUserId(request));
			userProgramApplyDomain2.setPROGRAM_IDX(idx);
			
			model.put("MEMBER", userMemberService.getMatchingList(userProgramApplyDomain2));
			model.put("MEMBER2", userMemberService.getView(SUtil.getUserId(request)));	
			type = "1";
			
			UserProgramApplyVo userProgramApplyDomain = new UserProgramApplyVo();
			
			userProgramApplyDomain.setMEMBER_ID(SUtil.getUserId(request));
			userProgramApplyDomain.setPROGRAM_IDX(idx);
			
			model.put("BEFORE", userProgramApplyDomain);
			model.put("PROGRAM_TYPE", programid);
			
			model.put("APPLY2", userProgramApplyService.getApplyView(userProgramApplyDomain));
			
		}
		else if(programid.equals("201")
				|| programid.equals("202")
				|| programid.equals("203"))
		{
			model.put("MEMBER", userMemberService.getView(SUtil.getUserId(request)));	
			type = "2";
		}else
		{
			UserProgramApplyVo userProgramApplyDomain2 = new UserProgramApplyVo();
			userProgramApplyDomain2.setMEMBER_ID(SUtil.getUserId(request));
			userProgramApplyDomain2.setPROGRAM_IDX(idx);
			
			model.put("MEMBER", userMemberService.getMatchingList(userProgramApplyDomain2));
			type = "1";
				
		}
		
		UserProgramApplyVo userProgramApplyDomain = new UserProgramApplyVo();
		
		userProgramApplyDomain.setMEMBER_ID(SUtil.getUserId(request));
		userProgramApplyDomain.setPROGRAM_IDX(idx);
		
		model.put("BEFORE", userProgramApplyDomain);
		model.put("PROGRAM_TYPE", programid);
		
		
		
		model.put("APPLY", userProgramApplyService.getApplyView(userProgramApplyDomain));

		return new ModelAndView("user/program/"+type+"/insert", "model", model);
	}

	@RequestMapping(value = "/user/program/{programid}/{idx}/{type}/insert.do", method = RequestMethod.POST)
	public void insertPOST(@PathVariable("programid") String programid,
			@PathVariable("type") String type,
			@PathVariable("idx") String idx,
			@ModelAttribute("UserProgramApplyVo") UserProgramApplyVo userProgramApplyVo,
			HttpServletRequest request, HttpServletResponse response) 
	{
		
		if(programid.equals("201")
				|| programid.equals("202")
				|| programid.equals("203"))
		{
			userProgramApplyVo.setMEMBER_ID(SUtil.getUserId(request));
		}else
		{
			//학생신청
			;
		}
		
		
		userProgramApplyVo.setPROGRAM_IDX(idx);
		
		ModelMap model =  userProgramApplyService.getApplyView(userProgramApplyVo);
		
		UserProgramApplyVo vo = (UserProgramApplyVo) model.get("pageDomain");
		
		if(vo.getIDX().equals(""))
		{
			userProgramApplyService.setInsert(userProgramApplyVo);
		}else
		{
			vo.setATTEND(userProgramApplyVo.getATTEND());
			userProgramApplyService.setUpdate(vo);
		}
		
		
		try {
			response.getWriter().print("true");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/user/program/{programid}/{idx}/{type}/delete.do", method = RequestMethod.POST)
	public void delete(@PathVariable("programid") String programid, @PathVariable("type") String type,
			@ModelAttribute("UserProgramApplyVo") UserProgramApplyVo userProgramApplyVo,
			@PathVariable("idx") String idx,
			HttpServletRequest request, HttpServletResponse response) 
	{
		
		if(programid.equals("6")
				|| programid.equals("7")
				|| programid.equals("8"))
		{
			userProgramApplyVo.setMEMBER_ID(SUtil.getUserId(request));
		}else
		{
			//학생신청
			;
		}
		
		userProgramApplyVo.setPROGRAM_IDX(idx);
		
		
		userProgramApplyService.setDelete(userProgramApplyVo);
		
		
		try {
			response.getWriter().print("true");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
