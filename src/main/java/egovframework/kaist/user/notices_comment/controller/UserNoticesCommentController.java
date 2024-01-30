package egovframework.kaist.user.notices_comment.controller;

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
import egovframework.kaist.user.notices_comment.model.UserNoticesCommentVo;
import egovframework.kaist.user.notices_comment.service.UserNoticesCommentService;

@Controller
public class UserNoticesCommentController {

	@Autowired
	UserNoticesCommentService userNoticesCommentService;

	@Autowired
	UserNoticesService userNoticesService;

	private static final Logger Logger = LoggerFactory.getLogger(UserNoticesCommentController.class);

	@RequestMapping(value = "/user/notices_comment/{notices}/{notices_dataIdx}/list.do", method = RequestMethod.GET)
	public ModelAndView list(@PathVariable("notices") String notices,
			@ModelAttribute("UserNoticesCommentVo") UserNoticesCommentVo userNoticesCommentVo,
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
		
		userNoticesCommentVo.setNOTICES_IDX(notices);
		
		userNoticesCommentVo.setPAGE(Integer.parseInt(PAGE));
		userNoticesCommentVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = userNoticesCommentVo.getPAGE() * userNoticesCommentVo.getITEM_COUNT();
		
		userNoticesCommentVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		userNoticesCommentVo.setOFFSET(pagelimit);
		
		model = userNoticesCommentService.getList(userNoticesCommentVo);
		
		model.put("SEARCH_TYPE", userNoticesCommentVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", userNoticesCommentVo.getSEARCH_TEXT());
		
		if(userNoticesCommentVo.getSTART_TM().equals(""))
		{
			userNoticesCommentVo.setSTART_TM(SUtil.getNowDate());	
		}
		if(userNoticesCommentVo.getEND_TM().equals(""))
		{
			userNoticesCommentVo.setEND_TM(SUtil.getNowDate());	
		}
		
		model.put("beforeDomain", userNoticesCommentVo);
		model.put("noticesid", notices);
		
		model.put("NOTICES", NOTICESMAP);
		
		return new ModelAndView("user/notices_data/list", "model", model);	
			
	}


	@RequestMapping(value = "/user/notices_comment/{notices}/{notices_dataIdx}/insert.do", method = RequestMethod.POST)
	public void insertPost(@ModelAttribute("UserNoticesCommentVo") UserNoticesCommentVo userNoticesCommentVo, 
			@PathVariable("notices") String notices,
			@PathVariable("notices_dataIdx") String notices_dataIdx,
			HttpServletRequest  request,  HttpServletResponse response) throws IOException {
		
		ModelMap model = new ModelMap();
		

		userNoticesCommentVo.setNOTICES_IDX(notices);
		userNoticesCommentVo.setNOTICES_DATA_IDX(notices_dataIdx);
		int rtn = userNoticesCommentService.setInsert(userNoticesCommentVo);

		response.getWriter().println("true");
		//return "redirect:./list.do";
		
	}
	
	@RequestMapping(value = "/user/notices_comment/{notices}/{notices_dataIdx}/{notices_commentid}/delete.do", method = RequestMethod.POST)
	public void deletePost(@ModelAttribute("UserNoticesCommentVo") UserNoticesCommentVo userNoticesCommentVo,
			@PathVariable("notices_commentid") String notices_commentid,
			@PathVariable("notices_dataIdx") String notices_dataIdx,
			@PathVariable("notices") String notices,
			HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		ModelMap model = new ModelMap();

		//방어처리
		model = userNoticesCommentService.getView(notices_commentid);
		UserNoticesCommentVo vo = (UserNoticesCommentVo) model.get("pageDomain");
		if(vo.getMEMBER_ID().equals(SUtil.getUserId(request))
				|| SUtil.getUserLevel(request).equals("1"))
		{

			userNoticesCommentVo.setIDX(notices_commentid);
			boolean rtn = userNoticesCommentService.setDelete(userNoticesCommentVo);	
		}
		
		response.getWriter().println("true");
		
	}

}
