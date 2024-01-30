package egovframework.kaist.user.mentoring.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

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

import egovframework.kaist.user.notices.model.UserNoticesVo;
import egovframework.kaist.user.notices.service.UserNoticesService;
import egovframework.kaist.admin.member.model.AdminMemberVo;
import egovframework.kaist.user.mentoring.model.UserMentoringVo;
import egovframework.kaist.user.mentoring.service.UserMentoringService;

@Controller
public class UserMentoringController {

	@Autowired
	UserMentoringService userMentoringService;



	private static final Logger Logger = LoggerFactory.getLogger(UserMentoringController.class);

	@RequestMapping(value = "/user/mentoring/list.do", method = RequestMethod.GET)
	public ModelAndView list(
			@ModelAttribute("UserMentoringVo") UserMentoringVo userMentoringVo,
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
				
		userMentoringVo.setPAGE(Integer.parseInt(PAGE));
		userMentoringVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		ModelMap model = new ModelMap();
	
		int pagelimit = userMentoringVo.getPAGE() * userMentoringVo.getITEM_COUNT();
		
		userMentoringVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		userMentoringVo.setOFFSET(pagelimit);
		
		model = userMentoringService.getList(userMentoringVo);
		
		model.put("SEARCH_TYPE", userMentoringVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", userMentoringVo.getSEARCH_TEXT());
		
		if(userMentoringVo.getSTART_TM().equals(""))
		{
			userMentoringVo.setSTART_TM(SUtil.getNowDate());	
		}
		if(userMentoringVo.getEND_TM().equals(""))
		{
			userMentoringVo.setEND_TM(SUtil.getNowDate());	
		}
		
		model.put("beforeDomain", userMentoringVo);
		
		return new ModelAndView("user/mentoring/list", "model", model);	
			
	}

	@RequestMapping(value = "/user/mentoring/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(
		
			HttpServletRequest request, HttpServletResponse response) 
	{

		ModelMap model = new ModelMap();
		
				
		return new ModelAndView("user/mentoring/insert", "model", model);
		
	}

	@RequestMapping(value = "/user/mentoring/insert.do", method = RequestMethod.POST)
	public String insertPost(@ModelAttribute("UserMentoringVo") UserMentoringVo userMentoringVo, 
			MultipartHttpServletRequest  request,  HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/mentoring/";
		 
		String filename = SUtil.setFileUpload(request, drv);
		
		if(filename.length() > 1)
		{
			//filename.substring(0, filename.length()-1);
			userMentoringVo.setIMAGE(filename);
		}
		
		int rtn = userMentoringService.setInsert(userMentoringVo);

		return "redirect:./list.do";
		
	}
	@RequestMapping(value = "/user/mentoring/{mentoringid}/view.do", method = RequestMethod.GET)
	public ModelAndView viewGet(
			@PathVariable("mentoringid") String mentoringid,
			HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		
		model = userMentoringService.getView(mentoringid);
				
		UserMentoringVo userMentoringVo = (UserMentoringVo) model.get("pageDomain");
		
		return new ModelAndView("user/mentoring/view", "model", model);	
	}
	@RequestMapping(value = "/user/mentoring/{mentoringid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(
			@PathVariable("mentoringid") String mentoringid,
			HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		
		model = userMentoringService.getView(mentoringid);

		return new ModelAndView("user/mentoring/update", "model", model);
		
	}
	
	@RequestMapping(value = "/user/mentoring/{mentoringid}/update.do", method = RequestMethod.POST)
	public String updatePost(@ModelAttribute("UserMentoringVo") UserMentoringVo userMentoringVo, 
			@PathVariable("mentoringid") String mentoringid,
			MultipartHttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		ModelMap model = new ModelMap();
		
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/mentoring/";
		 
		String filename = SUtil.setFileUpload(request, drv);
		
		if(filename.length() > -1)
		{
			userMentoringVo.setIMAGE(filename);
		}
		
		userMentoringVo.setIDX(mentoringid);
		
		model = userMentoringService.getView(mentoringid);
		UserMentoringVo vo = (UserMentoringVo) model.get("pageDomain");
		if(vo.getMEMBER_ID().equals(SUtil.getUserId(request))
				|| SUtil.getUserLevel(request).equals("1"))
		{
			boolean rtn = userMentoringService.setUpdate(userMentoringVo);
		}
		
		return "redirect:../list.do";
	}
	@RequestMapping(value = "/user/mentoring/deleteArr.do", method = RequestMethod.POST)
	public void deleteArrPost(@ModelAttribute("UserMentoringVo") UserMentoringVo userMentoringVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		String idx = userMentoringVo.getIDX();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				UserMentoringVo userMentoringVo2 = new UserMentoringVo();
				userMentoringVo2.setIDX(arrIdx[i]);
				userMentoringService.setDelete(userMentoringVo2);		
			}
		}
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	
	@RequestMapping(value = "/user/mentoring/{mentoringid}/delete.do", method = RequestMethod.POST)
	public String deletePost(@ModelAttribute("UserMentoringVo") UserMentoringVo userMentoringVo,
			@PathVariable("mentoringid") String mentoringid,
			HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		//방어처리
		model = userMentoringService.getView(mentoringid);
		UserMentoringVo vo = (UserMentoringVo) model.get("pageDomain");
		if(vo.getMEMBER_ID().equals(SUtil.getUserId(request))
				|| SUtil.getUserLevel(request).equals("1"))
		{
			userMentoringVo.setIDX(mentoringid);
			boolean rtn = userMentoringService.setDelete(userMentoringVo);	
		}
		
		return "redirect:../list.do";
	}

}
