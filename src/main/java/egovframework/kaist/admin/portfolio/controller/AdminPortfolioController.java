package egovframework.kaist.admin.portfolio.controller;

import java.io.FileInputStream;
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

import egovframework.kaist.admin.member.model.AdminMemberVo;
import egovframework.kaist.admin.member.service.AdminMemberService;
import egovframework.kaist.admin.portfolio.model.AdminPortfolioVo;
import egovframework.kaist.admin.portfolio.service.AdminPortfolioService;

@Controller
public class AdminPortfolioController {

	@Autowired
	AdminPortfolioService adminPortfolioService;

	@Autowired
	AdminMemberService adminMemberService;

	private static final Logger Logger = LoggerFactory.getLogger(AdminPortfolioController.class);

	@RequestMapping(value = "/admin/portfolio/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("AdminMemberVo") AdminMemberVo adminMemberVo,
			HttpServletRequest request, HttpServletResponse response) {

		String PAGE = request.getParameter("PAGE") != null ? request
				.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request
				.getParameter("ITEM_COUNT") : "10";
			
		String searchText = adminMemberVo.getSEARCH_TEXT();
		if(PAGE == null)
		{
			PAGE = "0";
		}
		if(ITEM_COUNT == null)
		{
			ITEM_COUNT = "10";
		}
		
		if(adminMemberVo.getSEARCH_TYPE().equals("SCHOOL_YEAR"))
		{
			String text = adminMemberVo.getSEARCH_TYPE() + "";
			String type = "4";
			if(text.equals("null"))
			{
				type = "";
			}else if(text.equals("초등학교4학년"))
			{
				type = "4";
			}else if(text.equals("초등학교5학년"))
			{
				type = "5";
			}else if(text.equals("초등학교6학년"))
			{
				type = "6";
			}else if(text.equals("중학교1학년"))
			{
				type = "7";
			}else if(text.equals("중학교2학년"))
			{
				type = "8";
			}else if(text.equals("중학교3학년"))
			{
				type = "9";
			}else if(text.equals("고등학교1학년"))
			{
				type = "10";
			}else if(text.equals("고등학교2학년"))
			{
				type = "11";
			}else if(text.equals("고등학교3학년"))
			{
				type = "12";
			}
			adminMemberVo.setSEARCH_TEXT(type);
		}
	
		

		adminMemberVo.setPAGE(Integer.parseInt(PAGE));
		adminMemberVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = adminMemberVo.getPAGE() * adminMemberVo.getITEM_COUNT();
		
		adminMemberVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		adminMemberVo.setOFFSET(pagelimit);
		
		//학생 전체를 가져온다
		adminMemberVo.setTYPE("1");
		
		if(!adminMemberVo.getYEAR().equals("")) {
			System.out.println(adminMemberVo.getYEAR());
			adminMemberVo.setEXP_DATA(adminMemberVo.getYEAR().substring(adminMemberVo.getYEAR().length()-2,adminMemberVo.getYEAR().length()));
		}
		
		model = adminMemberService.getListPortfolio(adminMemberVo);
		
		adminMemberVo.setSEARCH_TEXT(searchText);
		model.put("SEARCH_TYPE", adminMemberVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", adminMemberVo.getSEARCH_TEXT());
		

		
		model.put("beforeDomain", adminMemberVo);

		
		return new ModelAndView("admin/portfolio/list", "model", model);
	}

	@RequestMapping(value = "/admin/portfolio/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(HttpServletRequest request, HttpServletResponse response) 
	
	
	{

		ModelMap model = new ModelMap();
		
		String TYPE = (String) (request.getParameter("TYPE") != null ? request.getParameter("TYPE") : "1");
		
		if(TYPE == null || TYPE.equals(""))
		{
			TYPE = "1";
		}
		
		
		model.put("TYPE", TYPE);
		
		return new ModelAndView("admin/portfolio/insert", "model", model);
	}

	@RequestMapping(value = "/admin/portfolio/insert.do", method = RequestMethod.POST)
	public void insertPost(@ModelAttribute("AdminPortfolioVo") AdminPortfolioVo adminPortfolioVo, HttpServletRequest  request,  HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		adminPortfolioService.setInsert(adminPortfolioVo);		
		
		try {
			response.getWriter().print("true");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/admin/portfolio/{portfolioid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("portfolioid") String portfolioid, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		model = adminPortfolioService.getView(portfolioid);

		
		return new ModelAndView("admin/portfolio/update", "model", model);
	}
	
	@RequestMapping(value = "/admin/portfolio/update.do", method = RequestMethod.POST)
	public void updatePost(@ModelAttribute("AdminPortfolioVo") AdminPortfolioVo adminPortfolioVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		boolean rtn = adminPortfolioService.setUpdate(adminPortfolioVo);

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

	@RequestMapping(value = "/admin/portfolio/delete.do", method = RequestMethod.POST)
	public void deletePost(@ModelAttribute("AdminPortfolioVo") AdminPortfolioVo adminPortfolioVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String year = request.getParameter("year") != null ? request.getParameter("year") : "";
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		boolean rtn = adminPortfolioService.setDelete(adminPortfolioVo);
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
	@RequestMapping(value = "/admin/portfolio/deleteArr.do", method = RequestMethod.POST)
	public void deleteArrPost(@ModelAttribute("AdminPortfolioVo") AdminPortfolioVo adminPortfolioVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		String idx = adminPortfolioVo.getIDX();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				AdminPortfolioVo adminPortfolioVo2 = new AdminPortfolioVo();
				adminPortfolioVo2.setIDX(arrIdx[i]);
				adminPortfolioService.setDelete(adminPortfolioVo2);		
			}
		}
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	
	@RequestMapping(value = "/admin/portfolio/stat.do", method = RequestMethod.GET)
	public ModelAndView updateGet(
			HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		
		String YEAR = (String) (request.getParameter("YEAR") != null ? request.getParameter("YEAR") : "2020");
		
		model = adminPortfolioService.getListStat(YEAR);
		
		model.put("EVAL_OPEN_Y", adminPortfolioService.getEVAL_OPEN_Y_CNT());
		model.put("EVAL_OPEN_N", adminPortfolioService.getEVAL_OPEN_N_CNT());
		
		model.put("YEAR", YEAR);
		
		return new ModelAndView("admin/portfolio/stat", "model", model);
	}
	
	
	@RequestMapping(value = "/admin/portfolio/1/excelDown.do", method = RequestMethod.GET)
	public void excelDown(@ModelAttribute("AdminPortfolioVo") AdminPortfolioVo adminPortfolioVo, HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		
		String MEMBER_ID = request.getParameter("MEMBER_ID") != null ? request
				.getParameter("MEMBER_ID") : "";
		
		
		String YEAR = request.getParameter("YEAR") != null ? request
				.getParameter("YEAR") : "";

   	    // 게시판 목록조회
		ModelMap map = null;
		
		
		
		
		if(MEMBER_ID.equals(""))
		{
			AdminMemberVo adminMemberVo = new AdminMemberVo();
			adminMemberVo.setLIMIT(99999999);
			adminMemberVo.setOFFSET(0);
			adminMemberVo.setTYPE("1");
			
			adminMemberVo.setYEAR(YEAR);
			
			if(!adminMemberVo.getYEAR().equals("")) {
				System.out.println(adminMemberVo.getYEAR());
				adminMemberVo.setEXP_DATA(adminMemberVo.getYEAR().substring(adminMemberVo.getYEAR().length()-2,adminMemberVo.getYEAR().length()));
			}
			
			map = adminMemberService.getListPortfolio(adminMemberVo);

		}else
		{
			
			MEMBER_ID = MEMBER_ID.substring(0, MEMBER_ID.length()-1);
			map = adminMemberService.getListPortfolioMemberIdIn(MEMBER_ID);
		}

				
		List<HashMap> list = (List<HashMap>) map.get("list");

	    // 워크북 생성
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources/files/portfolio.xls";
		
	    FileInputStream fis = new FileInputStream(drv);
        HSSFWorkbook workbook = new HSSFWorkbook(fis);

	    Sheet sheet = workbook.getSheetAt(0);

	    Row row = null;
	    
	    Cell cell = null;

	    int rowNo = 0;

	    
	    // 헤더 생성
	    int columnCnt = 0;
	    rowNo++;
	    rowNo++;
	    for(int i = 0; i < list.size(); i++ )
	    {
	    	System.out.println("----excel --- + " + i + " / " + list.size());

	    	HashMap tempMap = list.get(i);
	    	
    		columnCnt = 0;
    	    row = sheet.createRow(rowNo++);
    	    
    	    cell = row.createCell(columnCnt);
    	    cell.setCellValue(tempMap.get("MEMBER_ID")+"");
    	    
    	    cell = row.createCell(++columnCnt);

    	    cell.setCellValue(tempMap.get("NAME")+"");

    	    cell = row.createCell(++columnCnt);
    	    cell.setCellValue(tempMap.get("SCHOOL_NAME")+"");
    	    
    	    
    	    cell = row.createCell(++columnCnt);
    	    String year = tempMap.get("SCHOOL_YEAR")+""; 
    	    if(year.equals("1"))
    	    {
    	    	year = "초등학교1학년";
    	    }else if(year.equals("2"))
    	    {
    	    	year = "초등학교2학년";
    	    }else if(year.equals("3"))
    	    {
    	    	year = "초등학교3학년";
    	    }else if(year.equals("4"))
    	    {
    	    	year = "초등학교4학년";
    	    }else if(year.equals("5"))
    	    {
    	    	year = "초등학교5학년";
    	    }else if(year.equals("6"))
    	    {
    	    	year = "초등학교6학년";
    	    }else if(year.equals("7"))
    	    {
    	    	year = "중학교1학년";
    	    }else if(year.equals("8"))
    	    {
    	    	year = "중학교2학년";
    	    }else if(year.equals("9"))
    	    {
    	    	year = "중학교3학년";
    	    }else if(year.equals("10"))
    	    {
    	    	year = "고등학교1학년";
    	    }else if(year.equals("11"))
    	    {
    	    	year = "고등학교2학년";
    	    }else if(year.equals("12"))
    	    {
    	    	year = "고등학교3학년";
    	    }
    	    	
    	    cell.setCellValue(year);
    	    
  cell.setCellValue(year);
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellValue(tempMap.get("ADDRESS_LOCAL")+"");


	    	//지원영역
	    	//지원자격
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellValue(tempMap.get("SEX")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellValue(tempMap.get("SUPPORT_AREA")+"");
    	    
    	    
    	    
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellValue(tempMap.get("ELIGIBILITY")+"");
    	    
    	    
    	    
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellValue(tempMap.get("AVG_STFT")+"");
    	    
    	    
    	    
    	    
    	   
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellValue(tempMap.get("COURSE_CNT_1")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellValue(tempMap.get("COURSE_1")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellValue(tempMap.get("COURSE_CNT_2")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellValue(tempMap.get("COURSE_2")+"");
    	    
    	 
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellValue(tempMap.get("COURSE_CNT_3")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellValue(tempMap.get("COURSE_3")+"");
    	    
    	 
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellValue(tempMap.get("COURSE_CNT_4")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellValue(tempMap.get("COURSE_4")+"");
    	    
    	 
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellValue(tempMap.get("COURSE_CNT_5")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellValue(tempMap.get("COURSE_5")+"");
    	    
    	    String ss = tempMap.get("COURSE_5")+"";
    	    int sss = Integer.parseInt(ss);
    	    if(sss >= 40)
    	    {
    	    	cell = row.createCell(++columnCnt);
        	    cell.setCellValue("수료");
    	    }else
    	    {
    	    	cell = row.createCell(++columnCnt);
        	    cell.setCellValue("미수료");    	    	
    	    }

	    	System.out.println("----excel --- + " + i);
	    }

	    // 컨텐츠 타입과 파일명 지정
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename=portfolio.xls");

	    // 엑셀 출력
	    try {
	    	workbook.write(response.getOutputStream());
	    	workbook.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}						  
	@RequestMapping(value = "/admin/portfolio/2/excelDown.do", method = RequestMethod.GET)
	public void excelDown2(@ModelAttribute("AdminPortfolioVo") AdminPortfolioVo adminPortfolioVo, HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		
		String MEMBER_ID = request.getParameter("MEMBER_ID") != null ? request
				.getParameter("MEMBER_ID") : "";

   	    // 게시판 목록조회
		ModelMap map = null;
		
		if(MEMBER_ID.equals(""))
		{
			AdminMemberVo adminMemberVo = new AdminMemberVo();
			adminMemberVo.setLIMIT(99999999);
			adminMemberVo.setOFFSET(0);
			map = adminPortfolioService.getListExcelAll(adminPortfolioVo);

		}else
		{
			MEMBER_ID = MEMBER_ID.substring(0, MEMBER_ID.length()-1);
			map = adminPortfolioService.getListAllMemberIdIn(MEMBER_ID);
		}

				
		List<HashMap> list = (List<HashMap>) map.get("list");

	    // 워크북 생성
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources/files/portfolio_detail.xls";
		
	    FileInputStream fis = new FileInputStream(drv);
        HSSFWorkbook workbook = new HSSFWorkbook(fis);

	    Sheet sheet = workbook.getSheetAt(0);

	    Row row = null;
	    
	    Cell cell = null;

	    int rowNo = 0;

	    
	    // 헤더 생성
	    int columnCnt = 0;
	    rowNo++;
	    rowNo++;
	    for(int i = 0; i < list.size(); i++ )
	    {
	    	System.out.println("----excel --- + " + i + " / " + list.size());

	    	HashMap tempMap = list.get(i);
	    	
    		columnCnt = 0;
    	    row = sheet.createRow(rowNo++);
    	    
    	    cell = row.createCell(columnCnt);
    	    cell.setCellValue(tempMap.get("MEMBER_ID")+"");
    	    
    	    cell = row.createCell(++columnCnt);

    	    cell.setCellValue(tempMap.get("NAME")+"");

    	    cell = row.createCell(++columnCnt);
    	    cell.setCellValue(tempMap.get("SCHOOL_NAME")+"");
    	    
    	    
    	    cell = row.createCell(++columnCnt);
    	    String year = tempMap.get("SCHOOL_YEAR")+""; 
    	    if(year.equals("1"))
    	    {
    	    	year = "초등학교1학년";
    	    }else if(year.equals("2"))
    	    {
    	    	year = "초등학교2학년";
    	    }else if(year.equals("3"))
    	    {
    	    	year = "초등학교3학년";
    	    }else if(year.equals("4"))
    	    {
    	    	year = "초등학교4학년";
    	    }else if(year.equals("5"))
    	    {
    	    	year = "초등학교5학년";
    	    }else if(year.equals("6"))
    	    {
    	    	year = "초등학교6학년";
    	    }else if(year.equals("7"))
    	    {
    	    	year = "중학교1학년";
    	    }else if(year.equals("8"))
    	    {
    	    	year = "중학교2학년";
    	    }else if(year.equals("9"))
    	    {
    	    	year = "중학교3학년";
    	    }else if(year.equals("10"))
    	    {
    	    	year = "고등학교1학년";
    	    }else if(year.equals("11"))
    	    {
    	    	year = "고등학교2학년";
    	    }else if(year.equals("12"))
    	    {
    	    	year = "고등학교3학년";
    	    }
    	    cell.setCellValue(year);    	    	

    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellValue(tempMap.get("ADDRESS_LOCAL")+"");

    	    cell = row.createCell(++columnCnt);
    	    cell.setCellValue(tempMap.get("SEX")+"");
    	  
  //	      `` varchar(2) DEFAULT NULL COMMENT '교육과정(1:찾아가는 영재교육 프로그램,2:체험진로탐색 프로그램,3:창의융합캠프,4:기타)',
  	//      
    	    String course = tempMap.get("COURSE")+"";
    	    if(course.equals("1"))
    	    {
    	    	cell = row.createCell(++columnCnt);
        	    cell.setCellValue("찾아가는 영재교육 프로그램");
    	    }else if(course.equals("2"))
    	    {
    	    	cell = row.createCell(++columnCnt);
        	    cell.setCellValue("체험진로탐색 프로그램");
    	    }else if(course.equals("3"))
    	    {
    	    	cell = row.createCell(++columnCnt);
        	    cell.setCellValue("창의융합캠프");
    	    }else if(course.equals("4"))
    	    {
    	    	cell = row.createCell(++columnCnt);
        	    cell.setCellValue("기타");
    	    }else {
    	    	cell = row.createCell(++columnCnt);
        	    cell.setCellValue("기타");
    	    }
    	    
    	    String COURSE_PRGM = tempMap.get("COURSE_PRGM")+"";
    		cell = row.createCell(++columnCnt);
    	    if(COURSE_PRGM.equals("11"))
    	    {
    	    	cell.setCellValue("상담");
    	    }else if(COURSE_PRGM.equals("12"))
    	    {
    	    	cell.setCellValue("진로적성검사");
    	    }else if(COURSE_PRGM.equals("13"))
    	    {
    	    	cell.setCellValue("학습멘토링");
    	    }else if(COURSE_PRGM.equals("14"))
    	    {
    	    	cell.setCellValue("자율연구");
    	    }else if(COURSE_PRGM.equals("15"))
    	    {
    	    	cell.setCellValue("융합과학 프로젝트");
    	    }else if(COURSE_PRGM.equals("16"))
    	    {
    	    	cell.setCellValue("전문가멘토링");
    	    }else if(COURSE_PRGM.equals("17"))
    	    {
    	    	cell.setCellValue("기타");
    	    }else if(COURSE_PRGM.equals("21"))
    	    {
    	    	cell.setCellValue("현장체험학습");
    	    }else if(COURSE_PRGM.equals("22"))
    	    {
    	    	cell.setCellValue("또래멘토링");
    	    }else if(COURSE_PRGM.equals("23"))
    	    {
    	    	cell.setCellValue("온라인 학습멘토링");
    	    }else if(COURSE_PRGM.equals("24"))
    	    {
    	    	cell.setCellValue("문화체험25기타");
    	    }else if(COURSE_PRGM.equals("25"))
    	    {
    	    	cell.setCellValue("");
    	    }else if(COURSE_PRGM.equals("31"))
    	    {
    	    	cell.setCellValue("캠프");
    	    }else if(COURSE_PRGM.equals("41"))
    	    {
    	    	cell.setCellValue("오리엔테이션");
    	    }else if(COURSE_PRGM.equals("42"))
    	    {
    	    	cell.setCellValue("성과발표회");	
    	    }else {
        	    cell.setCellValue("기타");
    	    }
    	        	    

    	    cell = row.createCell(++columnCnt);
    	    cell.setCellValue(tempMap.get("PRGM_NM")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellValue(tempMap.get("START_TM")+"~"+tempMap.get("END_TM"));
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellValue(tempMap.get("PLACE")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellValue(tempMap.get("RTICIPATION_TM")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellValue(tempMap.get("STFT")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellValue(tempMap.get("PROF_STFT")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    String EVAL_OPEN_YN = tempMap.get("EVAL_OPEN_YN")+"";
    	    if(EVAL_OPEN_YN.equals("1") || EVAL_OPEN_YN.equals("Y"))
    	    {
    	    	cell.setCellValue("공개");	
    	    }else
    	    {
    	    	cell.setCellValue("비공개");
    	    }
    	    
	    	System.out.println("----excel --- + " + i);
	    }

	    // 컨텐츠 타입과 파일명 지정
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename=portfolio_detail.xls");

	    // 엑셀 출력
	    try {
	    	workbook.write(response.getOutputStream());
	    	workbook.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
}
