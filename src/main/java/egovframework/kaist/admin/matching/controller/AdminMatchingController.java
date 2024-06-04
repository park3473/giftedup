package egovframework.kaist.admin.matching.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
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

import egovframework.kaist.admin.matching.model.AdminMatchingVo;
import egovframework.kaist.admin.matching.service.AdminMatchingService;
import egovframework.kaist.admin.member.model.AdminMemberVo;
import egovframework.kaist.admin.member.service.AdminMemberService;
import egovframework.kaist.admin.program.service.AdminProgramService;

@Controller
public class AdminMatchingController {

	@Autowired
	AdminMatchingService adminMatchingService;

	@Autowired
	AdminProgramService adminProgramService;
	
	@Autowired
	AdminMemberService adminMemberService;


	private static final Logger Logger = LoggerFactory.getLogger(AdminMatchingController.class);

	@RequestMapping(value = "/admin/matching/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("AdminMatchingVo") AdminMatchingVo adminMatchingVo,
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
		

		adminMatchingVo.setPAGE(Integer.parseInt(PAGE));
		adminMatchingVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = adminMatchingVo.getPAGE() * adminMatchingVo.getITEM_COUNT();
		
		adminMatchingVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		adminMatchingVo.setOFFSET(pagelimit);
		
	
		//지역별 관리자 확인 1.session에 지역확인 2.sutil 에 저장된 배열 받기(지역관리)
		HttpSession session = request.getSession();
				
		if(session.getAttribute("ssion_local_type") != null && session.getAttribute("ssion_local_type") != "전체") {
					
			System.out.println(session.getAttribute("ssion_local_type"));
					
			String LOCAL = (String) session.getAttribute("ssion_local_type");
			System.out.println(LOCAL);
					
			List <String> LO_TYPE = SUtil.getLO_TYPE_LIST(LOCAL);
					
			adminMatchingVo.setLO_LIST(LO_TYPE);
					
			adminMatchingVo.setLO_TYPE("TRUE");
					
		}		
		
		model = adminMatchingService.getList(adminMatchingVo);
		
		model.put("SEARCH_TYPE", adminMatchingVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", adminMatchingVo.getSEARCH_TEXT());
		
		
		
		model.put("beforeDomain", adminMatchingVo);

		model.put("YEARLIST", adminMatchingService.getListGroupByYear());

		model.put("MEMBER", adminMatchingService.getList(adminMatchingVo));
		//교수리스트
		AdminMemberVo adminMemberVo = new AdminMemberVo();
		adminMemberVo.setTYPE("2");
		adminMemberVo.setLIMIT(999999);
		
		//model.put("MEMBER", adminMemberService.getList(adminMemberVo));
		
		return new ModelAndView("admin/matching/list", "model", model);
	}

	
	
	@RequestMapping(value = "/admin/matching/{matchingid}/insertAjax.do", method = RequestMethod.GET)
	public ModelAndView insertAjax(@PathVariable("matchingid") String matchingid, HttpServletRequest request, HttpServletResponse response) 
	{
		String LOCATION = request.getParameter("LOCATION") != null ? request
				.getParameter("LOCATION") : "";
		
		String YEAR = request.getParameter("YEAR") != null ? request
				.getParameter("YEAR") : "";
		
		ModelMap model = new ModelMap();
		
		model = adminMemberService.getView(matchingid);
		AdminMemberVo vo =  (AdminMemberVo) model.get("pageDomain");
		//model = adminMatchingService.getView(matchingid);
		
		AdminMatchingVo adminMatchingVo = new AdminMatchingVo();
		adminMatchingVo.setTYPE("1");
		adminMatchingVo.setLIMIT(999999);
		adminMatchingVo.setMEMBER_ID(matchingid);
		
		if(LOCATION.equals("") || LOCATION.equals("undefined"))
		{
			adminMatchingVo.setLOCATION(vo.getADDRESS_LOCAL());	
		}else
		{
			adminMatchingVo.setLOCATION(LOCATION);
		}
		
		adminMatchingVo.setYEAR(YEAR);
		
		adminMatchingVo.setPROFESSOR_MEMBER_ID(matchingid);
		
		model.put("MEMBER", adminMatchingService.getList(adminMatchingVo));
		
		String EXP_DATA = YEAR.substring(2,4);
		adminMatchingVo.setEXP_DATA(EXP_DATA);
		
		//매칭되지 않은 사용자
		model.put("MEMBER_NOT", adminMatchingService.getMatchingNotMemberList(adminMatchingVo));
		
		model.put("LOCATION", adminMatchingVo.getLOCATION());
		model.put("PROFESSOR_MEMBER_ID", matchingid);
		return new ModelAndView("admin/matching/insertAjax", "model", model);
	}
	
	
	@RequestMapping(value = "/admin/matching/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(HttpServletRequest request, HttpServletResponse response) 
	{

		String YEAR = request.getParameter("YEAR") != null ? request
				.getParameter("YEAR") : "";
		
		System.out.println(YEAR);
		
		YEAR = YEAR.substring(2,4);
		
		ModelMap model = new ModelMap();
		
		
		AdminMemberVo adminMemberVo = new AdminMemberVo();
		adminMemberVo.setTYPE("1");
		adminMemberVo.setLIMIT(999999);
		//adminMemberService.getList(adminMemberVo);
		
	
		
		AdminMemberVo adminMemberVo2 = new AdminMemberVo();
		adminMemberVo2.setTYPE("2");
		adminMemberVo2.setLIMIT(999999);
		adminMemberVo2.setLEVEL("8");
		//adminMemberVo2.setEXP_DATA(YEAR);
		//adminMemberService.getList(adminMemberVo2);
		model.put("MEMBER2", adminMemberService.getMatchingList(adminMemberVo2));

		//model.put("SCHOOLNAME", adminMemberService.getListGroupBySchoolName());
		
		Random random = new Random();
		
        String hak = SUtil.getNowDate().replaceAll("-", "");
        hak += random.nextInt(1000); 
        
        model.put("HAKBUN", hak);
		
		
		return new ModelAndView("admin/matching/insert", "model", model);
	}

	@RequestMapping(value = "/admin/matching/insert.do", method = RequestMethod.POST)
	public void insertPost(@ModelAttribute("AdminMatchingVo") AdminMatchingVo adminMatchingVo, HttpServletRequest  request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();
		//String drv = request.getRealPath("");
		//drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/matching/";
		 
		/*
		String filename = SUtil.setFileUpload(request, drv);
		adminMatchingVo.setFILES(filename);
		*/
		String idx = adminMatchingVo.getMEMBER_ID();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				AdminMatchingVo userMemberDomain = adminMatchingVo;
				
				model = adminMemberService.getView(arrIdx[i]);
				AdminMemberVo vo =  (AdminMemberVo) model.get("pageDomain");
				userMemberDomain.setSCHOOL_YEAR(vo.getSCHOOL_YEAR());
				userMemberDomain.setSCHOOL_NAME(vo.getSCHOOL_NAME());
				userMemberDomain.setMEMBER_ID(arrIdx[i]);
				adminMatchingService.setInsert(userMemberDomain);		
			}
		}
		
		//return "redirect:./list.do";
	}
	
	
	@RequestMapping(value = "/admin/matching/{matchingid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("matchingid") String matchingid, HttpServletRequest request,
			HttpServletResponse response) {

		String YEAR = request.getParameter("YEAR") != null ? request
				.getParameter("YEAR") : "";
		
		System.out.println(YEAR);
		
		ModelMap model = new ModelMap();

		AdminMatchingVo vo = new AdminMatchingVo();
		vo.setMEMBER_ID(matchingid);
		vo.setYEAR(YEAR);
		
		model = adminMatchingService.getView(vo);
		
		//model.put("SCHOOLNAME", adminMemberService.getListGroupBySchoolName());

		
		YEAR = YEAR.substring(2,4);
		
		AdminMemberVo adminMemberVo = new AdminMemberVo();
		adminMemberVo.setTYPE("1");
		adminMemberVo.setLIMIT(999999);
		//adminMemberService.getList(adminMemberVo);
		//model.put("MEMBER", adminMemberService.getList(adminMemberVo));

		
		
		AdminMemberVo adminMemberVo2 = new AdminMemberVo();
		adminMemberVo2.setTYPE("2");
		adminMemberVo2.setLIMIT(999999);
		adminMemberVo2.setEXP_DATA(YEAR);
		//adminMemberService.getList(adminMemberVo2);
		System.out.println("3");
		
		model.put("MEMBER2", adminMemberService.getMatchingList(adminMemberVo2));

		
		
		return new ModelAndView("admin/matching/update", "model", model);
	}
	
	@RequestMapping(value = "/admin/matching/{matchingid}/update.do", method = RequestMethod.POST)
	public String updatePost(@ModelAttribute("AdminMatchingVo") AdminMatchingVo adminMatchingVo,
			MultipartHttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/matching/";
		 
		String filename = SUtil.setFileUpload(request, drv);
		
		if(filename.length() > 1)
		{
			;
		}else
		{
			filename = "";
		}
		
		adminMatchingVo.setFILES(filename);
		
		
		boolean rtn = adminMatchingService.setUpdate(adminMatchingVo);

		return "redirect:../list.do";
	}

	@RequestMapping(value = "/admin/matching/{matchingid}/delete.do", method = RequestMethod.GET)
	public String deletePost(@PathVariable("matchingid") String matchingid, @ModelAttribute("AdminMatchingVo") AdminMatchingVo adminMatchingVo, HttpServletRequest request,
			HttpServletResponse response) {

		String YEAR = request.getParameter("YEAR") != null ? request
				.getParameter("YEAR") : "";
		
		ModelMap model = new ModelMap();

		adminMatchingVo.setMEMBER_ID(matchingid);
		adminMatchingVo.setYEAR(YEAR);
		boolean rtn = adminMatchingService.setDelete(adminMatchingVo);
		
		return "redirect:../list.do"; 
		
	}
	@RequestMapping(value = "/admin/matching/deleteArr.do", method = RequestMethod.POST)
	public void deleteArrPost(
			@ModelAttribute("AdminMatchingVo") AdminMatchingVo adminMatchingVo, HttpServletRequest request, HttpServletResponse response) {
		
		String YEAR = request.getParameter("YEAR") != null ? request
				.getParameter("YEAR") : "";
		
		ModelMap model = new ModelMap();

		String idx = adminMatchingVo.getMEMBER_ID();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				AdminMatchingVo userMemberDomain = new AdminMatchingVo();
				userMemberDomain.setMEMBER_ID(arrIdx[i]);
				userMemberDomain.setYEAR(YEAR);
				//userMemberDomain.setPROFESSOR_MEMBER_ID(PROFESSOR_MEMBER_ID);
				adminMatchingService.setDelete(userMemberDomain);		
			}
		}
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	@RequestMapping(value = "/admin/matching/TypeToTextUpdateArr.do", method = RequestMethod.POST)
	public void statusUpdateArr(@ModelAttribute("AdminMatchingVo") AdminMatchingVo adminMatchingVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		String idx = adminMatchingVo.getMEMBER_ID();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				AdminMatchingVo vo = new AdminMatchingVo();
				vo.setMEMBER_ID(arrIdx[i]);
				vo.setSEARCH_TYPE(adminMatchingVo.getSEARCH_TYPE());
				vo.setSEARCH_TEXT(adminMatchingVo.getSEARCH_TEXT());
				adminMatchingService.setUpdateTypeToText(vo);		
			}
		}
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	
	@RequestMapping(value = "/admin/matching/excelDown.do", method = RequestMethod.GET)
	public void MatchingExcelDown(@ModelAttribute("AdminMatchingVo") AdminMatchingVo adminMatchingVo, HttpServletRequest request, HttpServletResponse response)
	{
		
		//지역별 관리자 확인 1.session에 지역확인 2.sutil 에 저장된 배열 받기(지역관리)
		HttpSession session = request.getSession();
						
		if(session.getAttribute("ssion_local_type") != null && session.getAttribute("ssion_local_type") != "전체") {
							
			System.out.println(session.getAttribute("ssion_local_type"));
							
			String LOCAL = (String) session.getAttribute("ssion_local_type");
			System.out.println(LOCAL);
							
			List <String> LO_TYPE = SUtil.getLO_TYPE_LIST(LOCAL);
							
			adminMatchingVo.setLO_LIST(LO_TYPE);
							
			adminMatchingVo.setLO_TYPE("TRUE");
							
		}		
		
	    // 워크북 생성
	    Workbook wb = new HSSFWorkbook();

	    Sheet sheet = wb.createSheet("매칭리스트");
	    
	    // 첫 세 개의 열을 고정
	   sheet.createFreezePane(3, 0);
	    
	    Row row = null;
	    
	    Row row2 = null;

	    Cell cell = null;
	    
	    int columnCnt = 0;

	    int rowNo = 0;
	    int rowNo2 = 0;
	    
	    // 헤더 생성
	    row = sheet.createRow(rowNo++); // 첫 번째 행에 헤더를 생성
	    CellStyle headStyle = wb.createCellStyle();

	    // 헤더 스타일 설정
	    headStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);
	    headStyle.setAlignment(HorizontalAlignment.CENTER);
	    
	    // 바디 스타일 생성
	    CellStyle bodyStyle = wb.createCellStyle();
	    bodyStyle.setAlignment(HorizontalAlignment.CENTER);
	    bodyStyle.setVerticalAlignment(VerticalAlignment.CENTER);
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);

	    Font headerFont = wb.createFont();
	    headerFont.setBold(true);
	    headerFont.setFontHeightInPoints((short) 12);
	    headStyle.setFont(headerFont);

	    // 헤더 셀에 스타일 적용 및 값 설정
	    String[] headers = new String[] {
	        "호", "학생 구분", "학생 지역", "학생 아이디", "학생 이름", "학생 생년월일", "성별", "학교 이름",
	        "학년", "지원 영역", "학생 전화번호", "부모님 전화번호", "지원 자격", "주소", "상세 주소",
	        "교사 아이디", "교사 이름", "교사 지역", "교사 학교 이름", "교사 성별", "교사 전화번호", "교사 이메일"
	    };

	    int headerIndex = 0;
	    for (String header : headers) {
	        cell = row.createCell(headerIndex++);
	        cell.setCellStyle(headStyle);
	        cell.setCellValue(header);
	    }
	    

	    for(int i = 0; i < columnCnt; i++) {
	        sheet.autoSizeColumn(i); // 열 너비 자동 조정
	        sheet.setColumnWidth(i, sheet.getColumnWidth(i) + 512); // 조금 더 여유 있게 조정
	    }
		
	    
	    ModelMap model = new ModelMap();

	    model = adminMatchingService.getList(adminMatchingVo);
				
		List<HashMap> list = (List<HashMap>) model.get("list");


		int IndexNum = 0;
		
		for (HashMap<String, Object> tempMap : list) {
		    row = sheet.createRow(rowNo++);
		    int cellNum = -1; // 셀 인덱스는 0부터 시작하므로, 첫 번째 셀 생성 전에 -1로 설정

		    IndexNum += 1;
		    
		    // "호" 필드 값 할당
		    cell = row.createCell(++cellNum);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(Integer.toString(IndexNum));

		    // "학생 구분" - 신규 또는 기존 학생 여부
		    cell = row.createCell(++cellNum);
		    cell.setCellStyle(bodyStyle);
		    String studentId = String.valueOf(tempMap.getOrDefault("StudentID", ""));
		    if (studentId.startsWith("2023")) {
		        cell.setCellValue("신규");
		    } else {
		        cell.setCellValue("기존");
		    }

		    // 나머지 필드에 대해 동일하게 처리
		    // "학생 지역"
		    cell = row.createCell(++cellNum);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(String.valueOf(tempMap.getOrDefault("Student_ADDRESS_LOCAL", "")));

		    // "학생 아이디"
		    cell = row.createCell(++cellNum);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(studentId);

		    // "학생 이름"
		    cell = row.createCell(++cellNum);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(String.valueOf(tempMap.getOrDefault("StudentName", "")));

		    // "학생 생년월일"
		    cell = row.createCell(++cellNum);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(String.valueOf(tempMap.getOrDefault("StudentBIRTH", "")));

		    // "성별"
		    cell = row.createCell(++cellNum);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(String.valueOf(tempMap.getOrDefault("StudentSEX", "")));

		    // "학교 이름"
		    cell = row.createCell(++cellNum);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(String.valueOf(tempMap.getOrDefault("StudentSCHOOL_NAME", "")));

		    // "학년" 처리를 위한 복잡한 로직, 여기서는 예시로 간단화
		    cell = row.createCell(++cellNum);
		    cell.setCellStyle(bodyStyle);
		    String schoolYear = String.valueOf(tempMap.getOrDefault("StudentSCHOOL_YEAR", ""));
		    switch (schoolYear) {
		        case "4":
		            cell.setCellValue("초등학교4학년");
		            break;
		        case "5":
		            cell.setCellValue("초등학교5학년");
		            break;
		        case "6":
		            cell.setCellValue("초등학교6학년");
		            break;
		        case "7":
		            cell.setCellValue("중학교1학년");
		            break;
		        case "8":
		            cell.setCellValue("중학교2학년");
		            break;
		        case "9":
		            cell.setCellValue("중학교3학년");
		            break;
		        case "10":
		            cell.setCellValue("고등학교1학년");
		            break;
		        case "11":
		            cell.setCellValue("고등학교2학년");
		            break;
		        case "12":
		            cell.setCellValue("고등학교3학년");
		            break;
		        default:
		            cell.setCellValue(""); // 미해당 시 빈 문자열 할당
		    }
		    // "지원 영역"
		    cell = row.createCell(++cellNum);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(String.valueOf(tempMap.getOrDefault("StudentSUPPORT_AREA", "")));

		    // "학생 전화번호"
		    cell = row.createCell(++cellNum);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(String.valueOf(tempMap.getOrDefault("StudentPHONE", "")));

		    // "부모님 전화번호"
		    cell = row.createCell(++cellNum);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(String.valueOf(tempMap.getOrDefault("StudentPARENTS_PHONE", "")));

		    // "지원 자격"
		    cell = row.createCell(++cellNum);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(String.valueOf(tempMap.getOrDefault("StudentELIGIBILITY", "")));

		    // "주소"
		    cell = row.createCell(++cellNum);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(String.valueOf(tempMap.getOrDefault("StudentADDRESS", "")));

		    // "상세 주소"
		    cell = row.createCell(++cellNum);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(String.valueOf(tempMap.getOrDefault("StudentADDRESS_DETAIL", "")));

		    // 교사 정보는 별도의 로직이 필요하지 않는 경우 동일한 방식으로 추가합니다.
		    // "교사 아이디"
		    cell = row.createCell(++cellNum);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(String.valueOf(tempMap.getOrDefault("TeacherID", "")));

		    // "교사 이름"
		    cell = row.createCell(++cellNum);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(String.valueOf(tempMap.getOrDefault("TeacherName", "")));

		    // "교사 지역"
		    cell = row.createCell(++cellNum);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(String.valueOf(tempMap.getOrDefault("Teacher_ADDRESS_LOCAL", "")));

		    // "교사 학교 이름"
		    cell = row.createCell(++cellNum);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(String.valueOf(tempMap.getOrDefault("Teacher_SCHOOL_NAME", "")));

		    // "교사 성별"
		    cell = row.createCell(++cellNum);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(String.valueOf(tempMap.getOrDefault("TeacherSEX", "")));

		    // "교사 전화번호"
		    cell = row.createCell(++cellNum);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(String.valueOf(tempMap.getOrDefault("TeacherPHONE", "")));

		    // "교사 이메일"
		    cell = row.createCell(++cellNum);
		    cell.setCellStyle(bodyStyle);
		    cell.setCellValue(String.valueOf(tempMap.getOrDefault("TeacherEMAIL", "")));

		    // 모든 데이터를 셀에 추가한 후, 각 셀에 스타일을 적용합니다.
		    // 이 예시는 각 키(필드명)가 HashMap 내에 존재한다고 가정합니다.
		    // 실제 데이터에 따라 키 이름이나 처리 방식을 조정해야 할 수 있습니다.

		    // 열 너비 자동 조정을 위한 코드는 모든 셀 데이터 추가 후에 실행합니다.
		    for(int colIndex = 0; colIndex < columnCnt; colIndex++) {
		        sheet.autoSizeColumn(colIndex);
		    }

		}

	    // 컨텐츠 타입과 파일명 지정

	    response.setContentType("ms-vnd/excel");

	    response.setHeader("Content-Disposition", "attachment;filename=MEMBER.xls");

	    // 엑셀 출력
	   
	    try {
	    	wb.write(response.getOutputStream());
			wb.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
