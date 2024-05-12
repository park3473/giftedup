package egovframework.kaist.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.system.util.SUtil;

import egovframework.kaist.admin.banner.model.AdminBannerVo;
import egovframework.kaist.admin.banner.service.AdminBannerService;
import egovframework.kaist.admin.popup.model.AdminPopupVo;
import egovframework.kaist.admin.popup.service.AdminPopupService;
import egovframework.kaist.user.member.service.UserMemberService;
import egovframework.kaist.user.notices_data.model.UserNoticesDataVo;
import egovframework.kaist.user.notices_data.service.UserNoticesDataService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class UserHomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserHomeController.class);

	
	@Autowired
	UserNoticesDataService userNoticesDataService;

	@Autowired
	UserMemberService UserMemberService;
	
	@Autowired
	AdminBannerService adminBannerService;
	
	@Autowired
	AdminPopupService adminPopupService;
	
	@RequestMapping(value="/Newindex.do" , method = RequestMethod.GET)
	public ModelAndView NewIndex(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("user/NewIndex");
	}
	
	@RequestMapping(value = {"/index.do","/view" , "/"}, method = RequestMethod.GET)
	public ModelAndView calender(HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();
		
		//공지사항
		UserNoticesDataVo userNoticesDataVo = new UserNoticesDataVo();
		
		userNoticesDataVo.setLIMIT(4);
		userNoticesDataVo.setPAGE(0);
		userNoticesDataVo.setNOTICES_IDX("1");
		
		ModelMap notices1 = userNoticesDataService.getList(userNoticesDataVo);
		
		
		//학생수
		int membercnt1 = UserMemberService.getMemberTypeCnt("1");
		//교수수
		
		int membercnt2 = UserMemberService.getMemberTypeCnt("2");
		//참여학교 수
		int schoolcnt = UserMemberService.getMemberSchoolCnt();
		
		
		
		//홍보자료
		userNoticesDataVo.setNOTICES_IDX("2");
		userNoticesDataVo.setLIMIT(4);
		ModelMap notices2 = userNoticesDataService.getList(userNoticesDataVo);
		
		//질문과 답
		userNoticesDataVo.setLIMIT(4);
		userNoticesDataVo.setNOTICES_IDX("3");
		userNoticesDataVo.setMEMBER_ID(SUtil.getUserId(request));
		ModelMap notices3 = userNoticesDataService.getList(userNoticesDataVo);
		
		//알림마당
		userNoticesDataVo.setLIMIT(4);
		userNoticesDataVo.setNOTICES_IDX("11");
		userNoticesDataVo.setMEMBER_ID("");
		ModelMap notices11 = userNoticesDataService.getList(userNoticesDataVo);
		
		//배너
		AdminBannerVo adminBannerVo = new AdminBannerVo();
		adminBannerVo.setLIMIT(99999);
		adminBannerVo.setPAGE(0);
		ModelMap banner = adminBannerService.getListStartEndTM(adminBannerVo);
		
		AdminPopupVo adminPopuprVo = new AdminPopupVo();
		adminPopuprVo.setLIMIT(99999);
		adminPopuprVo.setPAGE(0);
		ModelMap adminPopupr = adminPopupService.getListStartEndTM(adminPopuprVo);
		
		
		
		
		
		model.put("NOTICES11", notices11);
		
		model.put("NOTICES3", notices3);
		model.put("NOTICES1", notices1);
		model.put("NOTICES2", notices2);
		
		
		model.put("BANNER", banner);
		model.put("membercnt1", membercnt1);
		model.put("membercnt2", membercnt2);
		model.put("schoolcnt", schoolcnt);
		
		model.put("POPUP", adminPopupr);
		
		
		model.put("DATENOW", SUtil.getNowDateHang());
		
		return new ModelAndView("user/index", "model", model);	
		
		
	}
	
	@RequestMapping(value = "/user/test.do" , method = RequestMethod.GET)
	public ModelAndView TestMain(HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();
		
		//공지사항
		UserNoticesDataVo userNoticesDataVo = new UserNoticesDataVo();
		
		userNoticesDataVo.setLIMIT(3);
		userNoticesDataVo.setPAGE(0);
		userNoticesDataVo.setNOTICES_IDX("1");
		
		ModelMap notices1 = userNoticesDataService.getList(userNoticesDataVo);
		
		
		//학생수
		int membercnt1 = UserMemberService.getMemberTypeCnt("1");
		//교수수
		
		int membercnt2 = UserMemberService.getMemberTypeCnt("2");
		//참여학교 수
		int schoolcnt = UserMemberService.getMemberSchoolCnt();
		
		
		
		//홍보자료
		userNoticesDataVo.setNOTICES_IDX("2");
		userNoticesDataVo.setLIMIT(8);
		ModelMap notices2 = userNoticesDataService.getList(userNoticesDataVo);
		
		//질문과 답
		userNoticesDataVo.setLIMIT(3);
		userNoticesDataVo.setNOTICES_IDX("3");
		userNoticesDataVo.setMEMBER_ID(SUtil.getUserId(request));
		ModelMap notices3 = userNoticesDataService.getList(userNoticesDataVo);
		
		//알림마당
		userNoticesDataVo.setLIMIT(3);
		userNoticesDataVo.setNOTICES_IDX("11");
		userNoticesDataVo.setMEMBER_ID("");
		ModelMap notices11 = userNoticesDataService.getList(userNoticesDataVo);
		
		//배너
		AdminBannerVo adminBannerVo = new AdminBannerVo();
		adminBannerVo.setLIMIT(99999);
		adminBannerVo.setPAGE(0);
		ModelMap banner = adminBannerService.getListStartEndTM(adminBannerVo);
		
		AdminPopupVo adminPopuprVo = new AdminPopupVo();
		adminPopuprVo.setLIMIT(99999);
		adminPopuprVo.setPAGE(0);
		ModelMap adminPopupr = adminPopupService.getListStartEndTM(adminPopuprVo);
		
		
		
		
		
		model.put("NOTICES11", notices11);
		
		model.put("NOTICES3", notices3);
		model.put("NOTICES1", notices1);
		model.put("NOTICES2", notices2);
		
		
		model.put("BANNER", banner);
		model.put("membercnt1", membercnt1);
		model.put("membercnt2", membercnt2);
		model.put("schoolcnt", schoolcnt);
		
		model.put("POPUP", adminPopupr);
		
		
		model.put("DATENOW", SUtil.getNowDateHang());
		
		return new ModelAndView("user/test", "model", model);	
		
		
	}
	
							
	@RequestMapping(value = {"/user/subpage/{page}/index.do"}, method = RequestMethod.GET)
	public ModelAndView subpage(@PathVariable("page") String page,
			HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();

		session.setAttribute("requestURI", request.getRequestURI());
		
		ModelMap model = new ModelMap();
		String year = request.getParameter("year") != null ? request.getParameter("year") : "";
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";

		model.addAttribute("year", year );
		model.addAttribute("month", month );
		
		return new ModelAndView("user/subpage/"+page, model);	
		
	}
	@RequestMapping(value = {"/user/subpage/{type}/{page}/index.do"}, method = RequestMethod.GET)
	public ModelAndView subpage(@PathVariable("page") String page,
								@PathVariable("type") String type,
			HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();

		session.setAttribute("requestURI", request.getRequestURI());
		
		ModelMap model = new ModelMap();
		String year = request.getParameter("year") != null ? request.getParameter("year") : "";
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";

		model.addAttribute("year", year );
		model.addAttribute("month", month );
		
		return new ModelAndView("user/subpage/"+type+"/"+page, model);	
		
	}
	
	@RequestMapping(value="/Mobile.do" , method = RequestMethod.GET)
	public String MoblieWrap(HttpServletRequest request , HttpServletResponse response) {
		return "redirect:http://m.site.naver.com/0MoV7";
	}
	
	//22년도 헤더 부분 홍보자료 가져오기
	@RequestMapping(value="/user/header/pr.do" , method = RequestMethod.POST,produces = "application/json; charset=utf8" )
	@ResponseBody
	public String HeaderPr(HttpServletRequest request, HttpServletResponse response ) throws JsonProcessingException{
		
		
		//홍보자료
		UserNoticesDataVo userNoticesDataVo = new UserNoticesDataVo();
		userNoticesDataVo.setNOTICES_IDX("2");
		userNoticesDataVo.setLIMIT(8);
		List<UserNoticesDataVo> notices2 = userNoticesDataService.getHeaderPrList(userNoticesDataVo);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(notices2);
		
		return jsonStr;
	}
	
	
	
	
}
