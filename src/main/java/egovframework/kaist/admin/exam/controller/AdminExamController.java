package egovframework.kaist.admin.exam.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.enterprise.inject.Model;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.system.util.SUtil;

import egovframework.kaist.admin.exam.model.AdminExamRespondentsVo;
import egovframework.kaist.admin.exam.model.AdminExamResultVo;
import egovframework.kaist.admin.exam.model.AdminExamVo;
import egovframework.kaist.admin.exam.service.AdminExamService;
import egovframework.kaist.admin.question.model.AdminQuestionListVo;
import egovframework.kaist.admin.question.model.AdminQuestionVo;
import egovframework.kaist.admin.question.service.AdminQuestionService;

@Controller
public class AdminExamController {

	@Autowired
	AdminExamService adminExamService;
	
	@Autowired
	AdminQuestionService adminQuestionService;

	
	//EXAM
	@RequestMapping(value="/admin/exam/list.do" , method = RequestMethod.GET)
	public ModelAndView AdminExamListGet(@ModelAttribute("AdminExamVo")AdminExamVo AdminExamVo , HttpServletRequest request , HttpServletResponse response) {
		
		System.out.println("PAGE : " + AdminExamVo.getPAGE());
		System.out.println("ITEM_COUNT : " + AdminExamVo.getITEM_COUNT());
		
		String PAGE = request.getParameter("PAGE") != null ? request
				.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request
				.getParameter("ITEM_COUNT") : "10";
		
		AdminExamVo.setPAGE(Integer.parseInt(PAGE));
		AdminExamVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		int pagelimit = AdminExamVo.getPAGE() * AdminExamVo.getITEM_COUNT();
		
		AdminExamVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		AdminExamVo.setOFFSET(pagelimit);
		
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
	
	@RequestMapping(value="/admin/exam/result/list.do" , method = RequestMethod.GET)
	public ModelAndView AdminExamResultGet(@ModelAttribute("AdminExamResultVo")AdminExamResultVo AdminExamResultVo , HttpServletRequest request , HttpServletResponse response) {
		
		System.out.println("PAGE : " + AdminExamResultVo.getPAGE());
		System.out.println("ITEM_COUNT : " + AdminExamResultVo.getITEM_COUNT());
		
		String PAGE = request.getParameter("PAGE") != null ? request
				.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request
				.getParameter("ITEM_COUNT") : "10";
		
		AdminExamResultVo.setPAGE(Integer.parseInt(PAGE));
		AdminExamResultVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		int pagelimit = AdminExamResultVo.getPAGE() * AdminExamResultVo.getITEM_COUNT();
		
		AdminExamResultVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		AdminExamResultVo.setOFFSET(pagelimit);
		
		ModelMap model = new ModelMap();
		
		model = adminExamService.getAllResultList(AdminExamResultVo);
		
		model.put("before", model);
		
		return new ModelAndView("admin/submission/list" , "model" , model);
		
	}
	
	/*
	 * 2024 신규 수정 페이지
	 * */
	
	@RequestMapping(value="/admin/exam/test/insert.do" , method = RequestMethod.GET)
	public String AdminExamInsertGet2(HttpServletRequest request , HttpServletResponse response) {
		
		return "/admin/exam/test";
		
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
        String[] headers = {"문항 순서", "문항 제목", "문항 타입", "선택지 갯수", "선택지 리스트"};
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
            row.createCell(4).setCellValue(String.valueOf(question.getOrDefault("Choices", "")));
            
            
            // 바디 스타일 적용
            for(int i = 0; i < headers.length; i++) {
                row.getCell(i).setCellStyle(bodyStyle);
            }
            
        }

        
        // 열 너비 자동 조정
        for (int i = 0; i < headers.length; i++) {
            sheet.autoSizeColumn(i);
        }
        
        // 두 번째 시트 생성
        Sheet sheet2 = workbook.createSheet("응답자");
        
        // 헤더 생성
        String[] headers2 = {"호", "응답자 아이디", "응답자 성명", "응답 결과"};
        Row headerRow2 = sheet2.createRow(0);
        for (int i = 0; i < headers2.length; i++) {
            Cell cell = headerRow2.createCell(i);
            cell.setCellValue(headers2[i]);
            cell.setCellStyle(headerStyle);
        }
        
        int rowNum = 1;
        for (HashMap<String, Object> respondent : respondents) {
            Row row = sheet2.createRow(rowNum++);
            
            // "호"는 순번
            row.createCell(0).setCellValue(rowNum - 1);
            
            // "응답자 아이디"
            row.createCell(1).setCellValue(String.valueOf(respondent.getOrDefault("member_id", "")));
            
            // "응답자 성명"
            row.createCell(2).setCellValue(String.valueOf(respondent.getOrDefault("name", "")));
            
            // "응답 결과"
            row.createCell(3).setCellValue(String.valueOf(respondent.getOrDefault("select_list", "")));
            
            // 셀 스타일 적용이 필요한 경우 여기에 코드 추가
            // 예: bodyStyle.setAlignment(HorizontalAlignment.CENTER);
        }

        // 열 너비 자동 조정
        for (int i = 0; i < headers.length; i++) {
            sheet2.autoSizeColumn(i);
        }

        // 문항별 선택지 카운트와 답변형 응답 저장 구조 초기화
        Map<Integer, Map<String, Integer>> questionChoiceCounts = new HashMap<>();
        Map<Integer, List<String>> questionTextResponses = new HashMap<>();
        
        // 세 번째 시트 생성
        Sheet statsSheet = workbook.createSheet("통계");

        // 헤더 행의 셀 제목
        String[] columnTitles = {"문항 ID", "문항 제목", "선택지/응답", "카운트/내용"};
        for (int i = 0; i < columnTitles.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(columnTitles[i]);
            cell.setCellStyle(headerStyle);
        }

        for (HashMap<String, Object> respondent : respondents) {
            String selectList = (String) respondent.get("select_list");
            List<String> responses = parseSelectList(selectList);

            for (int i = 0; i < responses.size(); i++) {
                int questionId = i + 1; // 문항 ID 가정
                List<String> parsedResponses = parseSelectList(responses.get(i));

                for (String response1 : parsedResponses) {
                    if (response1.matches("\\[.*\\]")) { // 체크박스 처리
                        response1 = response1.substring(1, response1.length() - 1); // 대괄호 제거
                        for (String subResponse : response1.split(",")) {
                            Map<String, Integer> counts = questionChoiceCounts.getOrDefault(questionId, new HashMap<String, Integer>());
                            counts.put(subResponse, counts.getOrDefault(subResponse, 0) + 1);
                            questionChoiceCounts.put(questionId, counts);
                        }
                    } else if (!response1.matches("응답.*")) { // 라디오 처리
                        Map<String, Integer> counts = questionChoiceCounts.getOrDefault(questionId, new HashMap<String, Integer>());
                        counts.put(response1, counts.getOrDefault(response1, 0) + 1);
                        questionChoiceCounts.put(questionId, counts);
                    } else { // 답변형 처리
                    	questionTextResponses.putIfAbsent(questionId, new ArrayList<String>()); // 수정된 부분
                    	questionTextResponses.get(questionId).add(response1);
                    }
                }
            }
        }

        // 문항별 데이터 기록
        int rowNum1 = 1; // 헤더 다음 행부터 시작

        // 문항 ID 및 제목을 매핑할 맵 생성 (문항 리스트를 기반으로)
        Map<Integer, String> questionIdToTitle = new HashMap<>();
        for (HashMap<String, Object> question : questionList) {
            Integer questionId = Integer.parseInt(String.valueOf(question.getOrDefault("idx", 0)));
            String questionTitle = String.valueOf(question.getOrDefault("name", ""));
            questionIdToTitle.put(questionId, questionTitle);
        }

        // 선택지별 카운트 데이터 기록
        for (Map.Entry<Integer, Map<String, Integer>> entry : questionChoiceCounts.entrySet()) {
            Integer questionId = entry.getKey();
            String questionTitle = questionIdToTitle.getOrDefault(questionId, "");
            Map<String, Integer> choices = entry.getValue();

            for (Map.Entry<String, Integer> choiceEntry : choices.entrySet()) {
                Row row = statsSheet.createRow(rowNum1++);
                row.createCell(0).setCellValue(questionId.doubleValue()); // 셀에 숫자형으로 기록
                row.createCell(1).setCellValue(questionTitle);
                row.createCell(2).setCellValue(choiceEntry.getKey()); // 선택지
                row.createCell(3).setCellValue(choiceEntry.getValue().doubleValue()); // 카운트 (숫자형으로 기록)
            }
        }

        // 답변형 응답 데이터 기록
        for (Map.Entry<Integer, List<String>> entry : questionTextResponses.entrySet()) {
            Integer questionId = entry.getKey();
            String questionTitle = questionIdToTitle.getOrDefault(questionId, "");
            List<String> responses = entry.getValue();

            for (String response1 : responses) {
                Row row = statsSheet.createRow(rowNum1++);
                row.createCell(0).setCellValue(questionId.doubleValue()); // 셀에 숫자형으로 기록
                row.createCell(1).setCellValue(questionTitle);
                row.createCell(2).setCellValue("답변형 응답");
                row.createCell(3).setCellValue(response1);
            }
        }

        // 열 너비 자동 조정
        for (int i = 0; i < columnTitles.length; i++) {
            statsSheet.autoSizeColumn(i);
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
            String tempFileName = "exam.xls";
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
