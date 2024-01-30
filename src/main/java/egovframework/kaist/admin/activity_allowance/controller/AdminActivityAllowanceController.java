package egovframework.kaist.admin.activity_allowance.controller;

import java.io.IOException;
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

import egovframework.kaist.admin.activity_allowance.model.AdminActivityAllowanceVo;
import egovframework.kaist.admin.activity_allowance.service.AdminActivityAllowanceService;
import egovframework.kaist.admin.buseo.service.AdminBuseoService;

@Controller
public class AdminActivityAllowanceController {

	@Autowired
	AdminActivityAllowanceService adminActivityAllowanceService;

	@Autowired
	AdminBuseoService adminBuseoService;

	private static final Logger Logger = LoggerFactory.getLogger(AdminActivityAllowanceController.class);

	@RequestMapping(value = "/admin/activity_allowance/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("AdminActivityAllowanceVo") AdminActivityAllowanceVo adminActivityAllowanceVo,
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
		

		adminActivityAllowanceVo.setPAGE(Integer.parseInt(PAGE));
		adminActivityAllowanceVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = adminActivityAllowanceVo.getPAGE() * adminActivityAllowanceVo.getITEM_COUNT();
		
		adminActivityAllowanceVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		adminActivityAllowanceVo.setOFFSET(pagelimit);
		
	
    			
		
		model = adminActivityAllowanceService.getList(adminActivityAllowanceVo);
		
		model.put("SEARCH_TYPE", adminActivityAllowanceVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", adminActivityAllowanceVo.getSEARCH_TEXT());
		
		if(adminActivityAllowanceVo.getSTART_TM().equals(""))
		{
			adminActivityAllowanceVo.setSTART_TM(SUtil.getNowDate());	
		}
		if(adminActivityAllowanceVo.getEND_TM().equals(""))
		{
			adminActivityAllowanceVo.setEND_TM(SUtil.getNowDate());	
		}
		
		model.put("beforeDomain", adminActivityAllowanceVo);

		

		return new ModelAndView("admin/activity_allowance/list", "model", model);
	}

	@RequestMapping(value = "/admin/activity_allowance/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(HttpServletRequest request, HttpServletResponse response) 
	
	
	{

		ModelMap model = new ModelMap();
		
		String TYPE = (String) (request.getParameter("TYPE") != null ? request.getParameter("TYPE") : "1");
		
		if(TYPE == null || TYPE.equals(""))
		{
			TYPE = "1";
		}
		
		model.put("buseo", adminBuseoService.getListAll());
		model.put("TYPE", TYPE);
		
		return new ModelAndView("admin/activity_allowance/insert", "model", model);
	}

	@RequestMapping(value = "/admin/activity_allowance/insert.do", method = RequestMethod.POST)
	public void insertPost(@ModelAttribute("AdminActivityAllowanceVo") AdminActivityAllowanceVo adminActivityAllowanceVo, HttpServletRequest  request,  HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		adminActivityAllowanceService.setInsert(adminActivityAllowanceVo);		
		
		try {
			response.getWriter().print("true");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/admin/activity_allowance/{activity_allowanceid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("activity_allowanceid") String activity_allowanceid, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		model = adminActivityAllowanceService.getView(activity_allowanceid);

		model.put("buseo", adminBuseoService.getListAll());
		return new ModelAndView("admin/activity_allowance/update", "model", model);
	}
	
	@RequestMapping(value = "/admin/activity_allowance/update.do", method = RequestMethod.POST)
	public void updatePost(@ModelAttribute("AdminActivityAllowanceVo") AdminActivityAllowanceVo adminActivityAllowanceVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		boolean rtn = adminActivityAllowanceService.setUpdate(adminActivityAllowanceVo);

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

	@RequestMapping(value = "/admin/activity_allowance/delete.do", method = RequestMethod.POST)
	public void deletePost(@ModelAttribute("AdminActivityAllowanceVo") AdminActivityAllowanceVo adminActivityAllowanceVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String year = request.getParameter("year") != null ? request.getParameter("year") : "";
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		boolean rtn = adminActivityAllowanceService.setDelete(adminActivityAllowanceVo);
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


	@RequestMapping(value = "/admin/activity_allowance/deleteArr.do", method = RequestMethod.POST)
	public void deleteArrPost(@ModelAttribute("AdminMemberVo") AdminActivityAllowanceVo adminActivityAllowanceVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		String idx = adminActivityAllowanceVo.getIDX();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				AdminActivityAllowanceVo userMemberDomain = new AdminActivityAllowanceVo();
				userMemberDomain.setIDX(arrIdx[i]);
				adminActivityAllowanceService.setDelete(userMemberDomain);		
			}
		}
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	
	@RequestMapping(value = "/admin/activity_allowance/TypeToTextUpdateArr.do", method = RequestMethod.POST)
	public void statusUpdateArr(@ModelAttribute("AdminActivityAllowanceVo") AdminActivityAllowanceVo adminActivityAllowanceVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		String idx = adminActivityAllowanceVo.getIDX();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				AdminActivityAllowanceVo vo = new AdminActivityAllowanceVo();
				vo.setIDX(arrIdx[i]);
				vo.setSEARCH_TYPE(adminActivityAllowanceVo.getSEARCH_TYPE());
				vo.setSEARCH_TEXT(adminActivityAllowanceVo.getSEARCH_TEXT());
				adminActivityAllowanceService.setUpdateTypeToText(vo);		
			}
		}
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	@RequestMapping(value = "/admin/activity_allowance/excelDown.do", method = RequestMethod.GET)
	public void excelDown(@ModelAttribute("AdminActivityAllowanceVo") AdminActivityAllowanceVo adminActivityAllowanceVo, HttpServletRequest request, HttpServletResponse response) throws IOException 
	{

		
		String MEMBER_ID = request.getParameter("MEMBER_ID") != null ? request
				.getParameter("MEMBER_ID") : "";
				
				
		  // 게시판 목록조회
		adminActivityAllowanceVo.setLIMIT(99999999);
		adminActivityAllowanceVo.setPAGE(0);
		
		ModelMap map = null;
		
		if(MEMBER_ID.equals(""))
		{
			map = adminActivityAllowanceService.getList(adminActivityAllowanceVo);
			
		}else
		{
			MEMBER_ID = MEMBER_ID.substring(0, MEMBER_ID.length()-1);
			map = adminActivityAllowanceService.getListMemberIdIn(MEMBER_ID);
		}
		
		

		List<HashMap> list = (List<HashMap>) map.get("list");

	    // 워크북 생성

	    Workbook wb = new HSSFWorkbook();

	    Sheet sheet = wb.createSheet("활동수당 신청 관리");

	    Row row = null;
	    Cell cell = null;
	    int rowNo = 0;

	    // 테이블 헤더용 스타일
	    CellStyle headStyle = wb.createCellStyle();

	    // 가는 경계선을 가집니다.
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);

	    // 배경색은 노란색입니다.
	    headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

	    // 데이터는 가운데 정렬합니다.
	    headStyle.setAlignment(HorizontalAlignment.CENTER);

	    // 데이터용 경계 스타일 테두리만 지정

	    CellStyle bodyStyle = wb.createCellStyle();
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);

	    // 헤더 생성
	    int columnCnt = 0;
	    row = sheet.createRow(rowNo++);

	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("신청자 아이디");

	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("신청자 성명");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("신청자 주민등록번호");

	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("은행이름");

	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("계좌번호");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("예금주");
	    
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("상태");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("생성일");
	    
	  

	    for(int i = 0; i < list.size(); i++ )
	    {
	    	HashMap tempMap = list.get(i);
	    	columnCnt = 0;
    	    row = sheet.createRow(rowNo++);

    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("MEMBER_ID")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("MEMBER_NAME")+"");
    	    

    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("MEMBER_NUMBER")+"");

    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("BANK_NAME")+"");

    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("BANK_NUMBER")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("BANK_ACCOUNT")+"");
    	    
    	    
    	    
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    
    	    String status = tempMap.get("STATUS")+"";
    	    if(status.equals("0"))
    	    {
    	    	status = "신청";
    	    }else if(status.equals("1"))
    	    {
    	    	status = "지급";
    	    }else if(status.equals("-1"))
    	    {
    	    	status = "미지급";
    	    }else
    	    {
    	    	status = "";
    	    }
    	    cell.setCellValue(status);
    	    
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("CREATE_TM")+"");
    	    
	    }
	    	

	    // 컨텐츠 타입과 파일명 지정

	    response.setContentType("ms-vnd/excel");

	    response.setHeader("Content-Disposition", "attachment;filename=ACTIVITY.xls");



	    // 엑셀 출력

	    wb.write(response.getOutputStream());

	    wb.close();


	}

}
