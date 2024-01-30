package egovframework.kaist.admin.sms_log.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;

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

import egovframework.kaist.admin.member.model.AdminMemberVo;
import egovframework.kaist.admin.member.service.AdminMemberService;
import egovframework.kaist.admin.member_re.model.AdminMemberReVo;
import egovframework.kaist.admin.member_re.service.AdminMemberReService;
import egovframework.kaist.admin.sms_log.model.AdminSmsLogVo;
import egovframework.kaist.admin.sms_log.service.AdminSmsLogService;

@Controller
public class AdminSmsLogController {

	@Autowired
	AdminSmsLogService adminSmsLogService;

	@Autowired
	AdminMemberService adminMemberService;
	
	@Autowired
	AdminMemberReService adminMemberReService;

	private static final Logger Logger = LoggerFactory.getLogger(AdminSmsLogController.class);


	@RequestMapping(value = "/admin/sms_log/{type}/list.do", method = RequestMethod.GET)
	public ModelAndView list(
			@ModelAttribute("AdminSmsLogVo") AdminSmsLogVo adminSmsLogVo,
			@PathVariable("type") String type,
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
		
		ModelMap model = new ModelMap();
		
		int pagelimit = adminSmsLogVo.getPAGE() * adminSmsLogVo.getITEM_COUNT();
		
		adminSmsLogVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		adminSmsLogVo.setOFFSET(pagelimit);
		
		
		adminSmsLogVo.setLIMIT(10);
		adminSmsLogVo.setOFFSET(pagelimit);
		adminSmsLogVo.setTYPE(type);
		
		model = adminSmsLogService.getList(adminSmsLogVo);
		
		model.put("SEARCH_TYPE", adminSmsLogVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", adminSmsLogVo.getSEARCH_TEXT());
		
		
		model.put("beforeDomain", adminSmsLogVo);
		

		return new ModelAndView("admin/sms_log/list", "model", model);
	}

	@RequestMapping(value = "/admin/sms_log/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(HttpServletRequest request, HttpServletResponse response) 
	
	
	{

		ModelMap model = new ModelMap();
		
		String TYPE = (String) (request.getParameter("TYPE") != null ? request.getParameter("TYPE") : "1");
		
		if(TYPE == null || TYPE.equals(""))
		{
			TYPE = "1";
		}
		

		model.put("TYPE", TYPE);
		
		return new ModelAndView("admin/sms_log/insert", "model", model);
	}

	
	//회원 문자 controller
	@RequestMapping(value = "/admin/sms_log/{type}/insert.do", method = RequestMethod.POST)
	public void insertPost(
			@ModelAttribute("AdminSmsLogVo") AdminSmsLogVo adminSmsLogVo,
			@PathVariable("type") String type,
			HttpServletRequest  request,  HttpServletResponse response) throws NoSuchAlgorithmException, IOException {
		
		
		ModelMap model = new ModelMap();

		String listidx = adminSmsLogVo.getPHONE();
		String [] arrIdx = listidx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				AdminSmsLogVo userSmsLogDomain = new AdminSmsLogVo();
				userSmsLogDomain.setMEMBER_ID(SUtil.getUserId(request));
				ModelMap map = adminMemberService.getView(arrIdx[i]);
				AdminMemberVo vo =  (AdminMemberVo) map.get("pageDomain");
				String phone = vo.getPHONE();
				phone = phone.replace("-", "");
				phone = phone.replace(".", "");
				String message = adminSmsLogVo.getMESSAGE();
				
				userSmsLogDomain.setPHONE(phone);
				userSmsLogDomain.setTYPE(type);
				userSmsLogDomain.setMESSAGE(adminSmsLogVo.getMESSAGE());
				userSmsLogDomain.setRESERVATION(adminSmsLogVo.getRESERVATION());
				userSmsLogDomain.setRESERVATION_TM(adminSmsLogVo.getRESERVATION_TM());
				
				//발송 내역
				adminSmsLogService.setInsert(userSmsLogDomain);
				
				//문자 발송
				adminSmsLogService.smsSend(userSmsLogDomain);
			}
		}
		

		try {
			response.getWriter().print("true");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//신입생 문자 시스템 controller
	@RequestMapping(value = "/admin/sms_log/{type}/insert_re.do", method = RequestMethod.POST)
	public void insert_rePost(
			@ModelAttribute("AdminSmsLogVo") AdminSmsLogVo adminSmsLogVo,
			@PathVariable("type") String type,
			HttpServletRequest  request,  HttpServletResponse response) throws NoSuchAlgorithmException, IOException {
		
		ModelMap model = new ModelMap();

		String listidx = adminSmsLogVo.getPHONE();
		String [] arrIdx = listidx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				AdminSmsLogVo userSmsLogDomain = new AdminSmsLogVo();
				userSmsLogDomain.setMEMBER_ID(SUtil.getUserId(request));
				System.out.println(arrIdx[i]);
				ModelMap map = adminMemberReService.getView(arrIdx[i]);
				AdminMemberReVo vo =  (AdminMemberReVo) map.get("pageDomain");
				String phone = vo.getPHONE();
				phone = phone.replace("-", "");
				System.out.println("ddd"+phone);
				phone = phone.replace(".", "");
				System.out.println("sss"+phone);
				String message = adminSmsLogVo.getMESSAGE();
				
				userSmsLogDomain.setPHONE(phone);
				userSmsLogDomain.setTYPE(type);
				userSmsLogDomain.setMESSAGE(adminSmsLogVo.getMESSAGE());
				userSmsLogDomain.setRESERVATION(adminSmsLogVo.getRESERVATION());
				userSmsLogDomain.setRESERVATION_TM(adminSmsLogVo.getRESERVATION_TM());
				//발송내역 정보 입력
				adminSmsLogService.setInsert(userSmsLogDomain);
				
				String test_1 = adminSmsLogVo.getRESERVATION_TM();
				System.out.println(test_1);
				//발송내역 보낸뒤 시간이랑 날짜값 구분해서 넣어줌
				System.out.println("예약 여부?"+adminSmsLogVo.getRESERVATION_TM());
				System.out.println("여까진 오나?"+userSmsLogDomain.getMESSAGE());
				System.out.println("여까진 오나?"+userSmsLogDomain.getPHONE());
				System.out.println("dsadsa");
				if(test_1 == ""){
					System.out.println(userSmsLogDomain.getMESSAGE());
					System.out.println(userSmsLogDomain.getPHONE());
					//문자 발송
					adminSmsLogService.smsSend(userSmsLogDomain);
				}else {
					String date = adminSmsLogVo.getRESERVATION_TM();
					System.out.println(date);
					String time = date.substring(11);
					date = date.substring(0, 10);
					date = date.replace(".", "");
					time = time.replace(":","");
					time = time+"00";
					System.out.println("날짜??"+date);
					System.out.println("시간?"+time);
					userSmsLogDomain.setRESERVATION_DT(date);
					userSmsLogDomain.setRESERVATION_TM(time);
					System.out.println(userSmsLogDomain.getMESSAGE());
					System.out.println(userSmsLogDomain.getPHONE());
					
					System.out.println(userSmsLogDomain.getMESSAGE());
					System.out.println(userSmsLogDomain.getPHONE());
					//문자 발송
					adminSmsLogService.smsSend(userSmsLogDomain);
				}
				
			}
		}
		

		try {
			response.getWriter().print("true");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	//신입생 문자 전체 발송
	//신입생 문자 시스템 controller
		@RequestMapping(value = "/admin/sms_log/{type}/insert_pass.do", method = RequestMethod.POST)
		public void insert_passPost(
				@ModelAttribute("AdminSmsLogVo") AdminSmsLogVo adminSmsLogVo,
				@PathVariable("type") String type,
				HttpServletRequest  request,  HttpServletResponse response) throws NoSuchAlgorithmException, IOException {
			
			ModelMap model = new ModelMap();

			ModelMap pass_list = adminMemberReService.getListAll();
			List<HashMap> passlist = (List<HashMap>) pass_list.get("list");
			for(int i = 0; i < passlist.size(); i++ ) {
				HashMap tempMap = passlist.get(i);
				AdminSmsLogVo userSmsLogDomain = new AdminSmsLogVo();
				String phone = (String) tempMap.get("PHONE");
				phone = phone.replace(".", "");
				String message = adminSmsLogVo.getMESSAGE();
				userSmsLogDomain.setMEMBER_ID(SUtil.getUserId(request));
				
				if(phone.equals("")) {
					phone = (String) tempMap.get("TEL");
				}
				
				userSmsLogDomain.setPHONE(phone);
				userSmsLogDomain.setTYPE(type);
				userSmsLogDomain.setMESSAGE(adminSmsLogVo.getMESSAGE());
				userSmsLogDomain.setRESERVATION(adminSmsLogVo.getRESERVATION());
				userSmsLogDomain.setRESERVATION_TM(adminSmsLogVo.getRESERVATION_TM());

				String haha = adminSmsLogVo.getRESERVATION_TM();
				System.out.println("시간??"+haha);
				String hihi = adminSmsLogVo.getRESERVATION();
				System.out.println("날짜?"+hihi);
				
				//학생 발송내역
				adminSmsLogService.setInsert(userSmsLogDomain);
				
				//학생문자 발송
				adminSmsLogService.smsSend(userSmsLogDomain);
				
				phone = (String) tempMap.get("TEACHER_PHONE");
				
				userSmsLogDomain.setPHONE(phone);
				userSmsLogDomain.setTYPE(type);
				userSmsLogDomain.setMESSAGE(adminSmsLogVo.getMESSAGE());
				userSmsLogDomain.setRESERVATION(adminSmsLogVo.getRESERVATION());
				userSmsLogDomain.setRESERVATION_TM(adminSmsLogVo.getRESERVATION_TM());

				haha = adminSmsLogVo.getRESERVATION_TM();
				System.out.println("시간??"+haha);
				hihi = adminSmsLogVo.getRESERVATION();
				System.out.println("날짜?"+hihi);
				
				
				//멘토 발송내역
				adminSmsLogService.setInsert(userSmsLogDomain);
				
				//멘토문자 발송
				adminSmsLogService.smsSend(userSmsLogDomain);
				
				
			}
			try {
				response.getWriter().print("true");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	
	
	@RequestMapping(value = "/admin/sms_log/{sms_logid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("sms_logid") String sms_logid, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		
		model = adminSmsLogService.getView(sms_logid);

		return new ModelAndView("admin/sms_log/update", "model", model);
	}
	@RequestMapping(value = "/admin/sms_log/update.do", method = RequestMethod.GET)
	public ModelAndView update( HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		model = adminSmsLogService.getView(SUtil.getUserId(request));

		return new ModelAndView("admin/sms_log/update2", "model", model);
	}
	@RequestMapping(value = "/admin/sms_log/update.do", method = RequestMethod.POST)
	public void updatePost(@ModelAttribute("AdminSmsLogVo") AdminSmsLogVo adminSmsLogVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		boolean rtn = adminSmsLogService.setUpdate(adminSmsLogVo);

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

	@RequestMapping(value = "/admin/sms_log/delete.do", method = RequestMethod.POST)
	public void deletePost(@ModelAttribute("AdminSmsLogVo") AdminSmsLogVo adminSmsLogVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String year = request.getParameter("year") != null ? request.getParameter("year") : "";
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		boolean rtn = adminSmsLogService.setDelete(adminSmsLogVo);
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

	
	@RequestMapping(value = "/admin/sms_log/deleteArr.do", method = RequestMethod.POST)
	public void deleteArrPost(@ModelAttribute("AdminSmsLogVo") AdminSmsLogVo adminAgencyVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		String idx = adminAgencyVo.getMEMBER_ID();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				AdminSmsLogVo userSmsLogDomain = new AdminSmsLogVo();
				userSmsLogDomain.setMEMBER_ID(arrIdx[i]);
				adminSmsLogService.setDelete(userSmsLogDomain);		
			}
		}
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
}
