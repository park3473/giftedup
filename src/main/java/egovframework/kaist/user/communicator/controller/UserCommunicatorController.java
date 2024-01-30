package egovframework.kaist.user.communicator.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.system.util.SUtil;

import egovframework.kaist.admin.sms_log.model.AdminSmsLogVo;
import egovframework.kaist.admin.sms_log.service.AdminSmsLogService;
import egovframework.kaist.user.communicator.service.UserCommunicatorService;
import egovframework.kaist.user.communicator.model.UserCommStudentVo;
import egovframework.kaist.user.communicator.model.UserCommunicatorVo;
import egovframework.kaist.user.communicator.model.UserSuppliesVo;
import egovframework.kaist.user.communicator.model.UserZoomVo;
import egovframework.kaist.user.member.model.UserMemberVo;
import egovframework.kaist.user.member.service.UserMemberService;
import net.sf.jxls.transformation.Transformation;

@Controller
public class UserCommunicatorController {

	
	@Autowired
	UserCommunicatorService userCommunicatorService;
	
	@Autowired
	UserMemberService userMemberService;
	
	@Autowired
	AdminSmsLogService adminSmsLogService;
	
	// mypage 관련 start //
	@RequestMapping(value = "/user/mypage/communicator/list.do" , method = RequestMethod.GET)
	public ModelAndView CommList(@ModelAttribute("UserCommunicatorVo")UserCommunicatorVo UserCommunicatorVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		HttpSession session = request.getSession();
		
		if(UserCommunicatorVo.getYEAR().equals("") || UserCommunicatorVo.getYEAR() == null) {
		
			Calendar cal = Calendar.getInstance();
		
		int year = cal.get(cal.YEAR);
		
		String Year = String.valueOf(year);
		
		UserCommunicatorVo.setYEAR(Year);
		
		}
		
		UserCommunicatorVo.setPREVIOUS(UserCommunicatorVo.getYEAR()+"0301");
		
		int year = Integer.parseInt(UserCommunicatorVo.getYEAR());
		
		year = year +1;
		
		String YEAR = String.valueOf(year);
		
		UserCommunicatorVo.setNEXT(YEAR+"0228");
		
		String type = (String) session.getAttribute("ssion_member_type");
		
		if(type.equals("1")) {
			
			UserCommunicatorVo.setSTU_MEMBER_ID((String) session.getAttribute("ssion_user_id"));
			model = userCommunicatorService.getStudentList(UserCommunicatorVo);
			
		}else if(type.equals("2")) {
			UserCommunicatorVo.setCOMM_MENTO((String) session.getAttribute("ssion_user_id"));
			model = userCommunicatorService.getMentoList(UserCommunicatorVo);
		}
		
		return new ModelAndView("/user/mypage/communicator/list" , "model" , model );
	}
	
	@RequestMapping(value="/user/mypage/communicator/listCnt.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public String listCnt(@ModelAttribute("UserCommunicatorVo")UserCommunicatorVo UserCommunicatorVo , HttpServletRequest request , HttpServletResponse response) throws JsonProcessingException {
		
		HttpSession session = request.getSession();
		UserCommunicatorVo.setSTU_MEMBER_ID((String) session.getAttribute("ssion_user_id"));
		
		int result = userCommunicatorService.getStudentListCnt(UserCommunicatorVo);
		
		
		System.out.println("result = : " + result);
		
		String data = Integer.toString(result);
		
		return data;
	}
	
	
	@RequestMapping(value = "/user/mypage/communicator/studentlist.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public String StudentList(@ModelAttribute("UserCommStudent")UserCommStudentVo UserCommStudentVo , HttpServletRequest request , HttpServletResponse response) throws JsonProcessingException{
		
		List<?> StudentPersonnelList = userCommunicatorService.getStudentPersonnelList(UserCommStudentVo);
		
		ObjectMapper mapper = new ObjectMapper();
		
		String jsonStr = mapper.writeValueAsString(StudentPersonnelList);
		
		return jsonStr;
		
	}
	
	
	@RequestMapping(value="/user/mypage/communicator/insert.do" , method = RequestMethod.GET)
	public ModelAndView CommInsertGet(@ModelAttribute("UserMemberVo")UserMemberVo UserMemberVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		
		HttpSession session = request.getSession();
		
		UserMemberVo.setMEMBER_ID((String) session.getAttribute("ssion_user_id"));

		model = userCommunicatorService.getMentoStat(UserMemberVo);
		
		
		return new ModelAndView("/user/mypage/communicator/insert" , "model" , model);
	}
	
	@RequestMapping(value="/user/mypage/communicator/insert.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public String CommInsert(@ModelAttribute("UserCommunicatorVo")UserCommunicatorVo UserCommunicatorVo , MultipartHttpServletRequest  request , HttpServletResponse response) {
		System.out.println("=====1====");
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/communicator/";
		System.out.println(drv);
		String filename = SUtil.setFileUpload(request, drv);
		System.out.println("======2====");
		UserCommunicatorVo.setCOMM_FILE(filename);
		String PKey = userCommunicatorService.setComm(UserCommunicatorVo);
		System.out.println(PKey);
		return  PKey;
	}
	
	
	@RequestMapping(value="/user/mypage/communicator/SupInsert.do" ,method = RequestMethod.POST)
	public void CommSupInsert(@ModelAttribute("UserSuppliesVo")UserSuppliesVo UserSuppliesVo , HttpServletRequest request , HttpServletResponse response) {
		
		
		userCommunicatorService.setSupplies(UserSuppliesVo);
		
	}
	
	
	@RequestMapping(value="/user/mypage/communicator/view.do" , method = RequestMethod.GET)
	public ModelAndView CommMyView(@ModelAttribute("UserCommunicatorVo")UserCommunicatorVo UserCommunicatorVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = userCommunicatorService.getView(UserCommunicatorVo);
		
		
		return new ModelAndView("/user/mypage/communicator/view" , "model" , model);
	}
	
	@RequestMapping(value="/user/mypage/communicator/delete.do" , method = RequestMethod.GET)
	public String CommDelete(@ModelAttribute("UserCommunicatorVo")UserCommunicatorVo UserCommunicatorVo , HttpServletRequest request , HttpServletResponse response) {
		
		userCommunicatorService.DelComm(UserCommunicatorVo);
		
		return "redirect:/user/mypage/communicator/list.do";
	}
	
	@RequestMapping(value="/user/mypage/communicator/CommClose.do" , method = RequestMethod.GET)
	public String CommClose(@ModelAttribute("UserCommunicatorVo")UserCommunicatorVo UserCommunicatorVo , HttpServletRequest request , HttpServletResponse response) throws NoSuchAlgorithmException, IOException {
		
		
		ModelMap map = userCommunicatorService.getStudentAndSupList(UserCommunicatorVo);
		
		List<HashMap> StudentList = (List<HashMap>) map.get("StudentList");
		
		UserCommunicatorVo Comm = (UserCommunicatorVo) map.get("CommView");
		
		AdminSmsLogVo userSmsLogDomain = new AdminSmsLogVo();
		
		String message = "";
		
		for(int j = 0; j < StudentList.size(); j++) {
			HashMap StudentMap = StudentList.get(j);	
			
			System.out.println(j + "번째 학생 : " +StudentMap.get("STU_NAME"));
			
			message = StudentMap.get("NAME") + "학생이 신청했던\n" + Comm.getCOMM_NAME() + "의 강의가 폐강되었습니다.\n";
			
			System.out.println(StudentMap.get("PHONE"));
			System.out.println(message);
			userSmsLogDomain.setPHONE(StudentMap.get("PHONE")+"");
			userSmsLogDomain.setTYPE("0");
			userSmsLogDomain.setMESSAGE(message);
			userSmsLogDomain.setSMS_TYPE("L");
			adminSmsLogService.smsSend(userSmsLogDomain);
		}
		
		userCommunicatorService.DelComm(UserCommunicatorVo);
		
		
		return "redirect:/user/mypage/communicator/list.do";
	}
	
	@RequestMapping(value = "/user/mypage/communicator/update.do" , method = RequestMethod.GET)
	public ModelAndView CommUpdate(@ModelAttribute("UserCommunicatorVo")UserCommunicatorVo UserCommunicatorVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = userCommunicatorService.getView(UserCommunicatorVo); 
		
		return new ModelAndView("/user/mypage/communicator/update" , "model" , model);
	}
	@RequestMapping(value="/user/mypage/communicator/update.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public String CommUpdate(@ModelAttribute("UserCommunicatorVo")UserCommunicatorVo UserCommunicatorVo , MultipartHttpServletRequest  request , HttpServletResponse response) {
		
		
		
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/communicator/";
		System.out.println(drv);
		String filename = SUtil.setFileUpload(request, drv);
		UserCommunicatorVo.setCOMM_FILE(filename);
			
		userCommunicatorService.UpCOMM(UserCommunicatorVo);
		
		String PKey = UserCommunicatorVo.getCOMM_IDX();
		System.out.println(PKey);
		return  PKey;
	}
	
	@RequestMapping(value="/user/mypage/communicator/SupUpdate.do" , method = RequestMethod.POST)
	public void SupUpdate(@ModelAttribute("UserSuppliesVo")UserSuppliesVo UserSuppliesVo , HttpServletRequest request , HttpServletResponse response){
		
		userCommunicatorService.UpSupplies(UserSuppliesVo);
		
	}
	
	@RequestMapping(value = "/user/mypage/communicator/CommApplyStart.do" , method = RequestMethod.GET)
	public String CommAppluStart(@ModelAttribute("UserCommunicatorVo")UserCommunicatorVo UserCommunicatorVo , HttpServletRequest  request , HttpServletResponse response) {
		// 현재 상태 변경 0=>1 지원 신청 시작
		userCommunicatorService.setCommStat(UserCommunicatorVo);
		
		return "redirect:./list.do";
		
	}
	
	@RequestMapping(value = "/user/mypage/communicator/CommApplyEnd.do" , method = RequestMethod.GET)
	public String CommAppluEnd(@ModelAttribute("UserCommunicatorVo")UserCommunicatorVo UserCommunicatorVo , @ModelAttribute("UserZoomVo")UserZoomVo UserZoomVo , HttpServletRequest  request , HttpServletResponse response) throws NoSuchAlgorithmException, IOException, ParseException {
		// 현재 상태 변경 1=>2 지원 신청 마감
		userCommunicatorService.setCommStat(UserCommunicatorVo);
		// 신청한 학생 리스트 및 준비물 리스트 불러오기
		ModelMap map = userCommunicatorService.getStudentAndSupList(UserCommunicatorVo);
		
		//2023 - ZOOM 대신 다른거
		//userCommunicatorService.setZoomLog(UserZoomVo);
		
		List<HashMap> StudentList = (List<HashMap>) map.get("StudentList");
		
		//List<HashMap> SupList = (List<HashMap>) map.get("SupList");
		
		UserCommunicatorVo Comm = (UserCommunicatorVo) map.get("CommView");
		
		AdminSmsLogVo userSmsLogDomain = new AdminSmsLogVo();
		
		
		
		String message = "";
		
		String Student_message = "";
		
		System.out.println(StudentList.size());
		
		for(int j = 0; j < StudentList.size(); j++) {
			HashMap StudentMap = StudentList.get(j);	
			
			System.out.println(j + "번째 학생 : " +StudentMap.get("STU_NAME"));
			
			message = StudentMap.get("NAME") + "학생이 신청했던\n" + Comm.getCOMM_NAME() + "의 강의 접수가 마감되었습니다.\n추후 강의 당일날 및 강의 시작시 학생에게 웨일ON 회의실 관련 링크가 보내질 예정입니다.\n담당멘토 선생님들께서는 학생이 강의에 참여할수 있도록 확인부탁드립니다.\n";
			
			/*
			 * System.out.println(SupList.size()); if(SupList.size() > 0) {
			 * 
			 * message += "해당 강의에 대한 준비물은 아래와 같습니다.\n";
			 * 
			 * for(int i = 0; i < SupList.size(); i++) { HashMap tempMap = SupList.get(i);
			 * message += i+1+"번 \n"; message += "준비물 명 : "; message +=
			 * tempMap.get("SUP_NAME")+"\n"; message += "준비물 링크 : "; message +=
			 * tempMap.get("SUP_LINK")+"\n"; message += "준비물 갯수 : "; message +=
			 * tempMap.get("SUP_AMOUNT")+"\n"; message += "준비물 가격 : "; message +=
			 * tempMap.get("SUP_PRICE")+"원\n";
			 * 
			 * System.out.println(i + "번째 메세지" +message);
			 * 
			 * }
			 * 
			 * }else {
			 * 
			 * message += "해당 강의에 대한 준비물은 없습니다."; }
			 */
			
			
			System.out.println(StudentMap.get("MENTO_PHONE"));
			System.out.println(message);
			userSmsLogDomain.setPHONE(StudentMap.get("MENTO_PHONE")+"");
			userSmsLogDomain.setTYPE("0");
			userSmsLogDomain.setMESSAGE(message);
			userSmsLogDomain.setSMS_TYPE("L");
			adminSmsLogService.smsSend(userSmsLogDomain);
			
			System.out.println("====문자 완료======");
		
			String Start_tm = String.valueOf(Comm.getCOMM_START_TM());
			
			Start_tm = Start_tm.substring(0,10);
			
			String Start_timing = String.valueOf(Comm.getCOMM_START_TM());
			
			Start_timing = Start_timing.substring(11,19);
			
			Start_timing = Start_timing.replaceAll(":", "");
			
			Calendar cal = Calendar.getInstance();
			
			SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			Date Start_time = beforeFormat.parse(Start_tm);
			
			cal.setTime(Start_time);
			
			cal.add(Calendar.DATE, -1);
			
			String Start_date = beforeFormat.format(cal.getTime());
			
			Start_date = Start_date.replaceAll("-", "");
			
			System.out.println("강의날짜 -1 ="+cal.getTime());
			
			Date now = new Date();
			
			System.out.println("현재날짜"+now);
			
			if(now.before(cal.getTime())) {
				System.out.println("전임");
				
				//학생에게 보내는 message 예약..

				Student_message = "내일 강의가 진행됩니다!\n";
				Student_message += "웨일ON 회의실 번호 ["+UserCommunicatorVo.getCOMM_ON_ID()+"] \n";
				Student_message += "비밀번호 ["+UserCommunicatorVo.getCOMM_ON_PW()+"] \n";
				Student_message += "회의실 링크 : " + UserCommunicatorVo.getCOMM_ON_LINK()+ "";
				
				System.out.println(Start_date);
				System.out.println(Start_timing);
				
				userSmsLogDomain.setPHONE(StudentMap.get("STU_PHONE")+"");
				userSmsLogDomain.setSMS_TYPE("L");
				userSmsLogDomain.setMESSAGE(Student_message);
				userSmsLogDomain.setRESERVATION_DT(Start_date);
				userSmsLogDomain.setRESERVATION_TM(Start_timing);
				adminSmsLogService.smsSend(userSmsLogDomain);
				//보낸후 예약 설정 초기화
				userSmsLogDomain.setRESERVATION_DT("");
				userSmsLogDomain.setRESERVATION_TM("");
				
			}else {
				System.out.println("아님");
			}
			
		}
		
		
		return "redirect:./list.do";
		
	}



	@RequestMapping(value = "/user/mypage/communicator/CommPreparation.do" , method = RequestMethod.GET)
	public String CommPreparation(@ModelAttribute("UserCommunicatorVo")UserCommunicatorVo UserCommunicatorVo , @ModelAttribute("UserZoomVo")UserZoomVo UserZoomVo, HttpServletRequest  request , HttpServletResponse response) throws NoSuchAlgorithmException, IOException{
		
		userCommunicatorService.setCommStat(UserCommunicatorVo);
		
		ModelMap model = new ModelMap();
		
		model = userCommunicatorService.getStudentAndSupList(UserCommunicatorVo);
		
		List<HashMap> StudentList = (List<HashMap>) model.get("StudentList");
		
		AdminSmsLogVo userSmsLogDomain = new AdminSmsLogVo();
		
		HttpSession session = request.getSession();
		
		String message = "";
		
		
		System.out.println(StudentList.size());
		
		for(int j = 0; j < StudentList.size(); j++) {
			HashMap StudentMap = StudentList.get(j);	
			
			System.out.println(j + "번째 학생 : " +StudentMap.get("STU_NAME"));
			
			message = "강의가 곧 시작합니다!\n";
			message += "웨일ON 회의실 번호 ["+UserCommunicatorVo.getCOMM_ON_ID()+"] \n";
			message += "비밀번호 ["+UserCommunicatorVo.getCOMM_ON_PW()+"] \n";
			message += "회의실 링크 : " + UserCommunicatorVo.getCOMM_ON_LINK()+ "";
			
			
			System.out.println(StudentMap.get("PHONE"));
			System.out.println(message);
			userSmsLogDomain.setPHONE(StudentMap.get("PHONE")+"");
			userSmsLogDomain.setTYPE("0");
			userSmsLogDomain.setMESSAGE(message);
			userSmsLogDomain.setSMS_TYPE("L");
			adminSmsLogService.smsSend(userSmsLogDomain);
		}
		
		return "redirect:./list.do"; 
	}
	
	@RequestMapping(value = "/user/mypage/communicator/CommStart.do" , method = RequestMethod.GET)
	public String CommStart(@ModelAttribute("UserCommunicatorVo")UserCommunicatorVo UserCommunicatorVo , @ModelAttribute("UserZoomVo")UserZoomVo UserZoomVo, HttpServletRequest  request , HttpServletResponse response) throws NoSuchAlgorithmException, IOException{
		
		userCommunicatorService.setCommStat(UserCommunicatorVo);
		
		ModelMap model = new ModelMap();
		
		HttpSession session = request.getSession();
		
		model = userCommunicatorService.getStudentAndSupList(UserCommunicatorVo);
		
		UserZoomVo.setZOOM_MEMBER_ID((String) session.getAttribute("ssion_user_id"));
		
		UserZoomVo userzoom = userCommunicatorService.getZoom(UserZoomVo);
		
		List<HashMap> StudentList = (List<HashMap>) model.get("StudentList");
		
		AdminSmsLogVo userSmsLogDomain = new AdminSmsLogVo();
		
		String message = "";
		
		
		for(int j = 0; j < StudentList.size(); j++) {
			HashMap StudentMap = StudentList.get(j);	
			
			System.out.println(j + "번째 학생 : " +StudentMap.get("STU_NAME"));
			
			message = "강의가 시작하였습니다!\n";
			message += "웨일ON 회의실 번호 ["+UserCommunicatorVo.getCOMM_ON_ID()+"] \n";
			message += "비밀번호 ["+UserCommunicatorVo.getCOMM_ON_PW()+"] \n";
			message += "회의실 링크 : " + UserCommunicatorVo.getCOMM_ON_LINK()+ "";
			
			
			System.out.println(StudentMap.get("PHONE"));
			System.out.println(message);
			userSmsLogDomain.setPHONE(StudentMap.get("PHONE")+"");
			userSmsLogDomain.setTYPE("0");
			userSmsLogDomain.setMESSAGE(message);
			userSmsLogDomain.setSMS_TYPE("L");
			adminSmsLogService.smsSend(userSmsLogDomain);
		}
		
		return "redirect:./list.do"; 
	}
	
	@RequestMapping(value="/user/mypage/communicator/CommEnd.do" , method = RequestMethod.GET)
	public String CommEnd(@ModelAttribute("UserCommunicatorVo")UserCommunicatorVo UserCommunicatorVo , @ModelAttribute("UserZoomVo")UserZoomVo UserZoomVo, HttpServletRequest  request , HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		userCommunicatorService.setCommStat(UserCommunicatorVo);
		
		return "redirect:./list.do";
	}
	
	@RequestMapping(value="/user/mypage/communicator/StudentEvalUpdate.do" , method = RequestMethod.POST)
	public void CommStudentEval(@ModelAttribute("UserCommStudent")UserCommStudentVo UserCommStudentVo , HttpServletRequest request , HttpServletResponse response) {
		
		userCommunicatorService.setStudentEval(UserCommStudentVo);
		
	}
	
	@RequestMapping(value = "/user/mypage/communicator/ZoomList.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public String ZoomList(@ModelAttribute("UserZoomVo")UserZoomVo UserZoomVo , HttpServletRequest request , HttpServletResponse response) throws JsonProcessingException{
		
		List<?> ZoomList = userCommunicatorService.getZoomList(UserZoomVo);
		
		ObjectMapper mapper = new ObjectMapper();
		
		String jsonStr = mapper.writeValueAsString(ZoomList);
		
		return jsonStr;
		
	} 
	
	@RequestMapping(value = "/user/mypage/communicator/GetZoom.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public String GetZoom(@ModelAttribute("UserZoomVo")UserZoomVo UserZoomVo ,HttpServletRequest request , HttpServletResponse response) throws JsonProcessingException{
		
		List<?> GetZoom = userCommunicatorService.getZoomView(UserZoomVo);
		
		ObjectMapper mapper = new ObjectMapper();
		
		String jsonStr = mapper.writeValueAsString(GetZoom);
		
		return jsonStr;
		
	}
	
	// mypage 관련 end //
	
	// 기본 관련 start //
	
	@RequestMapping(value = "/user/communicator/list.do" , method = RequestMethod.GET)
	public ModelAndView CommAllList(@ModelAttribute("UserCommunicatorVo")UserCommunicatorVo UserCommunicatorVo , HttpServletRequest  request , HttpServletResponse response) {
		
		String PAGE = request.getParameter("PAGE") != null ? request
				.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request
				.getParameter("ITEM_COUNT") : "10";
		
		System.out.println("PAGE = " + PAGE);
		if(PAGE == null)
		{
			PAGE ="0";
		}
		if(ITEM_COUNT == null)
		{
			ITEM_COUNT = "10";
		}
		
		UserCommunicatorVo.setPAGE(Integer.parseInt(PAGE));
		UserCommunicatorVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		int pagelimit = UserCommunicatorVo.getPAGE() * UserCommunicatorVo.getITEM_COUNT();
		
		UserCommunicatorVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		UserCommunicatorVo.setOFFSET(pagelimit);
		
		HttpSession session = request.getSession();
		
		ModelMap model = new ModelMap();
		
		String type = (String) session.getAttribute("ssion_member_type");
		
		if(type.equals("1")) {
			UserCommunicatorVo.setCOMM_SCHOOL_YEAR((String) session.getAttribute("session_school_year"));
			
			model = userCommunicatorService.getList(UserCommunicatorVo);
			
			
		}else if(type.equals("2")) {
			model = userCommunicatorService.getList(UserCommunicatorVo);
		}
		
		
		model.put("beforeDomain", UserCommunicatorVo);
		
		return new ModelAndView("/user/communicator/list" , "model" , model);
		
	}
	
	@RequestMapping(value="/user/communicator/view.do" , method = RequestMethod.GET)
	public ModelAndView CommView(@ModelAttribute("UserCommunicatorVo")UserCommunicatorVo UserCommunicatorVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = userCommunicatorService.getView(UserCommunicatorVo);
		
		
		return new ModelAndView("/user/communicator/view" , "model" , model);
	}
	
	@RequestMapping(value="/user/communicator/participate.do" , method = RequestMethod.GET)
	public String CommStudentParticipate(@ModelAttribute("UserCommStudentVo")UserCommStudentVo UserCommStudentVo , HttpServletRequest request , HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		String member_id = (String) session.getAttribute("ssion_user_id");
		
		ModelMap model = new ModelMap();
		
		model = userMemberService.getView(member_id);
		
		UserMemberVo userMemberVo = (UserMemberVo) model.get("pageDomain");
		
		UserCommStudentVo.setSTU_MEMBER_ID(userMemberVo.getMEMBER_ID());
		UserCommStudentVo.setSTU_NAME(userMemberVo.getNAME());
		UserCommStudentVo.setSTU_PHONE(userMemberVo.getPHONE());
		UserCommStudentVo.setSTU_SCHOOL_NAME(userMemberVo.getSCHOOL_NAME());
		UserCommStudentVo.setSTU_SCHOOL_YEAR(userMemberVo.getSCHOOL_YEAR());
		
		userCommunicatorService.setStudentParticipate(UserCommStudentVo);
		
		return "redirect:./list.do";
		
	}
	
	@RequestMapping(value="/user/communicator/TimeCheck.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public String CommTimeCheck(@ModelAttribute("UserCommunicatorVo")UserCommunicatorVo UserCommunicatorVo , HttpServletRequest  request , HttpServletResponse response) throws JsonProcessingException {
		
		int CommTimeCnt = userCommunicatorService.getCommTimeCnt(UserCommunicatorVo);
		
		String result = "";
		if(CommTimeCnt >= 6) {
			result = "NO";
		}else {
			result = "OK";
		}
		
		ObjectMapper mapper = new ObjectMapper();
		
		String jsonStr = mapper.writeValueAsString(result);
		
		return jsonStr;
	}
	
	
	@RequestMapping(value="/user/communicator/studentdelete.do" , method = RequestMethod.GET)
	public String CommStudentDelete(@ModelAttribute("UserCommStudentVo")UserCommStudentVo UserCommStudentVo , HttpServletRequest request , HttpServletResponse response) {
		
		userCommunicatorService.setStudentDelete(UserCommStudentVo);
		
		return "redirect:./list.do";
	}
	
	@RequestMapping(value="/user/mypage/communicator/studentdelete.do" , method = RequestMethod.POST)
	public void CommStudentDeleteAjax(@ModelAttribute("UserCommStudentVo")UserCommStudentVo UserCommStudentVo , HttpServletRequest request , HttpServletResponse response) {
		
		userCommunicatorService.setStudentDelete(UserCommStudentVo);
		
	}
	
}
