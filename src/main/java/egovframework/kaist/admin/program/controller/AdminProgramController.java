package egovframework.kaist.admin.program.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.system.util.SUtil;

import egovframework.kaist.admin.program.model.AdminProgramVo;
import egovframework.kaist.admin.program.service.AdminProgramService;
import egovframework.kaist.admin.program_apply.service.AdminProgramApplyService;

@Controller
public class AdminProgramController {

	@Autowired
	AdminProgramService adminProgramService;

	@Autowired
	AdminProgramApplyService adminProgramApplyService;

	private static final Logger Logger = LoggerFactory.getLogger(AdminProgramController.class);

	@RequestMapping(value = "/admin/program/{programid}/list.do", method = RequestMethod.GET)
	public ModelAndView list(@PathVariable("programid") String programid, 
			@ModelAttribute("AdminProgramVo") AdminProgramVo adminProgramVo,
			HttpServletRequest request, 
			HttpServletResponse response) {
		if(programid.equals("participation"))
		{
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
			
			
			adminProgramVo.setPAGE(Integer.parseInt(PAGE));
			adminProgramVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
			
			
			ModelMap model = new ModelMap();
		
			int pagelimit = adminProgramVo.getPAGE() * adminProgramVo.getITEM_COUNT();
			
			adminProgramVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
			adminProgramVo.setOFFSET(pagelimit);
		
			model = adminProgramApplyService.getList(adminProgramVo);
			
			model.put("SEARCH_TYPE", adminProgramVo.getSEARCH_TYPE());
			model.put("SEARCH_TEXT", adminProgramVo.getSEARCH_TEXT());
			
		
			if(!adminProgramVo.getYEAR().equals(""))
			{
				
				AdminProgramVo adminProgramVo2 = new AdminProgramVo();
				adminProgramVo.setLIMIT(100000);
				adminProgramVo.setOFFSET(0);
				adminProgramVo.setYEAR(adminProgramVo.getYEAR());
				//adminProgramVo.setTYPE(programid);
				model.put("PROGRAM", adminProgramService.getList(adminProgramVo));

			}
			model.put("TYPE", programid);
			
			model.put("beforeDomain", adminProgramVo);

			
			model.put("YEARLIST", adminProgramService.getListGroupByYear());
			return new ModelAndView("admin/program/participation/list", "model", model);
		}else
		{
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
			
			adminProgramVo.setTYPE(programid);
			adminProgramVo.setPAGE(Integer.parseInt(PAGE));
			adminProgramVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
			
			
			ModelMap model = new ModelMap();
		
			int pagelimit = adminProgramVo.getPAGE() * adminProgramVo.getITEM_COUNT();
			
			adminProgramVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
			adminProgramVo.setOFFSET(pagelimit);
		
			model.put("SEARCH_TYPE", adminProgramVo.getSEARCH_TYPE());
			model.put("SEARCH_TEXT", adminProgramVo.getSEARCH_TEXT());
			
			adminProgramVo.setSEARCH_TEXT(adminProgramVo.getSEARCH_TEXT());
			adminProgramVo.setSEARCH_TYPE(adminProgramVo.getSEARCH_TYPE());
		
		

			AdminProgramVo adminProgramVo2 = new AdminProgramVo();
			
			adminProgramVo.setYEAR(adminProgramVo.getYEAR());
			model = adminProgramService.getList(adminProgramVo);
			
			
			model.put("TYPE", programid);
			
			model.put("beforeDomain", adminProgramVo);

			
			model.put("YEARLIST", adminProgramService.getListGroupByYear());
			
			
			return new ModelAndView("admin/program/list", "model", model);
		}
	}

	@RequestMapping(value = "/admin/program/{programid}/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(@PathVariable("programid") String programid,  HttpServletRequest request, HttpServletResponse response) 
	{

		ModelMap model = new ModelMap();
		model.put("TYPE", programid);
		
		model.put("TODAY", SUtil.getNowDate());
		
		return new ModelAndView("admin/program/insert", "model", model);
	}

	@RequestMapping(value = "/admin/program/{programid}/insert.do", method = RequestMethod.POST)
	public String insertPost(@PathVariable("programid") String programid, 
			@ModelAttribute("AdminProgramVo") AdminProgramVo adminProgramVo,
			MultipartHttpServletRequest  request,  HttpServletResponse response) throws UnsupportedEncodingException {
		

		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/program/";
		 
		Iterator<String> itr =  request.getFileNames();
		String fnames="";
		
	    while (itr.hasNext())
	    { 
	    	String fname="";
	    	MultipartFile mpf = request.getFile(itr.next());
		    String originFileName = mpf.getOriginalFilename();
		    
		    System.out.println("---nks : multipartRequest.getAttributeNames() : " + mpf.getName());
		    
		    if(originFileName.equals(""))
		    {
		    	continue;
		    }
			 File desti = new File(drv);
		  	 if(!desti.exists())
			 {
				desti.mkdirs();
			 }
		  	 
		  	 if( mpf.getName().indexOf("TITLE") > -1)
		  	 {
		  		long time = System.currentTimeMillis();
			  	if(!originFileName.equals(""))
			  	{
			  		fname = "titleimage_"+time+"_"+originFileName;	
			  	} 
		  	 }else
		  	 {
		  		long time = System.currentTimeMillis();
			  	if(!originFileName.equals(""))
			  	{
			  		fname = time+"_"+originFileName;	
			  	}	 
		  	 }
		  	

		  	fname = SUtil.StringReplace(fname);
		  	
		  	fname = fname.trim(); 
		  	String rname = "";
		  	for(int i = 0; i < fname.length(); i++)
		  	{
		  		if(fname.charAt(i) != ' ')
		  		{
		  			rname += fname.charAt(i);
		  		}
		  	}
		  	fname = rname;
		  	System.out.println("fname = "+fname);
		  	File file = new File(drv+fname);
			
			if(! file.exists()) 
			{
				try {
					file.createNewFile();
				} catch (IOException e) {
					e.printStackTrace();
				} 
			}else 
			{
				file.delete();
				try {
					file.createNewFile();
				} catch (IOException e) {
					e.printStackTrace();
				} 
			}
			try {
				mpf.transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} 
			try {
				fname = URLEncoder.encode(fname, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			if(originFileName.equals(adminProgramVo.getFILES()))
			{
				adminProgramVo.setFILES(fname);
			}else if(originFileName.equals(adminProgramVo.getWORKBOOK()))
			{
				adminProgramVo.setWORKBOOK(fname);
			}else 
			{
				adminProgramVo.setFILES(fname);
			}
        }
	    
		
		ModelMap model = new ModelMap();

		adminProgramService.setInsert(adminProgramVo);		
		
		return "redirect:./list.do";
	}
	
	@RequestMapping(value = "/admin/program/{type}/{programid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(
			@PathVariable("programid") String programid,
			@PathVariable("type") String type,
			HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		model = adminProgramService.getView(programid);
		model.put("TYPE", type);
		model.put("programid", programid);
		return new ModelAndView("admin/program/update", "model", model);
	}
	
	@RequestMapping(value = "/admin/program/update.do", method = RequestMethod.POST)
	public String updatePost(@ModelAttribute("AdminProgramVo") AdminProgramVo adminProgramVo,
			MultipartHttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		ModelMap model = new ModelMap();

		
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/program/";
		 
		Iterator<String> itr =  request.getFileNames();
		String fnames="";
		
	    while (itr.hasNext())
	    { 
	    	String fname="";
	    	MultipartFile mpf = request.getFile(itr.next());
		    String originFileName = mpf.getOriginalFilename();
		    
		    System.out.println("---nks : multipartRequest.getAttributeNames() : " + mpf.getName());
		    
		    if(originFileName.equals(""))
		    {
		    	continue;
		    }
			 File desti = new File(drv);
		  	 if(!desti.exists())
			 {
				desti.mkdirs();
			 }
		  	 
		  	 if( mpf.getName().indexOf("TITLE") > -1)
		  	 {
		  		long time = System.currentTimeMillis();
			  	if(!originFileName.equals(""))
			  	{
			  		fname = "titleimage_"+time+"_"+originFileName;	
			  	} 
		  	 }else
		  	 {
		  		long time = System.currentTimeMillis();
			  	if(!originFileName.equals(""))
			  	{
			  		fname = time+"_"+originFileName;	
			  	}	 
		  	 }
		  	

		  	fname = SUtil.StringReplace(fname);
		  	
		  	fname = fname.trim(); 
		  	String rname = "";
		  	for(int i = 0; i < fname.length(); i++)
		  	{
		  		if(fname.charAt(i) != ' ')
		  		{
		  			rname += fname.charAt(i);
		  		}
		  	}
		  	fname = rname;
		  	System.out.println("fname = "+fname);
		  	File file = new File(drv+fname);
			
			if(! file.exists()) 
			{
				try {
					file.createNewFile();
				} catch (IOException e) {
					e.printStackTrace();
				} 
			}else 
			{
				file.delete();
				try {
					file.createNewFile();
				} catch (IOException e) {
					e.printStackTrace();
				} 
			}
			try {
				mpf.transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} 
			try {
				fname = URLEncoder.encode(fname, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			if(originFileName.equals(adminProgramVo.getFILES()))
			{
				adminProgramVo.setFILES(fname);
			}else if(originFileName.equals(adminProgramVo.getWORKBOOK()))
			{
				adminProgramVo.setWORKBOOK(fname);
			}else 
			{
				adminProgramVo.setFILES(fname);
			}
        }
		
		
		boolean rtn = adminProgramService.setUpdate(adminProgramVo);

		/*if (rtn) {
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
		}*/
		
		return "redirect:./"+adminProgramVo.getTYPE()+"/list.do";
	}

	@RequestMapping(value = "/admin/program/delete.do", method = RequestMethod.POST)
	public void deletePost(@ModelAttribute("AdminProgramVo") AdminProgramVo adminProgramVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String year = request.getParameter("year") != null ? request.getParameter("year") : "";
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		boolean rtn = adminProgramService.setDelete(adminProgramVo);
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

	@RequestMapping(value = "/admin/program/{programid}/getProgramList.do", method = RequestMethod.GET)
	public ModelAndView getProgramList(@PathVariable("programid") String programid,
			HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		String YEAR = request.getParameter("YEAR") != null ? request
				.getParameter("YEAR") : SUtil.getNowDate().substring(0, 4);
		
		AdminProgramVo adminProgramVo = new AdminProgramVo();
		adminProgramVo.setLIMIT(100000);
		adminProgramVo.setOFFSET(0);
		adminProgramVo.setYEAR(YEAR);
		adminProgramVo.setTYPE(programid);
		model = adminProgramService.getList(adminProgramVo);
		
		return new ModelAndView("admin/program/selectProgramBox", "model", model);
	}
	


	@RequestMapping(value = "/admin/program/{programid}/deleteArr.do", method = RequestMethod.POST)
	public void deleteArrPost(@PathVariable("programid") String programid, @ModelAttribute("AdminProgramVo") AdminProgramVo adminProgramVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		String idx = adminProgramVo.getIDX();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				AdminProgramVo adminProgramVo2 = new AdminProgramVo();
				adminProgramVo2.setIDX(arrIdx[i]);
				adminProgramService.setDelete(adminProgramVo2);		
			}
		}
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	
	@RequestMapping(value = "/admin/program/{programid}/excelDown.do", method = RequestMethod.GET)
	public void excelDown(@PathVariable("programid") String programid,
			@ModelAttribute("AdminProgramVo") AdminProgramVo adminProgramVo, 
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		ModelMap map = null;
				
	    // 워크북 생성
	    Workbook wb = new HSSFWorkbook();

	    Sheet sheet = wb.createSheet("프로그램");

	    Row row = null;

	    Cell cell = null;

	    int rowNo = 0;
	    int rowNo2 = 0;

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
	    cell.setCellValue("프로그램명");
	   
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("신청자 아이디");

	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("이름");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("연락처");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("학교 이름");
	    
	    

	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    
	    if(Integer.parseInt(programid) == 204)
	    {
	    	cell.setCellValue("참석여부");
	    }
	    else if(Integer.parseInt(programid) > 199)
	    {
	    	cell.setCellValue("참석여부(교사)");
	    }else
	    {
	    	cell.setCellValue("참석여부(학부모)");	
	    }
	    
	    
	    
	    

	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("신청일");

		
		ModelMap model = new ModelMap();

		String idx = adminProgramVo.getIDX();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length() > 0)
			{
				AdminProgramVo adminProgramVo2 = new AdminProgramVo();
				adminProgramVo2.setIDX(arrIdx[i]);
				
				adminProgramVo2.setPAGE(0);
				adminProgramVo2.setITEM_COUNT(99999999);
			
				int pagelimit = adminProgramVo2.getPAGE() * adminProgramVo2.getITEM_COUNT();
				
				adminProgramVo2.setLIMIT(99999999);
				adminProgramVo2.setOFFSET(pagelimit);
				
				model = adminProgramApplyService.getList(adminProgramVo2);
				List<?> list = (List<?>) model.get("list");
				
			  for(int j = 0; j < list.size(); j++ )
			    {
			    	
			    	HashMap tempMap = (HashMap) list.get(j);
			    	String TYPE = tempMap.get("TYPE")+"";
			    	String MEMBER_TYPE = tempMap.get("MEMBER_TYPE")+"";
		    		columnCnt = 0;
		    	    row = sheet.createRow(rowNo++);

		    	    cell = row.createCell(++columnCnt);
		    	    cell.setCellStyle(bodyStyle);
		    	    cell.setCellValue(tempMap.get("NAME")+"");
		    	    
		    	    cell = row.createCell(++columnCnt);
		    	    cell.setCellStyle(bodyStyle);
		    	    cell.setCellValue(tempMap.get("MEMBER_ID")+"");
		    	    
		    	    cell = row.createCell(++columnCnt);
		    	    cell.setCellStyle(bodyStyle);
		    	    cell.setCellValue(tempMap.get("MEMBER_NAME")+"");
		    	    
		    	    
		    	    cell = row.createCell(++columnCnt);
		    	    cell.setCellStyle(bodyStyle);
		    	    cell.setCellValue(tempMap.get("PHONE")+"");
		    	    
		    	    
		    	    cell = row.createCell(++columnCnt);
		    	    cell.setCellStyle(bodyStyle);
		    	    cell.setCellValue(tempMap.get("SCHOOL_NAME")+"");
		    	    
		    	    cell = row.createCell(++columnCnt);
		    	    cell.setCellStyle(bodyStyle);
		    	    
		    	    String app = tempMap.get("ATTEND")+"";
		    	    if(app.equals("1"))
		    	    {
		    	    	String str = "참석";
		    	    	if(MEMBER_TYPE.equals("1"))
		    	    	{
		    	    		str += "(학부모)";
		    	    	}else
		    	    	{
		    	    		str += "(교사)";
		    	    	}
		    	    	cell.setCellValue(str);
		    	    }else
		    	    {
		    	    	cell.setCellValue("미참석");
		    	    }
		    	    
		    	    cell = row.createCell(++columnCnt);
		    	    cell.setCellStyle(bodyStyle);
		    	    cell.setCellValue(tempMap.get("CREATE_TM")+"");
		    	    
			    }
			}
		}
		
		
    // 컨텐츠 타입과 파일명 지정

    response.setContentType("ms-vnd/excel");

    response.setHeader("Content-Disposition", "attachment;filename=program.xls");

    // 엑셀 출력
    wb.write(response.getOutputStream());
    wb.close();

	
	}
	
	
}
