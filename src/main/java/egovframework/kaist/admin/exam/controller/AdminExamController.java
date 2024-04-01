package egovframework.kaist.admin.exam.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.enterprise.inject.Model;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Row.MissingCellPolicy;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.system.util.SUtil;

import egovframework.kaist.admin.exam.model.AdminExamRespondentsVo;
import egovframework.kaist.admin.exam.model.AdminExamResultVo;
import egovframework.kaist.admin.exam.model.AdminExamVo;
import egovframework.kaist.admin.exam.service.AdminExamService;
import egovframework.kaist.admin.member.model.AdminMemberVo;
import egovframework.kaist.admin.member.service.AdminMemberService;
import egovframework.kaist.admin.question.model.AdminQuestionListVo;
import egovframework.kaist.admin.question.model.AdminQuestionVo;
import egovframework.kaist.admin.question.service.AdminQuestionService;

@Controller
public class AdminExamController {

	@Autowired
	AdminExamService adminExamService;
	
	@Autowired
	AdminQuestionService adminQuestionService;
	
	@Autowired
	AdminMemberService adminMemberService;

	
	//EXAM
	@RequestMapping(value="/admin/exam/list.do" , method = RequestMethod.GET)
	public ModelAndView AdminExamListGet(@ModelAttribute("AdminExamVo")AdminExamVo AdminExamVo , HttpServletRequest request , HttpServletResponse response) {
				
		ModelMap model = new ModelMap();
		
		model = adminExamService.getAllList(AdminExamVo);
		
		model.put("before", AdminExamVo);
		
		return new ModelAndView("admin/exam/list" , "model" , model);
		
	}
	
	@RequestMapping(value="/admin/exam/insert.do" , method = RequestMethod.GET)
	public ModelAndView AdminExamInsertGet(@ModelAttribute("AdminExamVo")AdminExamVo AdminExamVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		//model = adminExamService.getExamCategoryAllList();
		
		return new ModelAndView("admin/exam/insert" , "model" , model);
		
	}
	
	@RequestMapping(value="/admin/exam/insert.do", method = RequestMethod.POST )
	public void AdminExamInsertPost(@ModelAttribute("AdminExamVo")AdminExamVo AdminExamVo , MultipartHttpServletRequest request , HttpServletResponse response) throws IOException {
		
		adminExamService.setAdminExamData(AdminExamVo , "insert");
		
		SUtil.AlertAndPageMove(response, "해당 설문이 등록되었습니다.", "/admin/exam/list.do");
	
	}
	
	@RequestMapping(value="/admin/exam/update.do" , method = RequestMethod.GET)
	public ModelAndView AdminExamUpdateGet(@ModelAttribute("AdminExamVo")AdminExamVo AdminExamVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = adminExamService.getExamView(AdminExamVo);
		
		return new ModelAndView("admin/exam/update" , "model" , model);
		
	}
	
	@RequestMapping(value="/admin/exam/update.do", method = RequestMethod.POST)
	public void AdminExamUpdatePost(@ModelAttribute("AdminExamVo")AdminExamVo AdminExamVo ,  MultipartHttpServletRequest  request , HttpServletResponse response) throws IOException {
		
		adminExamService.setAdminExamData(AdminExamVo , "update");
		
		SUtil.AlertAndPageMove(response, "해당 설문이 수정되었습니다.", "/admin/exam/list.do");
		
	}
	
	@RequestMapping(value="/admin/exam/updateApi.do", method = RequestMethod.POST)
	public void AdminExamUpdatePostApi(@ModelAttribute("AdminExamVo")AdminExamVo AdminExamVo ,  HttpServletRequest  request , HttpServletResponse response){
		
		adminExamService.setAdminExamData(AdminExamVo , "update");
		
	}
	
	@RequestMapping(value="/admin/exam/delete.do" , method = RequestMethod.POST)
	public void AdminExamDeletePost(@ModelAttribute("AdminExamVo")AdminExamVo AdminExamVo , HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		//자가진단 폼 삭제 (해당 자가진단 참가한 인원 있을시 삭제 X)
		adminExamService.setAdminExamData(AdminExamVo, "delete");
		
		//해당 문항 및 답안 삭제
		SUtil.AlertAndPageMove(response, "해당 설문이 삭제 되었습니다.", "/admin/exam/list.do");
	}
	
	@RequestMapping(value="/admin/exam/status.do" , method = RequestMethod.GET)
	public ModelAndView AdminExamStatusData(@ModelAttribute("AdminExamVo")AdminExamVo AdminExamVo , HttpServletRequest request , HttpServletResponse response){
		
		ModelMap model = new ModelMap();
	
		model = adminExamService.getStatusData(AdminExamVo);
		
		model.put("before", AdminExamVo);
		
		return new ModelAndView( "admin/exam/status" , "model" , model);
		
	}
	
	
	//QUESTION_LIST 부분
	@RequestMapping(value="/admin/exam/question_list.do" , method = RequestMethod.GET)
	public ModelAndView AdminExamQuestionList(@ModelAttribute("AdminQuestionListVo")AdminQuestionListVo AdminQuestionListVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = adminExamService.getQuestionList(AdminQuestionListVo);
		
		model.put("exam_idx", AdminQuestionListVo.getExam_idx());
		
		String category = request.getParameter("category") != null ? request.getParameter("category") : "0";
		
		model.put("category", category);
		
		AdminQuestionVo question = new AdminQuestionVo();
		
		List<?> list = adminQuestionService.getQuestionAllList(question);
		
		List<?> TypeList = adminQuestionService.getTypeAllList();
		
		model.put("question_list",list);
		model.put("TypeList", TypeList);
		
		return new ModelAndView("admin/exam/question_list" , "model" , model);
		
	}
	
	@RequestMapping(value="/admin/exam/question_list/insert.do" , method = RequestMethod.POST)
	public void AdminExamQuestionListInsert(@ModelAttribute("AdminQuestionListVo")AdminQuestionListVo AdminQuestionListVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminExamService.setAdminExamQuestionList(AdminQuestionListVo , "insert");
		
	}
	
	@RequestMapping(value="/admin/exam/question_list/update.do" , method = RequestMethod.POST)
	public void AdminExamQuestionListUpdate(@ModelAttribute("AdminQuestionListVo")AdminQuestionListVo AdminQuestionListVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminExamService.setAdminExamQuestionList(AdminQuestionListVo , "update");
		
	}
	
	@RequestMapping(value="/admin/exam/question_list/delete.do" , method = RequestMethod.POST)
	public void AdminExamQuestionListDelete(@ModelAttribute("AdminQuestionListVo")AdminQuestionListVo AdminQuestionListVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminExamService.setAdminExamQuestionList(AdminQuestionListVo , "delete");
		
	}
	
	@RequestMapping(value="/admin/question_list/sort.do" , method = RequestMethod.POST)
	public void AdminQuestionSortList(@ModelAttribute("AdminQuestionListVo")AdminQuestionListVo AdminQuestionListVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminExamService.setAdminExamQuestionSort(AdminQuestionListVo);
		
	}
	
	@RequestMapping(value="/admin/exam/respondents/list.do" , method = RequestMethod.GET)
	public ModelAndView AdminExamRespondents(@ModelAttribute("AdminExamRespondentsVo")AdminExamRespondentsVo AdminExamRespondentsVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = adminExamService.getExamRespondentsList(AdminExamRespondentsVo);
		
		model.put("before", AdminExamRespondentsVo);
		
		return new ModelAndView("admin/exam/respondents", "model" , model);
		
	}
	
	@RequestMapping(value="/admin/exam/respondents/insert.do" , method = RequestMethod.POST)
	public void AdminExamRespondentsInsert(@ModelAttribute("AdminExamRespondentsVo")AdminExamRespondentsVo AdminExamRespondentsVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminExamService.setExamRespondents(AdminExamRespondentsVo , "insert");
		
	}
	
	@RequestMapping(value="/admin/exam/respondents/Ajaxlist.do" , method = RequestMethod.POST)
	public ModelAndView AdminExamRespondentsAJAX(@ModelAttribute("AdminExamRespondentsVo")AdminExamRespondentsVo AdminExamRespondentsVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		System.out.println("callType : " + AdminExamRespondentsVo.getCalltype());
		
		model = adminExamService.getExamRespondentsAjaxList(AdminExamRespondentsVo , AdminExamRespondentsVo.getCalltype());
		
		return new ModelAndView("admin/exam/ResponAjax", "model" , model);
		
	}
	
	@RequestMapping(value="/admin/exam/respondents/delete.do" , method = RequestMethod.POST)
	public void AdminExamRespondentsDelete(@ModelAttribute("AdminExamRespondentsVo")AdminExamRespondentsVo AdminExamRespondentsVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminExamService.setExamRespondents(AdminExamRespondentsVo , "delete");
		
	}
	
	@RequestMapping(value="/admin/exam/respondents/listCnt.do" , method = RequestMethod.POST,produces = "application/json; charset=utf8")
	@ResponseBody
	public String AdminExamRespondentsCnt(@ModelAttribute("AdminExamRespondentsVo")AdminExamRespondentsVo AdminExamRespondentsVo , HttpServletRequest request , HttpServletResponse response)throws JsonProcessingException {
		
		int result = adminExamService.getExamRespondentsAjaxListCnt(AdminExamRespondentsVo);
		
		System.out.println(result);
		
		String resultData = Integer.toString(result);
		
		return resultData;
		
	}
	
	@RequestMapping(value="/admin/exam/respondents/excelDown.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public String AdminExamRespondentsListExcelDown(@ModelAttribute("AdminExamRespondentsVo")AdminExamRespondentsVo AdminExamRespondentsVo, HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = adminExamService.getExamRespondentsList(AdminExamRespondentsVo);
		
		List<HashMap> list = (List<HashMap>) model.get("respondents");
		
		Workbook workbook = new HSSFWorkbook();
		
		// 시트 생성
        Sheet sheet = workbook.createSheet("응답자 리스트");

        // 헤더 스타일 생성
        CellStyle headerStyle = workbook.createCellStyle();
        headerStyle.setAlignment(HorizontalAlignment.CENTER);
        headerStyle.setFillForegroundColor(IndexedColors.SKY_BLUE.getIndex());
        headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        
        Font font = workbook.createFont();
        font.setBold(true);
        font.setFontHeightInPoints((short) 12);
        headerStyle.setFont(font);

        // 바디 스타일 생성
        CellStyle bodyStyle = workbook.createCellStyle();
        bodyStyle.setAlignment(HorizontalAlignment.CENTER);

        // 헤더 생성
        String[] headers = {"아이디" , "성명" , "타입" , "전화번호" , "학교 명" , "응답 여부"};
        Row headerRow = sheet.createRow(0);
        for (int i = 0; i < headers.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(headers[i]);
            cell.setCellStyle(headerStyle);
        }
        
     // 데이터 채우기
        int rowIndex = 1;
        
        for (HashMap<String, Object> respondents : list) {
            Row row = sheet.createRow(rowIndex++);

            
            // "문항 순서"는 엑셀 파일 내의 순서를 반영
            row.createCell(0).setCellValue(String.valueOf(respondents.getOrDefault("member_id", "")));
            row.createCell(1).setCellValue(String.valueOf(respondents.getOrDefault("name", "")));
            
            
            // "문항 타입" 변환
            String selectType = "";
            switch (String.valueOf(respondents.getOrDefault("type", ""))) {
                case "1":
                    selectType = "학생";
                    break;
                case "2":
                    selectType = "교사";
                    break;
            }
            row.createCell(2).setCellValue(selectType);

            // "선택지 갯수"와 "선택지 리스트"
            row.createCell(3).setCellValue(String.valueOf(respondents.getOrDefault("phone", "")));
            row.createCell(4).setCellValue(String.valueOf(respondents.getOrDefault("school_name", "")));
            row.createCell(5).setCellValue(String.valueOf(respondents.getOrDefault("respondents", "")));
            
            
        }

        
        // 열 너비 자동 조정
        for (int i = 0; i < headers.length; i++) {
            sheet.autoSizeColumn(i);
        }
        
        String result = "false";
        
        // 파일 저장 경로 설정
        String realPath = request.getRealPath("");
        String resourcesPath = "./resources" + request.getContextPath() + "/upload/exam/respondents/excel/";
        String savePath = realPath + resourcesPath;

        // 디렉토리 생성
        File directory = new File(savePath);
        if (!directory.exists()) {
            directory.mkdirs(); // 디렉토리가 존재하지 않는 경우, 디렉토리 생성
        }
        
        try {
            // 엑셀 파일 임시 저장 (임시 파일명 사용 또는 직접 지정)
            String tempFileName = AdminExamRespondentsVo.getName() + "_응답자리스트.xls";
            FileOutputStream fileOut = new FileOutputStream(savePath + tempFileName);
            workbook.write(fileOut);
            fileOut.close();
            workbook.close();
            
            // 파일 링크 설정 수정
            result = "{\"filePath\":\"" + request.getContextPath() + "/resources/upload/exam/respondents/excel/" + tempFileName + "\"}";

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        System.out.println(result);
        
        return result;
		
	}
	
	@RequestMapping(value="/admin/exam/respondents/ExcelUpload.do" , method = RequestMethod.POST,produces = "application/json; charset=utf8")
	@ResponseBody
	public String RespondentsExcelUpload(MultipartHttpServletRequest request , HttpServletResponse response) throws UnsupportedEncodingException, JsonProcessingException{
		
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+request.getContextPath()+"/upload/exam/respondents/";
		System.out.println(drv);
		String filename = SUtil.setFileUpload(request, drv);
		
		filename = URLDecoder.decode(filename, "utf-8"); 
		
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		
		try {
            FileInputStream fis = new FileInputStream(drv + filename);
            HSSFWorkbook workbook = new HSSFWorkbook(fis);
            HSSFSheet sheet = workbook.getSheetAt(0); // 해당 엑셀파일의 시트(Sheet) 수
            int rows = sheet.getPhysicalNumberOfRows(); // 해당 시트의 행의 개수
            
            
            for (int rowIndex = 1; rowIndex < rows; rowIndex++)
            {
            	HSSFRow row = sheet.getRow(rowIndex); // 각 행을 읽어온다
                if (row != null) {
                	
                	HashMap<String, Object> map = new HashMap<String, Object>();
                	
                	int cells = row.getPhysicalNumberOfCells();
                	for (int columnIndex = 0; columnIndex <= 4; columnIndex++)
                    {
                		 HSSFCell cell = row.getCell(columnIndex); // 셀에 담겨있는 값을 읽는다.
                         String value = "";
                         try {
                         	switch (cell.getCellType()) 
                             { // 각 셀에 담겨있는 데이터의 타입을 체크하고 해당 타입에 맞게 가져온다.
     	                        case HSSFCell.CELL_TYPE_NUMERIC:
     	                            value = (int)cell.getNumericCellValue() + "";
     	                            break;
     	                        case HSSFCell.CELL_TYPE_STRING:
     	                            value = cell.getStringCellValue() + "";
     	                            break;
     	                        case HSSFCell.CELL_TYPE_BLANK:
     	                            value = cell.getBooleanCellValue() + "";
     	                            break;
     	                        case HSSFCell.CELL_TYPE_ERROR:
     	                            value = cell.getErrorCellValue() + "";
     	                            break;
                             }	
                         }catch(java.lang.NullPointerException e)
                         {
                         	try {
                         		value = cell.getStringCellValue() + "";	
                         	}catch(java.lang.NullPointerException e1)
                         	{
                         		value = "";
                         	}
                         }
                         
                         if(columnIndex == 0)
                         {
                         	value = value.replace(" ", "");
                         	System.out.println(value);
                         	String columnKey = "MEMBER_ID"; // 예시 키 값
                            map.put(columnKey, value);
                         	
                         }
                         else if(columnIndex == 1)
                         {
                        	 value = value.replace(" ", "");
                        	 System.out.println(value);
                        	 String columnKey = "TYPE"; // 예시 키 값
                             map.put(columnKey, value);
                         }
                         else if(columnIndex == 2)
                         {
                        	 value = value.replace(" ", "");
                        	 System.out.println(value);
                        	 String columnKey = "SCHOOL_NAME"; // 예시 키 값
                             map.put(columnKey, value);
                        	 
                         }else if(columnIndex == 3)
                         {
                        	value = value.replace(" ", "");
                         	System.out.println(value);
                         	String columnKey = "NAME"; // 예시 키 값
                            map.put(columnKey, value);
                         	
                         }
                         else if(columnIndex == 4)
                         {
                        	value = value.replace(" ", "");
                        	value = value.replace("-", "");
                          	System.out.println(value);
                          	String columnKey = "PHONE"; // 예시 키 값
                            map.put(columnKey, value);
                            
                         }
                         
                         
                    }
                	
                	list.add(map);
                	
                }
            }
            
		} catch (IOException e) {
            e.printStackTrace();
        }
		
		System.out.println("All-Complete");
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(list);
		return jsonStr;
		
	}
	
	@RequestMapping(value="/admin/exam/respondents/ExcelDataUpload.do" , method = RequestMethod.POST ,produces = "application/json; charset=utf8")
	@ResponseBody
	public String AdminExamRespondentsExcelDataUpload(@RequestParam("dataList") String dataListStr, @ModelAttribute("AdminExamRespondentsVo")AdminExamRespondentsVo AdminExamRespondentsVo ,HttpServletRequest request , HttpServletResponse response) {
		
		try {
            ObjectMapper mapper = new ObjectMapper();
            // JSON 문자열을 자바 객체로 변환
            List<Map<String, Object>> dataList = mapper.readValue(dataListStr, List.class);

            for (Map<String, Object> data : dataList) {
            	
            	//값 설정
                AdminExamRespondentsVo.setMember_id(String.valueOf(data.getOrDefault("MEMBER_ID", "")));
                AdminExamRespondentsVo.setName(String.valueOf(data.getOrDefault("NAME", "")));
                AdminExamRespondentsVo.setSchool_name(String.valueOf(data.getOrDefault("SCHOOL_NAME", "")));
                String Type = String.valueOf(data.getOrDefault("TYPE", ""));
                switch (Type) {
				case "학생":
					Type = "1";
					break;
				case "교사":
					Type = "2";
					break;
				}
                AdminExamRespondentsVo.setType(Type);
                AdminExamRespondentsVo.setPhone(String.valueOf(data.getOrDefault("PHONE", "")));
                
                adminExamService.setExamRespondents(AdminExamRespondentsVo , "insert");
                
                //초기화
                AdminExamRespondentsVo.setMember_id(null);
                AdminExamRespondentsVo.setName(null);
                AdminExamRespondentsVo.setSchool_name(null);
                AdminExamRespondentsVo.setType(null);
                AdminExamRespondentsVo.setPhone(null);
                
                
            }

            return "{\"result\":\"success\"}";
        } catch (Exception e) {
            e.printStackTrace();
            return "{\"result\":\"error\"}";
        }
	}
	
	@RequestMapping(value="/admin/exam/respondents/GroupList.do" , method = RequestMethod.POST)
	public String AdminRespondentsGroupListPost(@ModelAttribute("AdminMemberVo")AdminMemberVo AdminMemberVo , HttpServletRequest request , HttpServletResponse response) throws JsonProcessingException {
		
		List<?> list = adminMemberService.getGroupMemberList(AdminMemberVo);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(list);
		return jsonStr;
		
	}
	
	
	/*
	 * 2024 신규 수정 페이지
	 * */
	
	@RequestMapping(value="/admin/exam/test/insert.do" , method = RequestMethod.GET)
	public String AdminExamInsertGet2(HttpServletRequest request , HttpServletResponse response) {
		
		return "/admin/exam/test";
		
	}
	
	@RequestMapping(value="/admin/exam/test/insert.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public String AdminExamInsertPost2(@RequestParam("surveyData") String surveyDataStr ,HttpServletRequest request , HttpServletResponse response) {
		
		try {
	        ObjectMapper mapper = new ObjectMapper();
	        // JSON 문자열을 자바 객체로 변환
	        Map<String, Object> surveyDataMap = mapper.readValue(surveyDataStr, new TypeReference<Map<String, Object>>() {});

	        // 여기서부터 설문 제목, 설명 등을 추출
	        String title = String.valueOf(surveyDataMap.getOrDefault("title", ""));
	        String description = String.valueOf(surveyDataMap.getOrDefault("description", ""));
	        List<Map<String, Object>> questions = (List<Map<String, Object>>) surveyDataMap.get("questions");
	        
	        System.out.println("exam_title" + title);
	        System.out.println("exam_description" + description);

	        //설문 데이터 생성
	        
	        // questions 리스트 처리
	        for (Map<String, Object> questionMap : questions) {
	            String questionText =  String.valueOf(questionMap.getOrDefault("title", ""));
	            String questionType = String.valueOf(questionMap.getOrDefault("type", ""));
	            List<String> answers = (List<String>) questionMap.get("answers");
	            
	            System.out.println("question_text : " + questionText);
	            System.out.println("question_type : " + questionType);
	            
	            // 여기서 각 질문의 답변 리스트를 반복 처리합니다.
	            for (String answer : answers) {
	                // 답변 처리 로직
	                // 예: 데이터베이스에 질문과 함께 저장
	                System.out.println("answer : " + answer); // 답변 내용 출력 또는 처리
	            }
	            
	        }

	        return "{\"result\":\"success\"}";
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "{\"result\":\"error\"}";
	    }
	}
	
	@RequestMapping(value="/admin/exam/respondents/result.do" , method = RequestMethod.GET)
	public ModelAndView AdminExamRespondentsResultList(@ModelAttribute("AdminExamRespondentsVo")AdminExamRespondentsVo AdminExamRespondentsVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = adminExamService.getExamRespondentsResultList(AdminExamRespondentsVo);
		
		model.put("before", AdminExamRespondentsVo);
		
		return new ModelAndView("admin/exam/respondents_result", "model" , model);
		
	}
	
	@RequestMapping(value="/admin/exam/respondents/result/view.do" , method = RequestMethod.GET)
	public ModelAndView AdminExamRespndentsResultView(@ModelAttribute("AdminExamRespondentsVo")AdminExamRespondentsVo AdminExamRespondentsVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = adminExamService.getExamRespondentsResultView(AdminExamRespondentsVo);
		
		model.put("before", AdminExamRespondentsVo);
		
		return new ModelAndView("admin/exam/respondents_view", "model" , model);
		
	}
	
	// 응답 문자열 파싱 메서드
	public static List<String> parseSelectList(String selectList) {
	    List<String> parts = new ArrayList<>();
	    String regex = "\\[.*?\\]|[^,]+";
	    Pattern pattern = Pattern.compile(regex);
	    Matcher matcher = pattern.matcher(selectList);

	    while (matcher.find()) {
	        parts.add(matcher.group());
	    }

	    return parts;
	}
	
	@RequestMapping(value="/admin/exam/result/excel.do" , method = RequestMethod.POST ,produces = "application/json; charset=utf8" )
	@ResponseBody
	public String AdminExamResultExcel(@ModelAttribute("AdminExamVo")AdminExamVo adminExamVo , HttpServletRequest request , HttpServletResponse response) {
		
		String result = "false";
		
		ModelMap model = new ModelMap();
		
		//해당 엑셀에 필요한 데이터 가져오기
		//question = 문항 리스트
		//respondents = 응답 리스트
		model = adminExamService.getExamResultExcelData(adminExamVo);
		
		List<HashMap> questionList = (List<HashMap>) model.get("question");
		
		List<HashMap> respondents = (List<HashMap>) model.get("respondents");

		Workbook workbook = new HSSFWorkbook(); // XSSFWorkbook for .xls files

		
        // 시트 생성
        Sheet sheet = workbook.createSheet("문항 리스트");

        // 헤더 스타일 생성
        CellStyle headerStyle = workbook.createCellStyle();
        headerStyle.setAlignment(HorizontalAlignment.CENTER);
        headerStyle.setFillForegroundColor(IndexedColors.SKY_BLUE.getIndex());
        headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        
        Font font = workbook.createFont();
        font.setBold(true);
        font.setFontHeightInPoints((short) 12);
        headerStyle.setFont(font);

        // 바디 스타일 생성
        CellStyle bodyStyle = workbook.createCellStyle();
        bodyStyle.setAlignment(HorizontalAlignment.CENTER);

        // 헤더 생성
        String[] headers = {"문항 순서", "문항 제목", "문항 타입", "선택지 갯수", "선택지"};
        Row headerRow = sheet.createRow(0);
        for (int i = 0; i < headers.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(headers[i]);
            cell.setCellStyle(headerStyle);
        }

        // 데이터 채우기
        int rowIndex = 1;
        
        for (HashMap<String, Object> question : questionList) {
            Row row = sheet.createRow(rowIndex++);

            
            // "문항 순서"는 엑셀 파일 내의 순서를 반영
            row.createCell(0).setCellValue(rowIndex - 1);
            row.createCell(1).setCellValue(String.valueOf(question.getOrDefault("name", "")));
            
            
            // "문항 타입" 변환
            String selectType = "";
            switch (String.valueOf(question.getOrDefault("select_type", ""))) {
                case "1":
                    selectType = "객관식";
                    break;
                case "2":
                    selectType = "체크박스";
                    break;
                case "3":
                    selectType = "답변형";
                    break;
            }
            row.createCell(2).setCellValue(selectType);

            // "선택지 갯수"와 "선택지 리스트"
            row.createCell(3).setCellValue(String.valueOf(question.getOrDefault("select_count", "")));
         // 선택지 정보를 가져옵니다.
            String choicesStr = String.valueOf(question.getOrDefault("Choices", ""));
            // 선택지 정보를 '#' 기준으로 분리합니다.
            
            if(!selectType.equals("답변형")) {
            	
                String[] choicesArr = choicesStr.split("#");

                // 결과 문자열을 저장할 StringBuilder 객체를 생성합니다.
                StringBuilder formattedChoices = new StringBuilder();

                // 분리된 선택지 정보를 순회하면서 번호를 붙여 문자열을 구성합니다.
                for (int i = 0; i < choicesArr.length; i++) {
                    // i + 1은 선택지 앞에 붙일 순서 번호입니다.
                    formattedChoices.append(i + 1).append(". ").append(choicesArr[i]);
                    // 마지막 선택지가 아니라면 공백을 추가합니다.
                    if (i < choicesArr.length - 1) {
                        formattedChoices.append(" ");
                    }
                }

                // 엑셀 셀에 구성된 문자열을 기록합니다.
                row.createCell(4).setCellValue(formattedChoices.toString());
            	
            }
            
        }

        // 제목행에만 배경색 스타일 적용
        Row headerRow1 = sheet.getRow(0); // 0번째 행이 제목행이라고 가정
        if (headerRow1 != null) {
            for (int cellNum = 0; cellNum < headerRow1.getLastCellNum(); cellNum++) {
                Cell cell = headerRow1.getCell(cellNum, MissingCellPolicy.CREATE_NULL_AS_BLANK);
                cell.setCellStyle(headerStyle);
            }
        }

        // 중앙 정렬 스타일 생성
        CellStyle centerAlignStyle = workbook.createCellStyle();
        centerAlignStyle.setAlignment(HorizontalAlignment.CENTER);
        centerAlignStyle.setVerticalAlignment(VerticalAlignment.CENTER);
        
        // 나머지 행들에 대해서는 기존에 정의한 중앙 정렬 스타일 적용
        for (int rowNum1 = 1; rowNum1 <= sheet.getLastRowNum(); rowNum1++) {
            Row row = sheet.getRow(rowNum1);
            if (row != null) {
                for (int cellNum = 0; cellNum < row.getLastCellNum(); cellNum++) {
                    Cell cell = row.getCell(cellNum, MissingCellPolicy.CREATE_NULL_AS_BLANK);
                    cell.setCellStyle(centerAlignStyle);
                }
            }
        }
        
        // 열 너비 자동 조정
        for (int i = 0; i < headers.length; i++) {
            sheet.autoSizeColumn(i , true);
            int width = sheet.getColumnWidth(i);
            sheet.setColumnWidth(i, width + 1024);
        }
        
        // 두 번째 시트 생성
        Sheet sheet2 = workbook.createSheet("응답자");
        
     // 헤더 생성
        List<String> headers2 = new ArrayList<>(Arrays.asList("응답 시간", "응답자 아이디", "응답자 성명"));
        // 문항 제목을 헤더에 추가
        for (HashMap<String, Object> question : questionList) {
            headers2.add(String.valueOf(question.getOrDefault("name","")));
        }
        // 헤더 행에 셀을 생성하고 값 할당
        Row headerRow2 = sheet2.createRow(0);
        for (int i = 0; i < headers2.size(); i++) {
            Cell cell = headerRow2.createCell(i);
            cell.setCellValue(headers2.get(i));
            cell.setCellStyle(headerStyle);
        }

        
        // 문항 ID와 선택지 텍스트를 매핑합니다.
        Map<Integer, String[]> questionIdToChoices = new HashMap<>();
        Map<Integer, Integer> seqToQuestionId = new HashMap<>();
        for (HashMap<String, Object> question : questionList) {
            int questionId = Integer.parseInt(String.valueOf(question.get("idx")));
            String choicesStr = String.valueOf(question.getOrDefault("Choices", ""));
            String[] choicesArr = choicesStr.split("#");
            questionIdToChoices.put(questionId, choicesArr);
            int seq = Integer.parseInt(String.valueOf(question.getOrDefault("seq", "0")));
            seqToQuestionId.put(seq, questionId);
        }

     // 응답자 데이터 입력
        int rowNum = 1;
        for (HashMap<String, Object> respondent : respondents) {
        	Row row = sheet2.createRow(rowNum++);
        	row.createCell(0).setCellValue(String.valueOf(respondent.getOrDefault("complete_tm", "")));
            row.createCell(1).setCellValue(String.valueOf(respondent.getOrDefault("member_id", ""))); // "응답자 아이디"
            row.createCell(2).setCellValue(String.valueOf(respondent.getOrDefault("name", ""))); // "응답자 성명"
            // "응답 결과" 분석 및 셀에 값 할당
            String selectList = String.valueOf(respondent.getOrDefault("select_list", ""));
            List<String> selectedOptions = parseSelectList(selectList);
            for (int seq = 1; seq <= selectedOptions.size(); seq++) {
                String response1 = selectedOptions.get(seq - 1);
                Integer questionId = seqToQuestionId.get(seq);
                if (questionId != null && questionIdToChoices.containsKey(questionId)) {
                    String[] choices = questionIdToChoices.get(questionId);
                    if (response1.matches("\\[.*\\]")) { // 체크박스 응답일 경우
                    	response1 = response1.substring(1, response1.length() - 1); // 대괄호 제거
                        String[] subResponses = response1.split(",");
                        StringBuilder choiceText = new StringBuilder();
                        for (String subResponse : subResponses) {
                            int choiceIndex = Integer.parseInt(subResponse.trim()) - 1; // 선택지 인덱스, 공백 제거를 위해 trim() 사용
                            if (choiceIndex >= 0 && choiceIndex < choices.length) {
                                choiceText.append(choices[choiceIndex]); // 선택지 텍스트 추가
                                if (!subResponse.equals(subResponses[subResponses.length - 1])) { // 마지막 선택지가 아닐 경우, 쉼표 추가
                                    choiceText.append(", ");
                                }
                            }
                        }
                        row.createCell(seq + 2).setCellValue(choiceText.toString()); // 셀에 선택지 텍스트 할당
                    } else if (response1.matches("\\d+")) { // 단일 선택지 응답일 경우
                        int choiceIndex = Integer.parseInt(response1) - 1;
                        if (choiceIndex >= 0 && choiceIndex < choices.length) {
                            row.createCell(seq + 2).setCellValue(choices[choiceIndex]);
                        }
                    } else { // 답변형 응답일 경우
                        row.createCell(seq + 2).setCellValue(response1);
                    }
                }
            }
        }
        

        // 제목행에만 배경색 스타일 적용
        if (headerRow2 != null) {
            for (int cellNum = 0; cellNum < headerRow2.getLastCellNum(); cellNum++) {
                Cell cell = headerRow2.getCell(cellNum, MissingCellPolicy.CREATE_NULL_AS_BLANK);
                cell.setCellStyle(headerStyle);
            }
        }
        
        // 나머지 행들에 대해서는 기존에 정의한 중앙 정렬 스타일 적용
        for (int rowNum2 = 1; rowNum2 <= sheet2.getLastRowNum(); rowNum2++) {
            Row row = sheet2.getRow(rowNum2);
            if (row != null) {
                for (int cellNum = 0; cellNum < row.getLastCellNum(); cellNum++) {
                    Cell cell = row.getCell(cellNum, MissingCellPolicy.CREATE_NULL_AS_BLANK);
                    cell.setCellStyle(centerAlignStyle);
                }
            }
        }
        
        // 열 너비 자동 조정
        for (int i = 0; i < headers2.size(); i++) {
            sheet2.autoSizeColumn(i , true);
            int width = sheet2.getColumnWidth(i);
            sheet2.setColumnWidth(i, width + 1024);
        }


     
        
     // 3번째 시트 생성
        Sheet sheet3 = workbook.createSheet("응답 통계");

        // 헤더 생성
        Row headerRow3 = sheet3.createRow(0);
        String[] headers1 = {"문항 제목", "선택지", "응답 횟수" , "응답 통계"};
        for (int i = 0; i < headers1.length; i++) {
            Cell cell = headerRow3.createCell(i);
            cell.setCellValue(headers1[i]);
            cell.setCellStyle(headerStyle); // 앞서 정의한 headerStyle 사용
        }

        int rowIndex1 = 1; // 데이터를 쓸 행의 시작 인덱스

        // 문항별 선택지 카운트 및 답변형 응답을 저장할 구조 초기화
        Map<Integer, Map<String, Integer>> questionChoiceCounts = new HashMap<>();
        Map<Integer, Map<String, Integer>> questionTextResponses = new HashMap<>();
        
        
        // 문항 리스트에서 각 문항의 정보 추출 및 초기화
        for (HashMap<String, Object> question : questionList) {
        	Integer questionId = Integer.parseInt(String.valueOf(question.get("idx")));
            questionChoiceCounts.put(questionId, new HashMap<>()); // 선택지 카운트용
            questionTextResponses.put(questionId, new HashMap<>()); // 답변형 응답용
        }

        // 응답자의 선택을 파싱하여 카운트 집계
        for (HashMap<String, Object> respondent : respondents) {
            String selectList = String.valueOf(respondent.get("select_list"));
            List<String> responses = parseSelectList(selectList);

            // 가정: 응답자의 응답은 questionList의 순서와 일치한다고 가정
            for (int i = 0; i < responses.size(); i++) {
                Integer questionId = Integer.parseInt(String.valueOf(questionList.get(i).get("idx")));
                String response1 = responses.get(i);

                // 선택지 타입에 따라 분기 처리
                switch (String.valueOf(questionList.get(i).get("select_type"))) {
                    case "1": // 객관식
                    case "2": // 체크박스
                        if (response1.matches("\\[.*\\]")) {
                            // 체크박스 응답 처리
                            response1 = response1.replaceAll("\\[|\\]", ""); // 대괄호 제거
                            String[] selectedOptions = response1.split(",");
                            for (String option : selectedOptions) {
                                questionChoiceCounts.get(questionId).put(option, questionChoiceCounts.get(questionId).getOrDefault(option, 0) + 1);
                            }
                        } else {
                            // 객관식 응답 처리
                            questionChoiceCounts.get(questionId).put(response1, questionChoiceCounts.get(questionId).getOrDefault(response1, 0) + 1);
                        }
                        break;
                    case "3": // 답변형
                    	Map<String, Integer> textResponses = questionTextResponses.get(questionId);
                        textResponses.put(response1, textResponses.getOrDefault(response1, 0) + 1);
                        break;
                }
            }
        }
        
        // 각 문항별 응답 데이터 쓰기
        for (HashMap<String, Object> question : questionList) {
            Integer questionId = Integer.parseInt(String.valueOf(question.getOrDefault("idx", "")));
            Map<String, Integer> choiceCounts = questionChoiceCounts.get(questionId);
            Map<String, Integer> textResponses = questionTextResponses.get(questionId);
            String questionTitle = String.valueOf(question.getOrDefault("name",""));

            // 문항 기본 정보 표시 (문항 번호와 제목)
            Row questionRow = sheet3.createRow(rowIndex1++);
            questionRow.createCell(0).setCellValue(String.valueOf(question.getOrDefault("name", "")));

            // 선택지 유형에 따라 데이터 쓰기
            String selectType = String.valueOf(question.getOrDefault("select_type", ""));
            
            // 답변형 응답에 대한 총 응답수 계산
            int totalTextResponseCount = textResponses.values().stream().mapToInt(count -> count).sum();
            
            if (!selectType.equals("3")) { // 라디오박스 또는 체크박스
            	// 전체 응답 횟수 계산
                int totalResponses = choiceCounts.values().stream().mapToInt(Integer::intValue).sum();
                String choicesStr = String.valueOf(question.get("Choices")); // "2021#2022#2023"
                String[] choicesArr = choicesStr.split("#");
                
                for (Map.Entry<String, Integer> choice : choiceCounts.entrySet()) {
                    Row choiceRow = sheet3.createRow(rowIndex1++);
                    int choiceIndex = Integer.parseInt(choice.getKey()) - 1;
                    choiceRow.createCell(1).setCellValue(choicesArr[choiceIndex]);
                    choiceRow.createCell(2).setCellValue(choice.getValue());
                    
                    // "응답 비율" 셀에 응답 비율 계산 및 입력
                    if (totalResponses > 0) { // 분모가 0이 아닌 경우에만 계산
                        double responseRate = (double) choice.getValue() / totalResponses * 100; // 응답 비율 계산
                        choiceRow.createCell(3).setCellValue(String.format("%.2f%%", responseRate)); // 소수점 둘째 자리까지 표시
                    } else {
                    	choiceRow.createCell(3).setCellValue("N/A"); // 응답이 없는 경우
                    }
                    
                }
                
                
            } else { // 답변형
            	// 답변형 응답 데이터 기록
            	Map<String, Integer> responses = questionTextResponses.get(questionId);
                // 답변형 응답에 대한 총 응답수 계산
                int totalResponses = responses.values().stream().mapToInt(Integer::intValue).sum();

                questionRow.createCell(0).setCellValue(questionTitle);

                for (Map.Entry<String, Integer> response1 : responses.entrySet()) {
                    String responseText = response1.getKey();
                    Integer count = response1.getValue();
                    double percentage = totalResponses > 0 ? (double) count / totalResponses * 100 : 0;

                    Row responseRow = sheet3.createRow(rowIndex1++);
                    responseRow.createCell(1).setCellValue(responseText);
                    responseRow.createCell(2).setCellValue(count);
                    responseRow.createCell(3).setCellValue(String.format("%.2f%%", percentage));
                }

             
                
            }
        }

        // 제목행에만 배경색 스타일 적용
        if (headerRow3 != null) {
            for (int cellNum = 0; cellNum < headerRow3.getLastCellNum(); cellNum++) {
                Cell cell = headerRow3.getCell(cellNum, MissingCellPolicy.CREATE_NULL_AS_BLANK);
                cell.setCellStyle(headerStyle);
            }
        }
        
        // 나머지 행들에 대해서는 기존에 정의한 중앙 정렬 스타일 적용
        for (int rowNum3 = 1; rowNum3 <= sheet3.getLastRowNum(); rowNum3++) {
            Row row = sheet3.getRow(rowNum3);
            if (row != null) {
                for (int cellNum = 0; cellNum < row.getLastCellNum(); cellNum++) {
                    Cell cell = row.getCell(cellNum, MissingCellPolicy.CREATE_NULL_AS_BLANK);
                    cell.setCellStyle(centerAlignStyle);
                }
            }
        }
        
        // 열 너비 자동 조정
        for (int i = 0; i < headers1.length; i++) {
        	sheet3.autoSizeColumn(i , true);
            int width = sheet3.getColumnWidth(i);
            sheet3.setColumnWidth(i, width + 1024);
        }

        // 파일 저장 경로 설정
        String realPath = request.getRealPath("");
        String resourcesPath = "./resources" + request.getContextPath() + "/upload/exam/excel/";
        String savePath = realPath + resourcesPath;

        // 디렉토리 생성
        File directory = new File(savePath);
        if (!directory.exists()) {
            directory.mkdirs(); // 디렉토리가 존재하지 않는 경우, 디렉토리 생성
        }
        
        try {
            // 엑셀 파일 임시 저장 (임시 파일명 사용 또는 직접 지정)
            String tempFileName = adminExamVo.getName() + "_total.xls";
            FileOutputStream fileOut = new FileOutputStream(savePath + tempFileName);
            workbook.write(fileOut);
            fileOut.close();
            workbook.close();
            
            // 파일 링크 설정 수정
            result = "{\"filePath\":\"" + request.getContextPath() + "/resources/upload/exam/excel/" + tempFileName + "\"}";

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        System.out.println(result);
        
        return result;
		
	}
	
	
}
