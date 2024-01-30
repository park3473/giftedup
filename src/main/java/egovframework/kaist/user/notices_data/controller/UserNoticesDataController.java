package egovframework.kaist.user.notices_data.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.system.util.SUtil;

import egovframework.kaist.user.notices.model.UserNoticesVo;
import egovframework.kaist.user.notices.service.UserNoticesService;
import egovframework.kaist.user.notices_comment.model.UserNoticesCommentVo;
import egovframework.kaist.user.notices_comment.service.UserNoticesCommentService;
import egovframework.kaist.user.notices_data.model.UserNoticesDataVo;
import egovframework.kaist.user.notices_data.service.UserNoticesDataService;

@Controller
public class UserNoticesDataController {

	
	@Autowired
	UserNoticesCommentService userNoticesCommentService;
	
	
	@Autowired
	UserNoticesDataService userNoticesDataService;

	@Autowired
	UserNoticesService userNoticesService;

	private static final Logger Logger = LoggerFactory.getLogger(UserNoticesDataController.class);

	@RequestMapping(value = "/user/notices_data/{notices}/list.do", method = RequestMethod.GET)
	public ModelAndView list(@PathVariable("notices") String notices,
			@ModelAttribute("UserNoticesDataVo") UserNoticesDataVo userNoticesDataVo,
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
		
		ModelMap NOTICESMAP = userNoticesService.getView(notices);
		
		UserNoticesVo userNotices = (UserNoticesVo) NOTICESMAP.get("pageDomain");
		
		if(userNotices.getMY_WRITE_SHOW().equals("1"))
		{
			userNoticesDataVo.setMY_WRITE_SHOW("1");	
			userNoticesDataVo.setMEMBER_ID(SUtil.getUserId(request));
		}
		
		
		
		userNoticesDataVo.setNOTICES_IDX(notices);
		
		userNoticesDataVo.setPAGE(Integer.parseInt(PAGE));
		userNoticesDataVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = userNoticesDataVo.getPAGE() * userNoticesDataVo.getITEM_COUNT();
		
		userNoticesDataVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		userNoticesDataVo.setOFFSET(pagelimit);
		
		model = userNoticesDataService.getList(userNoticesDataVo);
		
		model.put("SEARCH_TYPE", userNoticesDataVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", userNoticesDataVo.getSEARCH_TEXT());
		
		if(userNoticesDataVo.getSTART_TM().equals(""))
		{
			userNoticesDataVo.setSTART_TM(SUtil.getNowDate());	
		}
		if(userNoticesDataVo.getEND_TM().equals(""))
		{
			userNoticesDataVo.setEND_TM(SUtil.getNowDate());	
		}
		
		model.put("beforeDomain", userNoticesDataVo);
		model.put("noticesid", notices);

		

		model.put("RANK", userNoticesCommentService.getRank(notices));
		model.put("BEST", userNoticesDataService.getBest(notices));
		
		
		model.put("NOTICES", NOTICESMAP);
		
		if(userNotices.getTYPE().equals("1"))
		{
			return new ModelAndView("user/notices_data/1/list", "model", model);	
		}else if(userNotices.getTYPE().equals("2"))
		{
			return new ModelAndView("user/notices_data/2/list", "model", model);
		}else
		{
			return new ModelAndView("user/notices_data/1/list", "model", model);	
		}
			
	}

	@RequestMapping(value = "/user/notices_data/{notices}/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(
			@PathVariable("notices") String notices,
			HttpServletRequest request, HttpServletResponse response) 
	{

		ModelMap model = new ModelMap();
		
		ModelMap NOTICESMAP = userNoticesService.getView(notices);
		
		UserNoticesVo userNotices = (UserNoticesVo) NOTICESMAP.get("pageDomain");
		
		model.put("NOTICES", NOTICESMAP);
		//유형 변환
		if(userNotices.getTYPE().equals("1"))
		{
			return new ModelAndView("user/notices_data/1/insert", "model", model);	
		}else if(userNotices.getTYPE().equals("2"))
		{
			return new ModelAndView("user/notices_data/2/insert", "model", model);
		}else  if(userNotices.getTYPE().equals("3"))
		{
			return new ModelAndView("user/notices_data/3/insert", "model", model);
		}else
		{
			return new ModelAndView("user/notices_data/insert", "model", model);	
		}
		
		
		
	}
	@RequestMapping(value = "/user/notices_data/{notices}/insert.do", method = RequestMethod.POST)
	public String insertPost(@ModelAttribute("userNoticesDataVo") UserNoticesDataVo userNoticesDataVo, 
			@PathVariable("notices") String notices,
			MultipartHttpServletRequest  request,  HttpServletResponse response) throws UnsupportedEncodingException {
		
		if(userNoticesDataVo.getTYPE() == null)
		{
			userNoticesDataVo.setTYPE("1");
		}
		
		ModelMap model = new ModelMap();
		
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/notices_data/";
		 
		String filename = SUtil.setFileUpload(request, drv);
		
		String files[] = filename.split(",");
		String saveFileName = "";
		for(int i = 0; i < files.length; i++)
		{
			String ff = files[i];
			
			String ff2 = ""; 
			ff2 = SUtil.StringReplace(userNoticesDataVo.getIMAGE());
			ff2 = URLEncoder.encode(ff2, "UTF-8"); 
			if(ff.indexOf(ff2) > -1 && ff2.length() > 1)
			{
				userNoticesDataVo.setIMAGE(ff);
			}else {
				saveFileName += ff + ",";
			}
		}
		if(saveFileName.length() > 1)
		{
			saveFileName = saveFileName.substring(0, saveFileName.length()-1);
		}
		userNoticesDataVo.setNOTICES_IDX(notices);
		userNoticesDataVo.setFILES(saveFileName);
		
		int rtn = userNoticesDataService.setInsert(userNoticesDataVo);

		
		return "redirect:./list.do";
		
	}
	
	@RequestMapping(value = "/user/notices_data/{notices}/{notices_dataid}/view.do", method = RequestMethod.GET)
	public ModelAndView viewGet(
			@PathVariable("notices_dataid") String notices_dataid,
			@PathVariable("notices") String notices,
			HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		
		model = userNoticesDataService.getView(notices_dataid);
		model.put("NOTICES", userNoticesService.getView(notices));
		model.put("notices", notices);
		
		ModelMap NOTICESMAP = userNoticesService.getView(notices);
		
		UserNoticesVo userNotices = (UserNoticesVo) NOTICESMAP.get("pageDomain");
		UserNoticesDataVo userNoticesDataVo = (UserNoticesDataVo) model.get("pageDomain");
		
		model.put("NOTICES", NOTICESMAP);
		try {
			if(Integer.parseInt(userNotices.getCOMMENT_LEVEL()) >= Integer.parseInt(SUtil.getUserLevel(request)))
			{
				model.put("COMMENT_VIEW", "TRUE");
			}else
			{
				model.put("COMMENT_VIEW", "FALSE");
			}	
		}catch (java.lang.NumberFormatException e)
		{
			model.put("COMMENT_VIEW", "FALSE");
		}
		
		
		UserNoticesCommentVo adminNoticesCommentVo = new UserNoticesCommentVo();
		adminNoticesCommentVo.setNOTICES_IDX(notices);
		adminNoticesCommentVo.setNOTICES_DATA_IDX(notices_dataid);
		
		adminNoticesCommentVo.setLIMIT(99999);
		adminNoticesCommentVo.setPAGE(0);
		ModelMap commentMap = userNoticesCommentService.getList(adminNoticesCommentVo);
		
		model.put("COMMENT", commentMap);
		
		if(userNotices.getMY_WRITE_SHOW().equals("1") && !userNoticesDataVo.getMEMBER_ID().equals(SUtil.getUserId(request)))
		{
			return new ModelAndView("redirect:../list.do", "model", model);
		}
		else
		{
			if(userNotices.getTYPE().equals("1"))
			{
				return new ModelAndView("user/notices_data/1/view", "model", model);	
			}else if(userNotices.getTYPE().equals("2"))
			{
				return new ModelAndView("user/notices_data/2/view", "model", model);
			}else  if(userNotices.getTYPE().equals("3"))
			{
				return new ModelAndView("user/notices_data/3/view", "model", model);
			}else
			{
				return new ModelAndView("user/notices_data/view", "model", model);	
			}
		}
		
		
		
	}
	@RequestMapping(value = "/user/notices_data/{notices}/{notices_dataid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(
			@PathVariable("notices_dataid") String notices_dataid,
			@PathVariable("notices") String notices,
			HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		
		model = userNoticesDataService.getView(notices_dataid);
		
		model.put("NOTICES_IDX", notices);
		
		ModelMap NOTICESMAP = userNoticesService.getView(notices);
		
		UserNoticesVo userNotices = (UserNoticesVo) NOTICESMAP.get("pageDomain");
		
		model.put("NOTICES", NOTICESMAP);
		
		UserNoticesDataVo userNoticesData = (UserNoticesDataVo) model.get("pageDomain");

		
		
		if(SUtil.getUserLevel(request).equals("1") || userNoticesData.getMEMBER_ID().equals(SUtil.getUserId(request)))
		{
			if(userNotices.getTYPE().equals("1"))
			{
				return new ModelAndView("user/notices_data/1/update", "model", model);	
			}else if(userNotices.getTYPE().equals("2"))
			{
				return new ModelAndView("user/notices_data/2/update", "model", model);
			}else  if(userNotices.getTYPE().equals("3"))
			{
				return new ModelAndView("user/notices_data/3/update", "model", model);
			}else
			{
				return new ModelAndView("user/notices_data/update", "model", model);	
			}
		
		}else
		{
			System.out.println("SUtil.getUserLevel(request).equals(\"1\") : "  + SUtil.getUserLevel(request));
			System.out.println("userNotices.getMEMBER_ID() : "  + userNotices.getMEMBER_ID());
			System.out.println("userNotices.getMEMBER_ID() : "  + SUtil.getUserId(request));
			return new ModelAndView("redirect:../list.do", "model", model);
		}
		
	}
	
	
	

	@RequestMapping(value = "/user/notices_data/{notices}/{notices_dataid}/update.do", method = RequestMethod.POST)
	public String updatePost(@ModelAttribute("UserNoticesDataVo") UserNoticesDataVo userNoticesDataVo, 
			@PathVariable("notices_dataid") String notices_dataid,
			@PathVariable("notices") String notices,
			MultipartHttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		ModelMap model = new ModelMap();
		
		if(userNoticesDataVo.getTYPE() == null)
		{
			userNoticesDataVo.setTYPE("1");
		}
		
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/notices_data/";
		 
		String filename = SUtil.setFileUpload(request, drv);
		
		String files[] = filename.split(",");
		
		System.out.println("filename : " + filename);
		
		String saveFileName = "";
		if(userNoticesDataVo.getFILES().equals("")) {
			
		}else {
			saveFileName += userNoticesDataVo.getFILES();
			saveFileName += ",";
		}
		for(int i = 0; i < files.length; i++)
		{
			String ff = files[i];
			
			String ff2 = ""; 
			ff2 = SUtil.StringReplace(userNoticesDataVo.getIMAGE());
			ff2 = URLEncoder.encode(ff2, "UTF-8"); 
			if(ff.indexOf(ff2) > -1 && ff2.length() > 1)
			{
				userNoticesDataVo.setIMAGE(ff);
			}else {
				saveFileName += ff + ",";
			}
		}
		if(saveFileName.length() > 1)
		{
			saveFileName = saveFileName.substring(0, saveFileName.length()-1);
		}
		
	
		
		userNoticesDataVo.setNOTICES_IDX(notices);
		userNoticesDataVo.setFILES(saveFileName);
		userNoticesDataVo.setIDX(notices_dataid);
		
		boolean rtn = userNoticesDataService.setUpdate(userNoticesDataVo);

		
		return "redirect:../list.do";
	}

	
	
	
	
	
	
	
	
	@RequestMapping(value = "/user/notices_data/{notices}/{notices_dataid}/delete.do", method = RequestMethod.POST)
	public String deletePost(@ModelAttribute("UserNoticesDataVo") UserNoticesDataVo userNoticesDataVo,
			@PathVariable("notices_dataid") String notices_dataid,
			@PathVariable("notices") String notices,
			HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		//방어처리
		model = userNoticesDataService.getView(notices_dataid);
		UserNoticesDataVo vo = (UserNoticesDataVo) model.get("pageDomain");
		if(vo.getMEMBER_ID().equals(SUtil.getUserId(request))
				|| SUtil.getUserLevel(request).equals("1"))
		{

			userNoticesDataVo.setIDX(notices_dataid);
			boolean rtn = userNoticesDataService.setDelete(userNoticesDataVo);	
		}
		
		
		
		return "redirect:../list.do";
	}

	@RequestMapping(value = "/user/notices_data/{notices}/deleteArr.do", method = RequestMethod.POST)
	public void deleteArrPost(@PathVariable("notices") String notices,
			@ModelAttribute("UserNoticesDataVo") UserNoticesDataVo userNoticesDataVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		String idx = userNoticesDataVo.getIDX();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				UserNoticesDataVo userNoticesDataVo2 = new UserNoticesDataVo();
				userNoticesDataVo2.setIDX(arrIdx[i]);
				userNoticesDataService.setDelete(userNoticesDataVo2);		
			}
		}
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	
	@RequestMapping(value = "/user/notices_data/fileRemove.do" , method = RequestMethod.POST)
	@ResponseBody
	public void FileRemove(@ModelAttribute("UserNoticesDataVo") UserNoticesDataVo userNoticesDataVo, HttpServletRequest request , HttpServletResponse response) throws UnsupportedEncodingException {
		
		ModelMap model = new ModelMap();
		model = userNoticesDataService.getView(userNoticesDataVo.getIDX());
		UserNoticesDataVo userNoticesDataVo2 = (UserNoticesDataVo) model.get("pageDomain");
		
		String FullFileName = userNoticesDataVo2.getFILES();
		System.out.println("FullFileName" + FullFileName);
		String RemoveFile = userNoticesDataVo.getFILES();
		
		System.out.println("RemoveFile : " + RemoveFile);
		FullFileName = FullFileName.replace(RemoveFile, "");
		System.out.println("Result : " + FullFileName);
		
		userNoticesDataVo.setFILES(FullFileName);
		userNoticesDataService.setUpdateFile(userNoticesDataVo);
		
		
	}

}
