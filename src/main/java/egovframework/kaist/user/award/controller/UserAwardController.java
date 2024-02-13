package egovframework.kaist.user.award.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.kaist.admin.award.model.AdminAwardRequireVo;
import egovframework.kaist.admin.award.model.AdminAwardVo;
import egovframework.kaist.user.award.model.UserAwardRequireVo;
import egovframework.kaist.user.award.model.UserAwardVo;
import egovframework.kaist.user.award.service.UserAwardService;

@Controller
public class UserAwardController {

	@Autowired
	UserAwardService userAwardService;
	
	@RequestMapping(value="/user/award/list.do" , method = RequestMethod.GET)
	public ModelAndView UserAwardListGet(@ModelAttribute("UserAwardVo")UserAwardVo UserAwardVo , HttpServletRequest request , HttpServletResponse response) {
		
		System.out.println("PAGE : " + UserAwardVo.getPAGE());
		System.out.println("ITEM_COUNT : " + UserAwardVo.getITEM_COUNT());
		
		String PAGE = request.getParameter("PAGE") != null ? request
				.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request
				.getParameter("ITEM_COUNT") : "10";
		
		UserAwardVo.setPAGE(Integer.parseInt(PAGE));
		UserAwardVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		int pagelimit = UserAwardVo.getPAGE() * UserAwardVo.getITEM_COUNT();
		
		UserAwardVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		UserAwardVo.setOFFSET(pagelimit);
		
		ModelMap model = new ModelMap();
		
		model = userAwardService.getAllList(UserAwardVo);
		
		model.put("before", model);
		
		return new ModelAndView("user/award/list" , "model" , model);
		
	}
	
	@RequestMapping(value="/user/award/view.do" , method = RequestMethod.GET)
	public ModelAndView UserAwardUpdateGet(@ModelAttribute("UserAwardVo")UserAwardVo UserAwardVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = userAwardService.getAwardDataView(UserAwardVo);
		
		UserAwardRequireVo userAwardRequireVo = new UserAwardRequireVo();
		
		userAwardRequireVo.setAward_idx(UserAwardVo.getIdx());
		
		List<?> require = userAwardService.getRequireAllList(userAwardRequireVo);
		
		model.put("require", require);
		
		model.put("before", UserAwardVo);
		
		return new ModelAndView("user/award/view" , "model" , model);
		
	}
	
}
