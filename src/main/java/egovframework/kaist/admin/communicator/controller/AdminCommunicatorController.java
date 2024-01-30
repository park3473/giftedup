package egovframework.kaist.admin.communicator.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.kaist.admin.communicator.model.AdminCommunicatorVo;
import egovframework.kaist.admin.communicator.service.AdminCommunicatorService;

@Controller
public class AdminCommunicatorController {

	@Autowired
	AdminCommunicatorService adminCommunicatorService;
	
	
	@RequestMapping(value="/admin/program/communicator/list.do" , method = RequestMethod.GET)
	public ModelAndView AdminCommAllList(@ModelAttribute("AdminCommunicatorVo")AdminCommunicatorVo AdminCommunicatorVo , HttpServletRequest request , HttpServletResponse response) {
		
		String PAGE = request.getParameter("PAGE") != null ? request
				.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request
				.getParameter("ITEM_COUNT") : "10";
		
		if(PAGE == null)
		{
			PAGE ="0";
		}
		if(ITEM_COUNT == null)
		{
			ITEM_COUNT = "10";
		}
		AdminCommunicatorVo.setPAGE(Integer.parseInt(PAGE));
		AdminCommunicatorVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		int pagelimit = AdminCommunicatorVo.getPAGE() * AdminCommunicatorVo.getITEM_COUNT();
		
		AdminCommunicatorVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		AdminCommunicatorVo.setOFFSET(pagelimit);
		
		ModelMap model = new ModelMap();
		
		model = adminCommunicatorService.getCommAllList(AdminCommunicatorVo);
		
		model.put("SEARCH_TYPE", AdminCommunicatorVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", AdminCommunicatorVo.getSEARCH_TEXT());
		model.put("beforeDomain", AdminCommunicatorVo);
		
		return new ModelAndView("admin/communicator/list","model",model); 
	}
	
	@RequestMapping(value="/admin/program/communicator/update.do" , method = RequestMethod.GET)
	public ModelAndView AdminCommUpdate(@ModelAttribute("AdminCommunicatorVo")AdminCommunicatorVo AdminCommunicatorVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = adminCommunicatorService.getCommView(AdminCommunicatorVo);
		
		return new ModelAndView("/admin/communicator/update","model",model);
	}
	
	
	@RequestMapping(value="/admin/program/communicator/AllExcel.do" , method = RequestMethod.GET)
	public void AdminCommAllExcel(@ModelAttribute("AdminCommunicatorVo") AdminCommunicatorVo AdminCommunicatorVo , HttpServletRequest reqeust , HttpServletResponse response ) throws IOException {
		
		System.out.println("???---");
		
		ModelMap map = new ModelMap();
	
		
		map = adminCommunicatorService.getCommExcelAllList(AdminCommunicatorVo);
		
		List<HashMap> CommList = (List<HashMap>) map.get("CommList");
		
		Workbook wb = new HSSFWorkbook();
		
		Sheet sheet = wb.createSheet("커뮤니케이터");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;
		
		int WidthCnt = 0;
		
		sheet.setColumnWidth(0, 17848);
		sheet.setColumnWidth(1, 5475);
		sheet.setColumnWidth(2, 4964);
		sheet.setColumnWidth(3, 4234);
		sheet.setColumnWidth(4, 2482);
		sheet.setColumnWidth(5, 7628);
		sheet.setColumnWidth(6, 3832);
		
		
		
		
		CellStyle headStyle = wb.createCellStyle();
		
		headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);
	    
	    headStyle.setFillForegroundColor(HSSFColorPredefined.LIGHT_YELLOW.getIndex());
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
	    cell.setCellValue("강의명");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("강의 개설 날짜");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("강의 참여 가능 인원");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("강의 준비물 여부");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("강사 이름");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("강사 학교명");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("강사 연락처");
	    
	    for(int i = 0; i < CommList.size(); i++) {
	    	System.out.println("---excel---"+i+"/"+CommList.size());
	    	
	    	HashMap tempMap = CommList.get(i);
	    	columnCnt = 0;
	    	
	    	row = sheet.createRow(rowNo++);
	    	
	    	cell = row.createCell(columnCnt);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(tempMap.get("COMM_NAME")+"");
	    	
	    	cell = row.createCell(++columnCnt);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(tempMap.get("COMM_CREATE_TM")+"");

	    	cell = row.createCell(++columnCnt);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(tempMap.get("COMM_PERSONNEL")+"");
	    	
	    	cell = row.createCell(++columnCnt);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(tempMap.get("COMM_SUPPLIES")+"");
	    	
	    	cell = row.createCell(++columnCnt);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(tempMap.get("COMM_MENTO_NAME")+"");
	    	
	    	cell = row.createCell(++columnCnt);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(tempMap.get("COMM_SCHOOL_NAME")+"");
	    	
	    	cell = row.createCell(++columnCnt);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(tempMap.get("PHONE")+"");
	    	
	    	
	    	
	    }
	    
	    
	    response.setContentType("ms-vnd/excel");
	    String excel_name_is = "커뮤니케이터(전체)";
	    excel_name_is = URLEncoder.encode(excel_name_is,"UTF-8");
	    response.setHeader("Content-Disposition", "attachment;filename="+excel_name_is+".xls");
	    
	    
	    wb.write(response.getOutputStream());
	    
	    wb.close();
		
		
		
	}
	
	
	@RequestMapping(value="/admin/program/communicator/SelectExcel.do" , method = RequestMethod.GET)
	public void AdminCommSelectExcel(@ModelAttribute("AdminCommunicatorVo") AdminCommunicatorVo AdminCommunicatorVo , HttpServletRequest reqeust , HttpServletResponse response ) throws IOException {
		
		System.out.println("???---"+AdminCommunicatorVo.getCOMM_IDX());
		
		ModelMap map = new ModelMap();
	
		
		map = adminCommunicatorService.getCommExcelSelectList(AdminCommunicatorVo);
		
		List<HashMap> CommList = (List<HashMap>) map.get("CommList");
		
		List<HashMap> StudentList = (List<HashMap>) map.get("StudentList");
		
		Workbook wb = new HSSFWorkbook();
		
		Sheet sheet = wb.createSheet("커뮤니케이터");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;
		
		int WidthCnt = 0;
		
		sheet.setColumnWidth(0, 17848);
		sheet.setColumnWidth(1, 5475);
		sheet.setColumnWidth(2, 4964);
		sheet.setColumnWidth(3, 4234);
		sheet.setColumnWidth(4, 2482);
		sheet.setColumnWidth(5, 7628);
		sheet.setColumnWidth(6, 3832);
		
		CellStyle headStyle = wb.createCellStyle();
		
		headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);
	    
	    headStyle.setFillForegroundColor(HSSFColorPredefined.LIGHT_YELLOW.getIndex());
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
	    cell.setCellValue("강의명");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("강의 개설 날짜");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("강의 참여 가능 인원");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("강의 준비물 여부");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("강사 이름");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("강사 학교명");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("강사 연락처");
	    
	    for(int i = 0; i < CommList.size(); i++) {
	    	System.out.println("---excel---"+i+"/"+CommList.size());
	    	
	    	HashMap tempMap = CommList.get(i);
	    	columnCnt = 0;
	    	
	    	row = sheet.createRow(rowNo++);
	    	
	    	cell = row.createCell(columnCnt);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(tempMap.get("COMM_NAME")+"");
	    	
	    	cell = row.createCell(++columnCnt);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(tempMap.get("COMM_CREATE_TM")+"");

	    	cell = row.createCell(++columnCnt);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(tempMap.get("COMM_PERSONNEL")+"");
	    	
	    	cell = row.createCell(++columnCnt);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(tempMap.get("COMM_SUPPLIES")+"");
	    	
	    	cell = row.createCell(++columnCnt);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(tempMap.get("COMM_MENTO_NAME")+"");
	    	
	    	cell = row.createCell(++columnCnt);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(tempMap.get("COMM_SCHOOL_NAME")+"");
	    	
	    	cell = row.createCell(++columnCnt);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(tempMap.get("PHONE")+"");
	    	
	    	
	    	
	    }
	    
	    
	    columnCnt = 0;
	    
	    row = sheet.createRow(rowNo++);
	    
	    cell = row.createCell(columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("참여 학교명");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("참여 학생 학년");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("참여 학생 이름");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("참여 학생 연락처");
	    
	    
	    for(int i = 0; i < StudentList.size(); i++) {
	    	System.out.println("---excel---"+i+"/"+StudentList.size());
	    	
	    	HashMap tempMap = StudentList.get(i);
	    	columnCnt = 0;
	    	
	    	row = sheet.createRow(rowNo++);
	    	
	    	cell = row.createCell(columnCnt);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(tempMap.get("STU_SCHOOL_NAME")+"");
	    	
	    	cell = row.createCell(++columnCnt);
	    	cell.setCellStyle(bodyStyle);
	    	
	    	int school_year = (int) tempMap.get("STU_SCHOOL_YEAR");
	    	
	    	System.out.println(school_year);
	    	
	    	if(school_year > 9) {
	    		school_year -= 9;
	    		cell.setCellValue("고등학교"+school_year+"학년");
	    	}else if(school_year > 6) {
	    		school_year -= 6;
	    		cell.setCellValue("중학교"+school_year+"학년");
	    	}else{
	    		cell.setCellValue("초등학교"+school_year+"학년");
	    	}

	    	cell = row.createCell(++columnCnt);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(tempMap.get("STU_NAME")+"");
	    	
	    	cell = row.createCell(++columnCnt);
	    	cell.setCellStyle(bodyStyle);
	    	cell.setCellValue(tempMap.get("STU_PHONE")+"");
	    }
	    
	    
	    response.setContentType("ms-vnd/excel");
	    String excel_name_is = "커뮤니케이터(상세)_"+AdminCommunicatorVo.getCOMM_NAME()+"";
	    excel_name_is = URLEncoder.encode(excel_name_is,"UTF-8");
	    response.setHeader("Content-Disposition", "attachment;filename="+excel_name_is+".xls");
	    
	    
	    wb.write(response.getOutputStream());
	    
	    wb.close();
		
		
		
	}
	
}
