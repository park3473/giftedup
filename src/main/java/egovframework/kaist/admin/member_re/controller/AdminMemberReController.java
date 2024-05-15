﻿package egovframework.kaist.admin.member_re.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.enterprise.inject.Model;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.system.util.SUtil;

import egovframework.kaist.admin.MemberConfigVo;
import egovframework.kaist.admin.buseo.service.AdminBuseoService;
import egovframework.kaist.admin.config.service.AdminConfigService;
import egovframework.kaist.admin.dcmnt.model.DcmntVo;
import egovframework.kaist.admin.dcmnt.service.AdminDcmntService;
import egovframework.kaist.admin.matching.model.AdminMatchingVo;
import egovframework.kaist.admin.member_re.model.AdminDcmntFileVo;
import egovframework.kaist.admin.member_re.model.AdminDcmntVo;
import egovframework.kaist.admin.member_re.model.AdminMemberReVo;
import egovframework.kaist.admin.member_re.service.AdminMemberReService;
import egovframework.kaist.admin.sms_log.model.AdminSmsLogVo;
import egovframework.kaist.admin.sms_log.service.AdminSmsLogService;
import egovframework.kaist.user.member_re.model.UserMemberReDocumentVo;
import egovframework.kaist.user.member_re.model.UserMemberReVo;

@Controller
public class AdminMemberReController {

	@Autowired
	AdminMemberReService adminMember_reService;

	@Autowired
	AdminDcmntService adminDcmntService;
	
	@Autowired
	AdminBuseoService adminBuseoService;
	
	@Autowired
	AdminConfigService adminConfigService;
	
	@Autowired
	AdminSmsLogService adminSmsLogService;
	
	private static final Logger Logger = LoggerFactory.getLogger(AdminMemberReController.class);
	
	/* 신입생 선발 지원 - 접수자 관리 시작 */
	
	//신입생 선발 지원 리스트 - 접수자 관리
	@RequestMapping(value = "/admin/member_re/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("AdminMember_reVo") AdminMemberReVo adminMember_reVo,
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

		adminMember_reVo.setPAGE(Integer.parseInt(PAGE));
		adminMember_reVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		ModelMap model = new ModelMap();
	
		int pagelimit = adminMember_reVo.getPAGE() * adminMember_reVo.getITEM_COUNT();
		
		adminMember_reVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		adminMember_reVo.setOFFSET(pagelimit);
		
		//지역별 관리자 확인 1.session에 지역확인 2.sutil 에 저장된 배열 받기(지역관리)
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("ssion_local_type") != null && session.getAttribute("ssion_local_type") != "전체") {
			
			String LOCAL = (String) session.getAttribute("ssion_local_type");
			System.out.println(LOCAL);
			
			List <String> LO_TYPE = SUtil.getLO_TYPE_LIST(LOCAL);
			
			adminMember_reVo.setLO_LIST(LO_TYPE);
			
			adminMember_reVo.setLO_TYPE("TRUE");
		
		}
		
		model = adminMember_reService.getList(adminMember_reVo);
		
		
		model.put("SEARCH_TYPE", adminMember_reVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", adminMember_reVo.getSEARCH_TEXT());
		
		model.put("beforeDomain", adminMember_reVo);

		return new ModelAndView("admin/member_re/list", "model", model);
	}

	//신입생 선발 지원 리스트 - 접수자 정보 확인 및 수정 페이지 이동
	@RequestMapping(value="/admin/member_re/update.do" , method = RequestMethod.GET)
	public ModelAndView MemberReUpdateGet(@ModelAttribute("AdminMember_reVo") AdminMemberReVo adminMember_reVo,
			HttpServletRequest request, HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = adminMember_reService.getMemberReView(adminMember_reVo);
		
		model.put("beforeData", adminMember_reVo);
		
		return new ModelAndView("/admin/member_re/update" , "model" , model);
		
	}
	
	//신입생 선발 지원 리스트 - 접수자 정보 수정
	@RequestMapping(value="/admin/member_re/update.do" , method = RequestMethod.POST)
	public void MemberReUpdatePost(@ModelAttribute("AdminMember_reVo")AdminMemberReVo adminMember_reVo , @ModelAttribute("AdminDcmntFileVo")AdminDcmntFileVo AdminDcmntFileVo , HttpServletRequest request , HttpServletResponse response) {
		
		
		adminMember_reService.setMemberReUpdate(adminMember_reVo);
		System.out.println("???---1---");
		AdminDcmntFileVo.setMEMBER_IDX(adminMember_reVo.getIDX());
		AdminDcmntFileVo.setMEMBER_NAME(adminMember_reVo.getNAME());
		System.out.println("???---2---");
		adminMember_reService.setMemberReFileNameChage(AdminDcmntFileVo);
		System.out.println("???---3---");
	}
	
	//신입생 선발 지원 리스트 - 접수자 정보 삭제
	@RequestMapping(value="/admin/member_re/delete.do" , method = RequestMethod.POST)
	public void MemberReDelete(@ModelAttribute("AdminMember_reVo")AdminMemberReVo adminMember_reVo , @ModelAttribute("AdminDcmntFileVo")AdminDcmntFileVo AdminDcmntFileVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminMember_reService.setMemberReDelete(adminMember_reVo);
		
	}
	
	//신입생 선발 지원 리스트 - 접수자 관리 합격 처리
	@RequestMapping(value="/admin/member_re/pass.do" , method = RequestMethod.POST)
	public void MemberRePassPost(@ModelAttribute("AdminMember_reVo")AdminMemberReVo adminMember_reVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminMember_reService.setMemberRePass(adminMember_reVo);
		
	}
	
	//신입생 선발 지원 리스트 - 접수자 관리 합격 처리
	@RequestMapping(value="/admin/member_re/passDown.do" , method = RequestMethod.POST)
	public void MemberRePassDownPost(@ModelAttribute("AdminMember_reVo")AdminMemberReVo adminMember_reVo , HttpServletRequest request , HttpServletResponse response) {
			
		adminMember_reService.setMemberRePassDown(adminMember_reVo);
			
	}
	
	/* 신입생 선발 지원 - 접수자 관리 종료 */
	
	/* 신입생 선발 지원 - 합격자 관리 시작 */
	@RequestMapping(value="/admin/member_re/pass.do" , method =RequestMethod.GET)
	public ModelAndView MemberRePassGet(@ModelAttribute("AdminMember_reVo")AdminMemberReVo adminMember_reVo , HttpServletRequest request , HttpServletResponse response) {
		
		String PAGE = request.getParameter("PAGE") != null ? request
				.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request
				.getParameter("ITEM_COUNT") : "10";
		
		String RESULT = request.getParameter("RESULT") != null ? request.getParameter("RESULT") : "pass" ;
			
		adminMember_reVo.setRESULT(RESULT);
		
		if(PAGE == null)
		{
			PAGE = "0";
		}
		
		if(ITEM_COUNT == null)
		{
			ITEM_COUNT = "10";
		}

		adminMember_reVo.setPAGE(Integer.parseInt(PAGE));
		adminMember_reVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		ModelMap model = new ModelMap();
	
		int pagelimit = adminMember_reVo.getPAGE() * adminMember_reVo.getITEM_COUNT();
		
		adminMember_reVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		adminMember_reVo.setOFFSET(pagelimit);
		
		//지역별 관리자 확인 1.session에 지역확인 2.sutil 에 저장된 배열 받기(지역관리)
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("ssion_local_type") != null && session.getAttribute("ssion_local_type") != "전체") {
			
			String LOCAL = (String) session.getAttribute("ssion_local_type");
			System.out.println(LOCAL);
			
			List <String> LO_TYPE = SUtil.getLO_TYPE_LIST(LOCAL);
			
			adminMember_reVo.setLO_LIST(LO_TYPE);
			
			adminMember_reVo.setLO_TYPE("TRUE");
		
		}
		
		model = adminMember_reService.getList(adminMember_reVo);
		
		
		model.put("SEARCH_TYPE", adminMember_reVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", adminMember_reVo.getSEARCH_TEXT());
		
		model.put("beforeDomain", adminMember_reVo);

		return new ModelAndView("admin/member_re/pass", "model", model);
		
	}
	
	/* 신입생 선발 지원 - 접수자 관리 종료 */
	
	/*서류 관련 부분 시작*/
	
	//서류 관리
	@RequestMapping(value="/admin/member_re/dcmnt.do" , method = RequestMethod.GET)
	public ModelAndView Dcmnt_list(@ModelAttribute("DcmntVo") DcmntVo Dcmnt_Vo, HttpServletRequest request, HttpServletResponse response) {
		ModelMap model = new ModelMap();
		model = adminDcmntService.getDcmntList(Dcmnt_Vo);
		model.put("beforeDomain", Dcmnt_Vo);
		return new ModelAndView("/admin/member_re/dcmnt","model",model);
	}
	
	//서류 리스트 확인
	@RequestMapping(value = "/admin/member_re/Dcmnt_list.do",method = RequestMethod.POST,produces = "application/json; charset=utf8")
	@ResponseBody
	public String dcmnt_list(@ModelAttribute("AdminMemberReVo") AdminMemberReVo adminMember_reVo, HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException{
		
		List<?> checklist = adminDcmntService.getIdxCheck(adminMember_reVo);
		
		if(checklist.size() <= 0) {
			System.out.println(checklist);
			List<AdminDcmntVo> dcmntlist = adminMember_reService.getDcmnt(adminMember_reVo);
			ObjectMapper mapper = new ObjectMapper();
			String jsonStr = mapper.writeValueAsString(dcmntlist);
			return jsonStr;
		}else{
			ObjectMapper mapper = new ObjectMapper();
			String jsonStr = mapper.writeValueAsString(checklist);
			return jsonStr;
		}
	}
	
	
	//서류확인
	@RequestMapping(value = "/admin/member_re/DcmntUpdateArr.do", method = RequestMethod.POST)
	public ModelAndView dcmntUpdateArr(@PathVariable("dcmnt_check") String dcmnt_check, @ModelAttribute("AdminMember_reVo") AdminMemberReVo adminMember_reVo, HttpServletRequest request, HttpServletResponse response) {
			
		ModelMap model = new ModelMap();
		model = adminMember_reService.setDcmntUpdate(dcmnt_check);
		return new ModelAndView("admin/member_re/list", "model", model);
	}
	
	//서류 제출 확인 update
	@RequestMapping(value="/admin/member_re/Dcmnt_result_update.do" , method = RequestMethod.POST)
	public void dcmntresultupdate(@ModelAttribute("DcmntVo") DcmntVo Dcmnt_Vo, HttpServletRequest request, HttpServletResponse response) {
		adminDcmntService.setUpdate(Dcmnt_Vo);
	}
	
	//서류 제출 확인 insert
	@RequestMapping(value="/admin/member_re/Dcmnt_result_insert.do" , method = RequestMethod.POST)
	public void dcmntresultinsert(@ModelAttribute("DcmntVo") DcmntVo Dcmnt_Vo, HttpServletRequest request, HttpServletResponse response) {
		adminDcmntService.setInsert(Dcmnt_Vo);
	}
	
	
	//서류 제출 확인 출력 update
	@RequestMapping(value="/admin/member_re/Dcmnt_result_change.do" , method = RequestMethod.POST)
	public void Dcmnt_result_change(@ModelAttribute("DcmntVo") DcmntVo Dcmnt_Vo, HttpServletRequest request, HttpServletResponse response) {
		adminMember_reService.setDcmntCheck(Dcmnt_Vo);
	}
	
	//제출 서류 다운로드
	@RequestMapping(value="/admin/member_re/FileLinkCheck.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public String AdminMemberReDocumentFileDown(@ModelAttribute("AdminDcmntFileVo")AdminDcmntFileVo AdminDcmntFileVo  , HttpServletRequest  request , HttpServletResponse response) throws JsonProcessingException {
		
		String result = "";
		
		result = adminMember_reService.getFileLinkCheck(AdminDcmntFileVo);
		
		System.out.println("result : " + result);
		
		ObjectMapper mapper = new ObjectMapper();
		
		result = mapper.writeValueAsString(result);
		
		return result;
		
	}
	
	//서류 update
	@ResponseBody
	@RequestMapping(value="/admin/member_re/dcmnt_update.do" , method = RequestMethod.POST)
	public void dcmnt_update(@ModelAttribute("DcmntVo") DcmntVo Dcmnt_Vo, HttpServletRequest request, HttpServletResponse response) {
		adminDcmntService.setDcmntUpdate(Dcmnt_Vo);
	}
	
	//서류 delete
	@ResponseBody
	@RequestMapping(value="/admin/member_re/dcmnt_delete.do" , method = RequestMethod.POST)
	public void dcmnt_delete(@ModelAttribute("DcmntVo") DcmntVo Dcmnt_Vo, HttpServletRequest request, HttpServletResponse response) {
		adminDcmntService.setDcmntDelete(Dcmnt_Vo);
	}
	
	//서류 insert
	@ResponseBody
	@RequestMapping(value="/admin/member_re/dcmnt_insert.do" , method = RequestMethod.POST)
	public void dcmnt_insert(@ModelAttribute("DcmntVo") DcmntVo Dcmnt_Vo, HttpServletRequest request, HttpServletResponse response) {
		adminDcmntService.setDcmntInsert(Dcmnt_Vo);
	}
	
	
	
	/*서류 관련 부분 종료*/
	
	
	/*신입생 선발 설정 관련 시작*/
	
	//신입생 선발 설정 페이지 이동
	@RequestMapping(value="/admin/member_re/config.do" , method = RequestMethod.GET)
	public ModelAndView MemberReConfig(@ModelAttribute("MemberConfigVo")MemberConfigVo MemberConfigVo , HttpServletRequest request , HttpServletResponse response) {
		
		
		
		ModelMap model = new ModelMap();
		model = adminMember_reService.getConfig(MemberConfigVo);
		
		return new ModelAndView("/admin/member_re/config" , "model" , model);
		
	}
	
	//신입생 선발 설정
	@RequestMapping(value="/admin/member_re/config.do" , method = RequestMethod.POST)
	public String MemberReConfigInsert(@ModelAttribute("MemberConfigVo")MemberConfigVo MemberConfigVo , HttpServletRequest request , HttpServletResponse response) {
		
		
		MemberConfigVo.setTYPE("1");
		
		MemberConfigVo.setSTART_TM(request.getParameter("type_1_start_tm"));
		
		MemberConfigVo.setEND_TM(request.getParameter("type_1_end_tm"));
		
		adminMember_reService.setMemberReConfig(MemberConfigVo);
		
		MemberConfigVo.setTYPE("2");
		
		MemberConfigVo.setSTART_TM(request.getParameter("type_2_start_tm"));
		
		MemberConfigVo.setEND_TM(request.getParameter("type_2_end_tm"));
		
		adminMember_reService.setMemberReConfig(MemberConfigVo);
		
		return "redirect:/admin/member_re/config.do?YEAR="+MemberConfigVo.getYEAR()+"";
	}
	
	
	//신입생 선발 설정 중지
	@RequestMapping(value="/admin/member_re/ConfigStat.do" , method = RequestMethod.POST)
	public void SetMemberReConfigStat(@ModelAttribute("MemberConfigVo")MemberConfigVo MemberConfigVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminMember_reService.setConfigStat(MemberConfigVo);
		
	}
	
	
	//신입생 선발 설정 수정
	@RequestMapping(value="/admin/member_re/ConfigUpdate.do" , method = RequestMethod.POST)
	public void SetMemberReConfigUpdate(@ModelAttribute("MemberConfigVo")MemberConfigVo MemberConfigVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminMember_reService.setConfigUpdate(MemberConfigVo);
		
	}
	
	//신입색 선발 설정 삭제
	@RequestMapping(value="/admin/member_re/ConfigDel.do" , method = RequestMethod.POST)
	public void DelMemberReConfig(@ModelAttribute("MemberConfigVo")MemberConfigVo MemberConfigVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminMember_reService.DelConfig(MemberConfigVo);
		
	}
	
	
	/*신입생 선발 설정 관련 종료*/
	
	
	//신입생 선발 문자 발송 모듈
	@RequestMapping(value="/admin/member_re/SmsSend.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	public void SmsSendPost(@ModelAttribute("AdminMemberReVo") AdminMemberReVo adminMember_reVo , @RequestParam("SMSTEXT") String SMSTEXT , HttpServletRequest request , HttpServletResponse response)  throws NoSuchAlgorithmException, IOException, JsonProcessingException {
		
		
		if(SMSTEXT.equals("") || adminMember_reVo.getPHONE().equals("")) {
			//문자 보내는 내용 or 번호 오류 있는지
			response.getWriter().print("false:1");
		}else {
			
			System.out.println("SMSTEXT : " + SMSTEXT);
			System.out.println("NAME : " + adminMember_reVo.getNAME());
			System.out.println("PHONE : " + adminMember_reVo.getPHONE());
			
			String PHONE = adminMember_reVo.getPHONE();
			PHONE = PHONE.replace("-", "");
			PHONE = PHONE.replace(".", "");
			
			AdminSmsLogVo AdminSmsLogDomain = new AdminSmsLogVo();
			AdminSmsLogDomain.setPHONE(PHONE);
			AdminSmsLogDomain.setNAME(adminMember_reVo.getNAME());
			AdminSmsLogDomain.setMESSAGE(SMSTEXT);
			AdminSmsLogDomain.setSMS_TYPE("L");
			
			adminSmsLogService.setInsert(AdminSmsLogDomain);
			
			adminSmsLogService.smsSend(AdminSmsLogDomain);
		
			response.getWriter().print("true");
			
		}
		
	}
	
	@RequestMapping(value="/admin/member_re/api/PassMemberListAll.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public String PassMemberListAll(@ModelAttribute("AdminMemberReVo")AdminMemberReVo AdminMemberReVo , HttpServletRequest request , HttpServletResponse response) throws JsonProcessingException{
		
		
		List<?> list = adminMember_reService.getAllListPass();
		
		if(list.size() <= 0) {
			ObjectMapper mapper = new ObjectMapper();
			String jsonStr = mapper.writeValueAsString(list);
			return jsonStr;
		}else{
			ObjectMapper mapper = new ObjectMapper();
			String jsonStr = mapper.writeValueAsString(list);
			return jsonStr;
		}
		
	}
	
	@RequestMapping(value="/admin/member_re/api/PassMemberInsert.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public String PassMemberInsert(@ModelAttribute("AdminMemberReVo")AdminMemberReVo AdminMemberReVo , HttpServletRequest request , HttpServletResponse response) throws JsonProcessingException {
		
		
		String result = "false";
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
	        int currentYear = LocalDate.now().getYear(); // 현재 년도

	        // AdminMemberReVo에서 필요한 정보를 추출
	        String memberId = AdminMemberReVo.getMEMBER_ID();
	        String birthdate = AdminMemberReVo.getBIRTH();
	        String level = AdminMemberReVo.getLEVEL();
	        String name = AdminMemberReVo.getNAME();
	        String idx = AdminMemberReVo.getIDX();

	        // 아이디 발급 로직
	        if (memberId == null || memberId.isEmpty()) {
	            memberId = generateMemberId(currentYear, idx, level);
	        	AdminMemberReVo.setMEMBER_ID(memberId);

	            // 비밀번호 생성 로직
	            String processedBirth = birthdate.replace(".", "");
	            String password = SUtil.getSHA256(processedBirth.substring(2));
	            AdminMemberReVo.setPASSWORD(password);
	            
	            System.out.println("New MEMBER_ID assigned: " + memberId);
	            //신입생 선발 테이블 회원 업데이트
	            adminMember_reService.setMemberReNewMemberId(AdminMemberReVo);
	            
	            //회원 테이블에 아이디 등록 및 24년도 회원 추가
	            adminMember_reService.setMemberMemberId(AdminMemberReVo , "NEW");
	            
	        } else {
	        	//아이디가 존재하는 유저
	        	adminMember_reService.setMemberReNewMemberId(AdminMemberReVo);
	        	
	            System.out.println("Existing user ID: " + memberId);
	            //회원 테이블에 년도 추가
	            adminMember_reService.setMemberMemberId(AdminMemberReVo , "OLD");
	            
	        }
	        
	        String SMSTEXT = "";
	        
	        SMSTEXT = "안녕하세요 영재키움입니다.\n"+ AdminMemberReVo.getNAME()+"님의\n2024년도 영재키움 신입생 선발에 합격 축하드립니다.\n"+AdminMemberReVo.getNAME()+"님의 계정정보는 다음과 같습니다.\n아아디 : "+AdminMemberReVo.getMEMBER_ID()+"\n비밀번호는 생년월일 6자리입니다.감사합니다.";
	        
	        //아이디 발급 이후 문자 처리
	        System.out.println("SMSTEXT : " + SMSTEXT);
			System.out.println("NAME : " + AdminMemberReVo.getNAME());
			System.out.println("PHONE : " + AdminMemberReVo.getPHONE());
			
			String PHONE = AdminMemberReVo.getPHONE();
			PHONE = PHONE.replace("-", "");
			PHONE = PHONE.replace(".", "");
			
			AdminSmsLogVo AdminSmsLogDomain = new AdminSmsLogVo();
			AdminSmsLogDomain.setPHONE(PHONE);
			AdminSmsLogDomain.setNAME(AdminMemberReVo.getNAME());
			AdminSmsLogDomain.setMESSAGE(SMSTEXT);
			AdminSmsLogDomain.setSMS_TYPE("L");
			
			adminSmsLogService.setInsert(AdminSmsLogDomain);
			
			adminSmsLogService.smsSend(AdminSmsLogDomain);

	        result = mapper.writeValueAsString(true);
	    } catch (Exception e) {
	        e.printStackTrace();
	        result = mapper.writeValueAsString(false);
	    }

	    return result;
		
	}
	
	private String generateMemberId(int currentYear, String idx, String level) {
	    String memberId = currentYear + ""; // 년도로 시작
	    String idxFormatted = String.format("%03d", Integer.parseInt(idx)); // IDX 세 자리 포맷

	    if (level.equals("8")) {
	        memberId += "2" + idxFormatted; // 레벨 8인 경우
	    } else if (level.equals("11")) {
	        memberId += "1" + idxFormatted; // 레벨 11인 경우
	    } else {
	        throw new IllegalArgumentException("Invalid level: " + level);
	    }

	    return memberId;
	}
	
	@RequestMapping(value="/admin/member_re/api/PassMemberMatching.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public String PassMemberMatching(@ModelAttribute("AdminMemberReVo")AdminMemberReVo AdminMemberReVo , HttpServletRequest request , HttpServletResponse response) throws JsonProcessingException {
		
		String result = "false";
		
		ObjectMapper mapper = new ObjectMapper();
		
		AdminMemberReVo.setRESULT("final");
		
		ModelMap map = adminMember_reService.getPassListType1(AdminMemberReVo);
		
		//각 유형 리스트
		List<HashMap> Type1List = (List<HashMap>) map.get("list");
		
		for (HashMap<String, Object> list : Type1List) {
			
			AdminMatchingVo matching = new AdminMatchingVo();

			//학생 아이디
			String MEMBER_ID = String.valueOf(list.getOrDefault("MEMBER_ID", ""));
			matching.setMEMBER_ID(MEMBER_ID);
			//교사 아이디
			String Professor_ID = String.valueOf(list.getOrDefault("MENTOR_MEMBER_ID", ""));
			matching.setPROFESSOR_MEMBER_ID(Professor_ID);
			//학년
			String SCHOOL_YEAR = String.valueOf(list.getOrDefault("SCHOOL_YEAR", ""));
			matching.setSUPPORT_GROUP(SCHOOL_YEAR);
			//년도
			matching.setYEAR("2024");
			//학교명
			String SCHOOL_NAME = String.valueOf(list.getOrDefault("SCHOOL_NAME", ""));
			matching.setSCHOOL_NAME(SCHOOL_NAME);
			
			//반
			String SCHOOL_GROUP = String.valueOf(list.getOrDefault("SCHOOL_GROUP", ""));
			matching.setSCHOOL_GROUP(SCHOOL_GROUP);
			
			//저장된 매칭 데이터 보내기
			adminMember_reService.setMemberReMatching(matching);
			
		}
		
		result = "true";
				
		result = mapper.writeValueAsString(result);
				
		return result;
		
	}
	
	
	//신입생 선발 선정 모듈
	//-------------------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/admin/member_re/PassMemberReUploadProgram.do" , method = RequestMethod.GET)
	public void PassMemberReUploadProgram(@ModelAttribute("AdminMemberReVo")AdminMemberReVo AdminMemberReVo , @ModelAttribute("AdminMatchingVo")AdminMatchingVo AdminMatchingVo , HttpServletRequest request , HttpServletResponse response) {
		
		List<?> list = adminMember_reService.getAllListPass();
		
		
		Date dt = new Date();
		
		int id = dt.getYear() + 1900;
		
		System.out.println(id);
		
		int mento_num = 1;
		
		int student_num = 1;
		
		String MEMBER_ID = "";
		
		for(int i = 0; i < list.size(); i ++) {
		
			HashMap map = (HashMap) list.get(i);
			
			System.out.println("값 테스트 : " + map.get("IDX") + "");
			
			if(map.get("MEMBER_ID").equals("")) {
				
				System.out.println("신규 유저 IDX : " + map.get("IDX") );
				
				MEMBER_ID = id + "";
				
				String BIRTHCHANGE = map.get("BIRTH") + "";
				
				BIRTHCHANGE = BIRTHCHANGE.replace(".", "");
				
				BIRTHCHANGE = BIRTHCHANGE.substring(2,BIRTHCHANGE.length());
				
				String PASSWORD = SUtil.getSHA256(BIRTHCHANGE);
				
				if(map.get("LEVEL").equals("8")) {
					
					MEMBER_ID += "2";
					
					if(mento_num >= 100) {
						
						MEMBER_ID += ("" + mento_num +"");
						
					}else if(mento_num >= 10) {
						
						MEMBER_ID += ("0" + mento_num +"");
						
					}else {
						
						MEMBER_ID += ("00" + mento_num +"");
						
					}
					
					System.out.println("MEMBER_ID : " + MEMBER_ID);
					
					mento_num += 1;
					
				}else if(map.get("LEVEL").equals("11")) {
					
					MEMBER_ID += "1";
					
					if(student_num >= 100) {
						
						MEMBER_ID += ("" + student_num +"");
						
					}else if(student_num >= 10) {
						
						MEMBER_ID += ("0" + student_num +"");
						
					}else {
						
						MEMBER_ID += ("00" + student_num +"");
						
					}
					
					System.out.println("MEMBER_ID : " + MEMBER_ID);
					
					student_num += 1;
					
				}else {
					
					System.out.println("error : level / IDX : " + map.get("IDX"));
					
				}
				
				System.out.println("PASSWORD : " + PASSWORD);
				
				String NAME = (String) map.get("NAME");
				
				String Last_Name = NAME.substring(NAME.length() - 1);
				
				if(Last_Name.matches("[+-]?\\d*(\\.\\d+)?")) {
					
					NAME = NAME.substring(0,NAME.length() - 1);
					System.out.println(NAME + "는 123 유저 임");
					
					AdminMemberReVo.setNAME(NAME);
					AdminMemberReVo.setBIRTH(map.get("BIRTH") + "");
					AdminMemberReVo.setMEMBER_ID(MEMBER_ID);
					AdminMemberReVo.setPASSWORD(PASSWORD);
					AdminMemberReVo.setRESULT("new");
					
					//123 등 여러 중복 회원 이기에 회원 등록 NAME , BIRTH 로 키 잡아서 MEMBER_ID 등록
					adminMember_reService.setMemberReNewMemberIdDis(AdminMemberReVo);
					
				}else {
					
					System.out.println(NAME + "는 123 유저 아님");
					
					AdminMemberReVo.setIDX(map.get("IDX")+"");
					
					AdminMemberReVo.setMEMBER_ID(MEMBER_ID);
					
					AdminMemberReVo.setPASSWORD(PASSWORD);
					
					//회원 등록 IDX 로 키 잡아서 MEMBER_ID 등록
					adminMember_reService.setMemberReNewMemberId(AdminMemberReVo);
					
				}
						
				
			}else {
				
				System.out.println("기존 유저 ID : " + map.get("MEMBER_ID") + " IDX : " + map.get("IDX"));
				
			}
			
			
		}
		
		System.out.println("전체 아이디 발급 종료 --");
		
		System.out.println("유형 1 매칭 시작 -----");
		
		List<?> MatchingList = adminMember_reService.getMatchingAllList();
		
		for(int j = 0; j < MatchingList.size(); j += 2) {
			
			System.out.println("j 번째 매칭 : " + j);
			
			//매칭에 필요한 교사 , 학생 리스트 가져오기
			
			HashMap MentoMap = (HashMap) MatchingList.get(j);
			
			HashMap StudentMap = (HashMap) MatchingList.get(j+1);
			
			//매칭에 필요한 데이터 --> 멘토 아이디 , 학생 아이디 , 년도 , 학년 , 반 , 학교명(학생 학교?)
			
			System.out.println("해당 매칭 번호 : " + MentoMap.get("MATCHING") + "");
			
			
			AdminMatchingVo.setMEMBER_ID(StudentMap.get("MEMBER_ID")+"");
			
			AdminMatchingVo.setPROFESSOR_MEMBER_ID(MentoMap.get("MEMBER_ID")+"");
			
			AdminMatchingVo.setSUPPORT_GROUP(StudentMap.get("SCHOOL_YEAR")+"");
			
			AdminMatchingVo.setYEAR(Integer.toString(id)+"");
			
			AdminMatchingVo.setSCHOOL_YEAR(StudentMap.get("SCHOOL_YEAR")+"");
			
			AdminMatchingVo.setSCHOOL_GROUP(StudentMap.get("SCHOOL_GROUP")+"");
			
			AdminMatchingVo.setSCHOOL_NAME(StudentMap.get("SCHOOL_NAME")+"");
			
			System.out.println("matching-data =================");
			System.out.println("member_id : " + AdminMatchingVo.getMEMBER_ID());
			System.out.println("mento_member_id : " + AdminMatchingVo.getPROFESSOR_MEMBER_ID());
			System.out.println("support group & school_year : " + AdminMatchingVo.getSUPPORT_GROUP());
			System.out.println("year : " + AdminMatchingVo.getYEAR());
			System.out.println("school_group : " + AdminMatchingVo.getSCHOOL_GROUP());
			System.out.println("school_name : " + AdminMatchingVo.getSCHOOL_NAME());
			System.out.println("===============================\n");
			
			adminMember_reService.setMatching(AdminMatchingVo);
			
		}
		
		
	}
	
	//신입생 선발 접수자 관리 엑셀 다운
	//-------------------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/admin/member_re/excelDown.do", method = RequestMethod.GET)
	public void excelDown(@RequestParam("DownloadType") String DownloadType , @ModelAttribute("AdminMemberReVo")AdminMemberReVo AdminMemberReVo,HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		if(!DownloadType.equals("all")) {
		
			HttpSession session = request.getSession();
					
					if(session.getAttribute("ssion_local_type") != null && session.getAttribute("ssion_local_type") != "전체") {
						
						String LOCAL = (String) session.getAttribute("ssion_local_type");
						System.out.println(LOCAL);
						
						List <String> LO_TYPE = SUtil.getLO_TYPE_LIST(LOCAL);
						
						AdminMemberReVo.setLO_LIST(LO_TYPE);
						
						AdminMemberReVo.setLO_TYPE("TRUE");
					
				}
			
		}
		
		
		//엑셀에 필요한 전체 데이터 가져오기
		ModelMap map = adminMember_reService.getExcelListAll(AdminMemberReVo);
		
		//각 유형 리스트
		List<HashMap> Type1List = (List<HashMap>) map.get("Type1List");
		List<HashMap> Type2List = (List<HashMap>) map.get("Type2List");
		List<HashMap> Type3List = (List<HashMap>) map.get("Type3List");
		
		int[] dataList = (int[]) map.get("Data");;
		
		//시트 생성
	    Workbook wb = new HSSFWorkbook();
	    Sheet sheet1 = wb.createSheet("유형1");
	    
	    
	    CellStyle headStyle = wb.createCellStyle();
	    
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);
	    
	    headStyle.setFillForegroundColor(HSSFColorPredefined.SKY_BLUE.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	    
	    headStyle.setAlignment(HorizontalAlignment.CENTER);
	    
	    Font font = wb.createFont();
        font.setBold(true);
        font.setFontHeightInPoints((short) 12);
        headStyle.setFont(font);
	    
	    CellStyle bodyStyle = wb.createCellStyle();
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);
	    
	    
        //////////////////////////////////////////////////////////////////////////////////- 1시트 시작
	    
	    // 헤더 생성
        String[] headers = {"학생 기존 아이디" ,
        		"합격 여부",
        		"지역",
        		"학생 지원분야" ,
        		"학생 이름" ,
        		"학생 생년월일" ,
        		"학생 성별" ,
        		"학생 전화번호" ,
        		"학생 이메일" ,
        		"학생 부모님전화번호" ,
        		"학생 주소" ,
        		"학생 상세주소" ,
        		"학생 학교명" ,
        		"학생 학년" ,
        		"학생 반" ,
        		"학생 지원자격",
        		"학생 영재교육 경험여부",
        		"학생 영재교육 참여기간",
        		"교사 기존 아이디",
        		"교사 전공",
        		"교사 이름",
        		"교사 생년월일",
        		"교사 성별",
        		"교사 전화번호",
        		"교사 이메일",
        		"교사 주소",
        		"교사 상세주소",
        		"교사 학교명",
        		"교사 영재교육 연수 여부",
        		"파일 제출 여부",
        		};
        Row headerRow = sheet1.createRow(0);
        for (int i = 0; i < headers.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(headers[i]);
            cell.setCellStyle(headStyle);
        }

        // 데이터 채우기
        int rowIndex = 1;
        
        for (HashMap<String, Object> list : Type1List) {
        	Row row = sheet1.createRow(rowIndex++);
        	
        	row.createCell(0).setCellValue(String.valueOf(list.getOrDefault("MEMBER_ID", "")));
        	String result = String.valueOf(list.getOrDefault("RESULT", ""));
        	switch (result) {
			case "check":
				row.createCell(1).setCellValue("대기");
				break;
			case "pass":
				row.createCell(1).setCellValue("합격");
				break;
			}
        	row.createCell(2).setCellValue(String.valueOf(list.getOrDefault("ADDRESS_LOCAL", "")));
        	row.createCell(3).setCellValue(String.valueOf(list.getOrDefault("TYPE_SUB", "")));
        	row.createCell(4).setCellValue(String.valueOf(list.getOrDefault("NAME", "")));
        	row.createCell(5).setCellValue(String.valueOf(list.getOrDefault("BIRTH", "")));
        	row.createCell(6).setCellValue(String.valueOf(list.getOrDefault("SEX", "")));
        	row.createCell(7).setCellValue(String.valueOf(list.getOrDefault("PHONE", "")));
        	row.createCell(8).setCellValue(String.valueOf(list.getOrDefault("EMAIL", "")));
        	row.createCell(9).setCellValue(String.valueOf(list.getOrDefault("PARENT_PHONE", "")));
        	row.createCell(10).setCellValue(String.valueOf(list.getOrDefault("ADDRESS", "")));
        	row.createCell(11).setCellValue(String.valueOf(list.getOrDefault("ADDRESS_DETAIL", "")));
        	row.createCell(12).setCellValue(String.valueOf(list.getOrDefault("SCHOOL_NAME", "")));
        	String school_year = String.valueOf(list.getOrDefault("SCHOOL_YEAR", ""));
        	int school_year_num = Integer.parseInt(school_year);        	
        	if (school_year_num < 7) {
        		school_year = String.valueOf(school_year_num);
        		row.createCell(13).setCellValue("초등학교"+school_year+"학년");	
			}else if(school_year_num < 10) {
				school_year_num = school_year_num - 6;
				school_year = String.valueOf(school_year_num);
        		row.createCell(13).setCellValue("중학교"+school_year+"학년");
			}else {
				school_year_num = school_year_num - 9;
				school_year = String.valueOf(school_year_num);
        		row.createCell(13).setCellValue("고등학교"+school_year+"학년");
			}
        	row.createCell(14).setCellValue(String.valueOf(list.getOrDefault("SCHOOL_GROUP", "")));
        	row.createCell(15).setCellValue(String.valueOf(list.getOrDefault("ELIGIBILITY", "")));
        	row.createCell(16).setCellValue(String.valueOf(list.getOrDefault("EXP_DATA", "")));
        	row.createCell(17).setCellValue(String.valueOf(list.getOrDefault("EXP_TYPE", "")));
        	row.createCell(18).setCellValue(String.valueOf(list.getOrDefault("MENTOR_MEMBER_ID", "")));
        	row.createCell(19).setCellValue(String.valueOf(list.getOrDefault("MENTOR_TYPE_SUB", "")));
        	row.createCell(20).setCellValue(String.valueOf(list.getOrDefault("MENTOR_NAME", "")));
        	row.createCell(21).setCellValue(String.valueOf(list.getOrDefault("MENTOR_BIRTH", "")));
        	row.createCell(22).setCellValue(String.valueOf(list.getOrDefault("MENTOR_SEX", "")));
        	row.createCell(23).setCellValue(String.valueOf(list.getOrDefault("MENTOR_PHONE", "")));
        	row.createCell(24).setCellValue(String.valueOf(list.getOrDefault("MENTOR_EMAIL", "")));
        	row.createCell(25).setCellValue(String.valueOf(list.getOrDefault("MENTOR_ADDRESS", "")));
        	row.createCell(26).setCellValue(String.valueOf(list.getOrDefault("MENTOR_ADDRESS_DETAIL", "")));
        	row.createCell(27).setCellValue(String.valueOf(list.getOrDefault("MENTOR_SCHOOL_NAME", "")));
        	row.createCell(28).setCellValue(String.valueOf(list.getOrDefault("MENTOR_EXP_TYPE", "")));
        	switch (String.valueOf(list.getOrDefault("MENTOR_FILE_TYPE", ""))) {
			case "1":
				row.createCell(29).setCellValue("파일 미제출");
				break;
			case "2":
				row.createCell(29).setCellValue("파일 제출 완료");
				break;
			}
        	
        }
        
        // 열 너비 자동 조정
        for (int i = 0; i < headers.length; i++) {
            sheet1.autoSizeColumn(i , true);
            int width = sheet1.getColumnWidth(i);
            sheet1.setColumnWidth(i, width + 1024);
        }
        
        System.out.println("1sheet end");
        
        //////////////////////////////////////////////////////////////////////////////////- 1시트 종료
        
        //////////////////////////////////////////////////////////////////////////////////- 2시트 시작
        
        Sheet sheet2 = wb.createSheet("유형2");
        
        // 헤더 생성
        String[] headers1 = {"기존 아이디" ,
        		"합격 여부",
        		"지역",
        		"지원분야" ,
        		"이름" ,
        		"생년월일" ,
        		"성별" ,
        		"전화번호" ,
        		"이메일" ,
        		"부모님전화번호" ,
        		"주소" ,
        		"상세주소" ,
        		"학교명" ,
        		"학년" ,
        		"반" ,
        		"지원자격",
        		"영재교육 경험여부",
        		"영재교육 참여기간",
        		"파일 제출 여부",
        		};
        Row headerRow1 = sheet2.createRow(0);
        for (int i = 0; i < headers1.length; i++) {
            Cell cell = headerRow1.createCell(i);
            cell.setCellValue(headers1[i]);
            cell.setCellStyle(headStyle);
        }

        // 데이터 채우기
        int rowIndex1 = 1;
        
        for (HashMap<String, Object> list : Type2List) {
        	Row row = sheet2.createRow(rowIndex1++);
        	
        	row.createCell(0).setCellValue(String.valueOf(list.getOrDefault("MEMBER_ID", "")));
        	String result = String.valueOf(list.getOrDefault("RESULT", ""));
        	switch (result) {
			case "check":
				row.createCell(1).setCellValue("대기");
				break;
			case "pass":
				row.createCell(1).setCellValue("합격");
				break;
			}
        	row.createCell(2).setCellValue(String.valueOf(list.getOrDefault("ADDRESS_LOCAL", "")));
        	row.createCell(3).setCellValue(String.valueOf(list.getOrDefault("TYPE_SUB", "")));
        	row.createCell(4).setCellValue(String.valueOf(list.getOrDefault("NAME", "")));
        	row.createCell(5).setCellValue(String.valueOf(list.getOrDefault("BIRTH", "")));
        	row.createCell(6).setCellValue(String.valueOf(list.getOrDefault("SEX", "")));
        	row.createCell(7).setCellValue(String.valueOf(list.getOrDefault("PHONE", "")));
        	row.createCell(8).setCellValue(String.valueOf(list.getOrDefault("EMAIL", "")));
        	row.createCell(9).setCellValue(String.valueOf(list.getOrDefault("PARENT_PHONE", "")));
        	row.createCell(10).setCellValue(String.valueOf(list.getOrDefault("ADDRESS", "")));
        	row.createCell(11).setCellValue(String.valueOf(list.getOrDefault("ADDRESS_DETAIL", "")));
        	row.createCell(12).setCellValue(String.valueOf(list.getOrDefault("SCHOOL_NAME", "")));
        	String school_year = String.valueOf(list.getOrDefault("SCHOOL_YEAR", ""));
        	int school_year_num = Integer.parseInt(school_year);        	
        	if (school_year_num < 7) {
        		school_year = String.valueOf(school_year_num);
        		row.createCell(13).setCellValue("초등학교"+school_year+"학년");	
			}else if(school_year_num < 10) {
				school_year_num = school_year_num - 6;
				school_year = String.valueOf(school_year_num);
        		row.createCell(13).setCellValue("중학교"+school_year+"학년");
			}else {
				school_year_num = school_year_num - 9;
				school_year = String.valueOf(school_year_num);
        		row.createCell(13).setCellValue("고등학교"+school_year+"학년");
			}
        	row.createCell(14).setCellValue(String.valueOf(list.getOrDefault("SCHOOL_GROUP", "")));
        	row.createCell(15).setCellValue(String.valueOf(list.getOrDefault("ELIGIBILITY", "")));
        	row.createCell(16).setCellValue(String.valueOf(list.getOrDefault("EXP_DATA", "")));
        	row.createCell(17).setCellValue(String.valueOf(list.getOrDefault("EXP_TYPE", "")));
        	switch (String.valueOf(list.getOrDefault("FILE_TYPE", ""))) {
			case "1":
				row.createCell(18).setCellValue("파일 미제출");
				break;
			case "2":
				row.createCell(18).setCellValue("파일 제출 완료");
				break;
			}
        	
        }
        
        // 열 너비 자동 조정
        for (int i = 0; i < headers1.length; i++) {
            sheet2.autoSizeColumn(i , true);
            int width = sheet2.getColumnWidth(i);
            sheet2.setColumnWidth(i, width + 1024);
        }
        
        System.out.println("2sheet end");
        
        //////////////////////////////////////////////////////////////////////////////////- 2시트 종료
        
		//////////////////////////////////////////////////////////////////////////////////- 3시트 시작
		        
		Sheet sheet21 = wb.createSheet("유형3");
		
		// 헤더 생성
		String[] headers11 = {
				"기존 아이디",
				"합격 여부",
				"지역",
        		"전공",
        		"이름",
        		"생년월일",
        		"성별",
        		"전화번호",
        		"이메일",
        		"주소",
        		"상세주소",
        		"학교명",
        		"영재교육 연수 여부"
		};
		Row headerRow11 = sheet21.createRow(0);
		for (int i = 0; i < headers11.length; i++) {
		Cell cell = headerRow11.createCell(i);
		cell.setCellValue(headers11[i]);
		cell.setCellStyle(headStyle);
		}
		
		// 데이터 채우기
		int rowIndex11 = 1;
		
		for (HashMap<String, Object> list : Type3List) {
		Row row = sheet21.createRow(rowIndex11++);
		
			row.createCell(0).setCellValue(String.valueOf(list.getOrDefault("MEMBER_ID", "")));
			String result = String.valueOf(list.getOrDefault("RESULT", ""));
        	switch (result) {
			case "check":
				row.createCell(1).setCellValue("대기");
				break;
			case "pass":
				row.createCell(1).setCellValue("합격");
				break;
			}
        	row.createCell(2).setCellValue(String.valueOf(list.getOrDefault("ADDRESS_LOCAL", "")));
	    	row.createCell(3).setCellValue(String.valueOf(list.getOrDefault("TYPE_SUB", "")));
	    	row.createCell(4).setCellValue(String.valueOf(list.getOrDefault("NAME", "")));
	    	row.createCell(5).setCellValue(String.valueOf(list.getOrDefault("BIRTH", "")));
	    	row.createCell(6).setCellValue(String.valueOf(list.getOrDefault("SEX", "")));
	    	row.createCell(7).setCellValue(String.valueOf(list.getOrDefault("PHONE", "")));
	    	row.createCell(8).setCellValue(String.valueOf(list.getOrDefault("EMAIL", "")));
	    	row.createCell(9).setCellValue(String.valueOf(list.getOrDefault("ADDRESS", "")));
	    	row.createCell(10).setCellValue(String.valueOf(list.getOrDefault("ADDRESS_DETAIL", "")));
	    	row.createCell(11).setCellValue(String.valueOf(list.getOrDefault("SCHOOL_NAME", "")));
	    	row.createCell(12).setCellValue(String.valueOf(list.getOrDefault("EXP_TYPE", "")));
    	
		}
		
		// 열 너비 자동 조정
		for (int i = 0; i < headers11.length; i++) {
		sheet21.autoSizeColumn(i , true);
		int width = sheet21.getColumnWidth(i);
		sheet21.setColumnWidth(i, width + 1024);
		}
		
		System.out.println("3sheet end");
		
		//////////////////////////////////////////////////////////////////////////////////- 3시트 종료
		
		//////////////////////////////////////////////////////////////////////////////////- 4시트 시작
		Sheet sheet4 = wb.createSheet("요약");
				
		// 헤더 생성
		String[] headers4 = {
						"참여 현황",
						"파일 제출 완료 현황",
						"기존 참여자 현황",
		};
		String[] categories = {
				"유형1",
				"유형2",
				"유형3",
		};
		Row headerRow4 = sheet4.createRow(0);
		int colIndex = 0;
		for (int i = 0; i < headers4.length; i++) {
		Cell cell = headerRow4.createCell(colIndex);
		cell.setCellValue(headers4[i]);
		cell.setCellStyle(headStyle);
		sheet4.addMergedRegion(new CellRangeAddress(0, 0, colIndex, colIndex + 2)); // 3개 열 병합
		colIndex += 3;
		}
		
		// 유형 행 생성
        Row typeRow = sheet4.createRow(1);
        colIndex = 0;
        for (int i = 0; i < headers4.length; i++) {
            for (String category : categories) {
                Cell cell = typeRow.createCell(colIndex++);
                cell.setCellValue(category);
                cell.setCellStyle(headStyle);
            }
        }
		
        // 데이터 채우기
        Row dataRow = sheet4.createRow(2);
        colIndex = 0;
        for (int i = 0; i < dataList.length; i++) {
            Cell cell = dataRow.createCell(colIndex++);
            cell.setCellValue(dataList[i]);
        }
		
		// 열 너비 자동 조정
		for (int i = 0; i < headers4.length; i++) {
			sheet4.autoSizeColumn(i , true);
			int width = sheet4.getColumnWidth(i);
			sheet4.setColumnWidth(i, width + 1024);
		}
		
		//////////////////////////////////////////////////////////////////////////////////- 4시트 종료
		
	    // 컨텐츠 타입과 파일명 지정
	    // 현재 날짜 가져오기
        LocalDate today = LocalDate.now();
        // 날짜 형식 지정
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
        // 형식화된 날짜 출력
        String formattedDate = today.format(formatter);
	    response.setContentType("ms-vnd/excel");
	    String excel_name_is = "_신청_리스트";
	    excel_name_is = formattedDate + excel_name_is;
	    excel_name_is = URLEncoder.encode(excel_name_is,"UTF-8");
	    response.setHeader("Content-Disposition", "attachment;filename="+excel_name_is+".xls");



	    // 엑셀 출력

	    wb.write(response.getOutputStream());

	    wb.close();


	}
	
	
	
	
	//신입생 선발 대상자관리 엑셀 파일 다운
	//-------------------------------------------------------------------------------------------------------------------
		@RequestMapping(value = "/admin/member_re/passExcelDown.do", method = RequestMethod.GET)
		public void passExcelDown(HttpServletRequest request, HttpServletResponse response) throws IOException {

			ModelMap map = adminMember_reService.getPassListAll();
			List<HashMap> list = (List<HashMap>) map.get("list");

		    Workbook wb = new HSSFWorkbook();
		    Sheet sheet = wb.createSheet("신입생_리스트");
		    Row row = null;
		    Cell cell = null;
		    int rowNo = 0;
		    
		    int WidthCnt = 0;
		    
		    for(WidthCnt=0; WidthCnt < 25; WidthCnt++) {
		    	sheet.setColumnWidth(WidthCnt, 7000);
		    }
		    /*
		    sheet.setColumnWidth(18, 11000);
		    sheet.setColumnWidth(25, 11000);
		    */
		    
		    
		    CellStyle headStyle = wb.createCellStyle();
		    
		    headStyle.setBorderTop(BorderStyle.THIN);
		    headStyle.setBorderBottom(BorderStyle.THIN);
		    headStyle.setBorderLeft(BorderStyle.THIN);
		    headStyle.setBorderRight(BorderStyle.THIN);
		    
		    headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
		    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		    
		    headStyle.setAlignment(HorizontalAlignment.CENTER);
		    
		    CellStyle bodyStyle = wb.createCellStyle();
		    bodyStyle.setBorderTop(BorderStyle.THIN);
		    bodyStyle.setBorderBottom(BorderStyle.THIN);
		    bodyStyle.setBorderLeft(BorderStyle.THIN);
		    bodyStyle.setBorderRight(BorderStyle.THIN);
		    
		    int columnCnt = 0;
		    row = sheet.createRow(rowNo++);
		    
		    cell = row.createCell(columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("유형");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("매칭 번호(유형 1)");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("타입 (학생 or 교사)");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("이름");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("생년월일");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("성별");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("핸드폰");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("이메일");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("부모님 전화번호");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("지역");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("집주소(우편번호)");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("집주소 (전체주소)");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학교 지역");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학교 주소(전체)");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학교 타입 (학생 = 초 , 중 , 고) | (교사 = 초등 , 중등)");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학교 명");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학년");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("반");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("지원 유형");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("지원 자격");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학생(자기소개서) | 교사(지원동기)");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("영재교육 경험");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("영재교육 경험 기간");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("기존 아이디");
		    
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("기존 비밀번호(암호화)");
		    
		    
		    for(int i = 0; i < list.size(); i++ )
		    {
		    	
		    	System.out.println("----excel----"+i+"/"+list.size());
		    	
		    	HashMap tempMap = list.get(i);
		    	columnCnt = 0;
	    	    row = sheet.createRow(rowNo++);

	    	    cell = row.createCell(columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("TYPE")+"");

	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    String matching = tempMap.get("MATCHING")+"";
	    	    if(matching.equals("null") || matching.equals("") || matching.equals(null)) {
	    	    	cell.setCellValue(" ");
	    	    }else {
	    	    	cell.setCellValue(tempMap.get("MATCHING")+"");
	    	    }
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    String level = tempMap.get("LEVEL")+"";
	    	    
	    	    if(level == null) {
	    	    	cell.setCellValue("");
	    	    }else if(level.equals("8")) {
	    	    	cell.setCellValue("교사");
	    	    }else if(level.equals("11")) {
	    	    	cell.setCellValue("학생");
	    	    }

	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("NAME")+"");

	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("BIRTH")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SEX")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("PHONE")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("EMAIL")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("PARENT_PHONE")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("ADDRESS_LOCAL")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("ZIPCODE")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("ADDRESS")+"-"+tempMap.get("ADDRESS_DETAIL"));
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_LOCATION")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_ADDRESS")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_TYPE")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_NAME")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    
	    	    String SCHOOL_YEAR = tempMap.get("SCHOOL_YEAR")+"";
	    	    if(SCHOOL_YEAR == null)
	    	    {
	    	    	cell.setCellValue("");	
	    	    }else if(SCHOOL_YEAR.equals("4"))
	    	    {
	    	    	cell.setCellValue("초등학교4학년");
	    	    }else if(SCHOOL_YEAR.equals("5"))
	    	    {
	    	    	cell.setCellValue("초등학교5학년");
	    	    }else if(SCHOOL_YEAR.equals("6"))
	    	    {
	    	    	cell.setCellValue("초등학교6학년");
	    	    }else if(SCHOOL_YEAR.equals("7"))
	    	    {
	    	    	cell.setCellValue("중학교1학년");
	    	    }else if(SCHOOL_YEAR.equals("8"))
	    	    {
	    	    	cell.setCellValue("중학교2학년");
	    	    }else if(SCHOOL_YEAR.equals("9"))
	    	    {
	    	    	cell.setCellValue("중학교3학년");
	    	    }else if(SCHOOL_YEAR.equals("10"))
	    	    {
	    	    	cell.setCellValue("고등학교1학년");
	    	    }
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_GROUP")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("TYPE_SUB")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("ELIGIBILITY")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SELF_INTR")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("EXP_TYPE")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("EXP_DATA")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("MEMBER_ID")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("PASSWORD")+"");
	    	    
		    }
		    	

		    // 컨텐츠 타입과 파일명 지정

		    response.setContentType("ms-vnd/excel");
		    String excel_name_is = "합격자_리스트";
		    excel_name_is = URLEncoder.encode(excel_name_is,"UTF-8");
		    response.setHeader("Content-Disposition", "attachment;filename="+excel_name_is+".xls");



		    // 엑셀 출력

		    wb.write(response.getOutputStream());

		    wb.close();


		}
		
		
		//신입생 선발 접수자 관리 - 매칭 합친거
		//-------------------------------------------------------------------------------------------------------------------
		@RequestMapping(value = "/admin/member_re/AllexcelDown.do", method = RequestMethod.GET)
		public void excelDownAll(HttpServletRequest request, HttpServletResponse response) throws IOException {
			ModelMap map = adminMember_reService.getListAll();
			List<HashMap> list = (List<HashMap>) map.get("list");

		    Workbook wb = new HSSFWorkbook();
		    Sheet sheet = wb.createSheet("신입생_리스트");
		    Row row = null;
		    Cell cell = null;
		    int rowNo = 0;
		    
		    int WidthCnt = 0;
		    
		    for(WidthCnt=0; WidthCnt < 25; WidthCnt++) {
		    	sheet.setColumnWidth(WidthCnt, 7000);
		    }
		    /*
		    sheet.setColumnWidth(18, 11000);
		    sheet.setColumnWidth(25, 11000);
		    */
		    
		    
		    CellStyle headStyle = wb.createCellStyle();
		    
		    headStyle.setBorderTop(BorderStyle.THIN);
		    headStyle.setBorderBottom(BorderStyle.THIN);
		    headStyle.setBorderLeft(BorderStyle.THIN);
		    headStyle.setBorderRight(BorderStyle.THIN);
		    
		    headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
		    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		    
		    headStyle.setAlignment(HorizontalAlignment.CENTER);
		    
		    CellStyle bodyStyle = wb.createCellStyle();
		    bodyStyle.setBorderTop(BorderStyle.THIN);
		    bodyStyle.setBorderBottom(BorderStyle.THIN);
		    bodyStyle.setBorderLeft(BorderStyle.THIN);
		    bodyStyle.setBorderRight(BorderStyle.THIN);
		    
		    int columnCnt = 0;
		    row = sheet.createRow(rowNo++);
		    
		    cell = row.createCell(columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("유형");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("매칭 번호(유형 1)");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("구분");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("이름");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("생년월일");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("성별");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("핸드폰");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("이메일");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("부모님 전화번호");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("지역");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("집주소(우편번호)");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("집주소 (전체주소)");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학교 지역");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학교 주소(전체)");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학교 타입 (학생 = 초 , 중 , 고) | (교사 = 초등 , 중등)");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학교 명");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학년");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("반");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("지원 유형");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("지원 자격");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학생(자기소개서) | 교사(지원동기)");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("영재교육 경험");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("영재교육 경험 기간");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("서류 제출 여부");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("기존 아이디");
		    
		    //교사 부분
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("매칭 번호(유형 1)");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("구분");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("이름");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("생년월일");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("성별");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("핸드폰");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("이메일");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("지역");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("집주소(우편번호)");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("집주소 (전체주소)");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학교 주소(전체)");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학교 타입 (학생 = 초 , 중 , 고) | (교사 = 초등 , 중등)");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학교 명");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학년");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("반");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("지원 유형");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("지원 자격");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학생(자기소개서) | 교사(지원동기)");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("영재교육 경험");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("영재교육 경험 기간");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("서류 제출 여부");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("기존 아이디");
		    
		    
		    String TYPE = "";
	    	String MATCHING = "";
	    	String LEVEL = "";
	    	AdminMemberReVo Vo2 = new AdminMemberReVo();
		    
		    for(int i = 0; i < list.size(); i++ )
		    {
		    	
		    	System.out.println("----excel----"+i+"/"+list.size());
		    	
		    	HashMap tempMap = list.get(i);
		    	
		    	
		    	TYPE = tempMap.get("TYPE") + "";		    	
		    	MATCHING = tempMap.get("MATCHING") + "";
		    	LEVEL = tempMap.get("LEVEL") + "";
		    	
		    	if(!MATCHING.equals("") && TYPE.equals("1") && LEVEL.equals("8")) {
		    		
		    		System.out.println("교사 넘김");
		    		
		    	}else {
		    		
		    	
		    	columnCnt = 0;
	    	    row = sheet.createRow(rowNo++);

	    	    cell = row.createCell(columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("TYPE")+"");

	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    String matching = tempMap.get("MATCHING")+"";
	    	    if(matching.equals("null") || matching.equals("") || matching.equals(null)) {
	    	    	cell.setCellValue(" ");
	    	    }else {
	    	    	cell.setCellValue(tempMap.get("MATCHING")+"");
	    	    }
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    String level = tempMap.get("LEVEL")+"";
	    	    
	    	    if(level == null) {
	    	    	cell.setCellValue("");
	    	    }else if(level.equals("8")) {
	    	    	cell.setCellValue("교사");
	    	    }else if(level.equals("11")) {
	    	    	cell.setCellValue("학생");
	    	    }

	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("NAME")+"");

	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("BIRTH")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SEX")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("PHONE")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("EMAIL")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("PARENT_PHONE")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("ZIPCODE")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("ADDRESS_LOCAL")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("ADDRESS")+"-"+tempMap.get("ADDRESS_DETAIL"));
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_LOCATION")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_ADDRESS")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_TYPE")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_NAME")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    
	    	    String SCHOOL_YEAR = tempMap.get("SCHOOL_YEAR")+"";
	    	    if(SCHOOL_YEAR == null)
	    	    {
	    	    	cell.setCellValue("");	
	    	    }else if(SCHOOL_YEAR.equals("4"))
	    	    {
	    	    	cell.setCellValue("초등학교4학년");
	    	    }else if(SCHOOL_YEAR.equals("5"))
	    	    {
	    	    	cell.setCellValue("초등학교5학년");
	    	    }else if(SCHOOL_YEAR.equals("6"))
	    	    {
	    	    	cell.setCellValue("초등학교6학년");
	    	    }else if(SCHOOL_YEAR.equals("7"))
	    	    {
	    	    	cell.setCellValue("중학교1학년");
	    	    }else if(SCHOOL_YEAR.equals("8"))
	    	    {
	    	    	cell.setCellValue("중학교2학년");
	    	    }else if(SCHOOL_YEAR.equals("9"))
	    	    {
	    	    	cell.setCellValue("중학교3학년");
	    	    }else if(SCHOOL_YEAR.equals("10"))
	    	    {
	    	    	cell.setCellValue("고등학교1학년");
	    	    }
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_GROUP")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("TYPE_SUB")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("ELIGIBILITY")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SELF_INTR")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("EXP_TYPE")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("EXP_DATA")+"");
	    	   
	    	    /*
	    	     * 합격여부는 필요없다고 생각함
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    String rs = tempMap.get("RESULT")+"";
	    	    if(rs == null)
	    	    {
	    	    	cell.setCellValue("대기");	
	    	    }else if(rs.equals("check"))
	    	    {
	    	    	cell.setCellValue("대기");
	    	    }else if(rs.equals("pass"))
	    	    {
	    	    	cell.setCellValue("합격");
	    	    }
	    	    */
	    	    
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    
	    	    String file = tempMap.get("FILE_TYPE")+"";
	    	    if(file == null) {
	    	    	
	    	    }else if(file.equals("1")) {
	    	    	cell.setCellValue("대기");
	    	    }else if(file.equals("2")) {
	    	    	cell.setCellValue("완료");
	    	    }
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("MEMBER_ID")+"");
		    	
	    	    	//학생일시 교사 뒤에 붙여주기
	    	    	if(!MATCHING.equals("") && TYPE.equals("1") && LEVEL.equals("11")) {
	    	    		
	    	    		Vo2.setMATCHING(MATCHING);
	    	    		Vo2.setTYPE(TYPE);
	    	    		Vo2.setLEVEL(LEVEL);
	    	    		
	    	    		//학생일시 가져오는 거니 멘토 가져오기
	    	    		Vo2 = adminMember_reService.getMatchingMentoView(Vo2);
	    	    		
	    	    		cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getMATCHING()+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue("교사");

	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getNAME()+"");

	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getBIRTH()+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getSEX()+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getPHONE()+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getEMAIL()+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getZIPCODE()+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getADDRESS_LOCAL()+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getADDRESS()+Vo2.getADDRESS_DETAIL()+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(tempMap.get("SCHOOL_ADDRESS")+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(tempMap.get("SCHOOL_TYPE")+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(tempMap.get("SCHOOL_NAME")+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getSCHOOL_YEAR()+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getSCHOOL_GROUP()+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getTYPE_SUB()+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getELIGIBILITY()+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getSELF_INTR()+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getEXP_TYPE()+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getEXP_DATA()+"");
	    	    	   
	    	    	    /*
	    	    	     * 합격여부는 필요없다고 생각함
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    String rs = tempMap.get("RESULT")+"";
	    	    	    if(rs == null)
	    	    	    {
	    	    	    	cell.setCellValue("대기");	
	    	    	    }else if(rs.equals("check"))
	    	    	    {
	    	    	    	cell.setCellValue("대기");
	    	    	    }else if(rs.equals("pass"))
	    	    	    {
	    	    	    	cell.setCellValue("합격");
	    	    	    }
	    	    	    */
	    	    	    
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    
	    	    	    file = Vo2.getFILE_TYPE()+"";
	    	    	    if(file == null) {
	    	    	    	
	    	    	    }else if(file.equals("1")) {
	    	    	    	cell.setCellValue("대기");
	    	    	    }else if(file.equals("2")) {
	    	    	    	cell.setCellValue("완료");
	    	    	    }
	    	    		
	    	    		
	    	    	}
	    	    
	    	    
		    	}
	    	    
	    	    
		    }
		    	

		    // 컨텐츠 타입과 파일명 지정

		    response.setContentType("ms-vnd/excel");
		    String excel_name_is = "신입생_리스트";
		    excel_name_is = URLEncoder.encode(excel_name_is,"UTF-8");
		    response.setHeader("Content-Disposition", "attachment;filename="+excel_name_is+".xls");



		    // 엑셀 출력

		    wb.write(response.getOutputStream());

		    wb.close();


		}


}
