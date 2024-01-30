package egovframework.kaist.admin.buseo.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
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

import egovframework.kaist.admin.buseo.model.AdminBuseoVo;
import egovframework.kaist.admin.buseo.service.AdminBuseoService;

@Controller
public class AdminBuseoController {

	@Autowired
	AdminBuseoService adminBuseoService;
	
	protected Log log = LogFactory.getLog(AdminBuseoController.class);
	
	@RequestMapping(value = "/admin/buseo/list.do", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		//model = adminBuseoService.getListAll();
		
		return new ModelAndView("admin/buseo/list", "model", model);
	}
	@RequestMapping(value = "/admin/buseo/list_tree.do", method = RequestMethod.GET)
	public ModelAndView list_tree(HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		model = adminBuseoService.getListAll();
		
		return new ModelAndView("admin/buseo/list_tree", "model", model);
	}
	@RequestMapping(value = "/admin/buseo/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();
		
		return new ModelAndView("admin/buseo/insert","model", model);
	}
	
	@RequestMapping(value = "/admin/buseo/insert.do", method = RequestMethod.POST)
	public void insertPost(@ModelAttribute("AdminBuseoVo") AdminBuseoVo adminBuseoVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		int rtn = adminBuseoService.setInsert(adminBuseoVo);
		
		if(rtn > 0 )
		{
			try {
				response.getWriter().println("true");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else
		{
			try {
				response.getWriter().println("false");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	@RequestMapping(value = "/admin/buseo/{buseoid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("buseoid") String buseoid, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		
		model = adminBuseoService.getView(buseoid);
		
		
		return new ModelAndView("admin/buseo/update","model", model);
	}
	
	@RequestMapping(value = "/admin/buseo/update.do", method = RequestMethod.POST)
	public void updatePost(@ModelAttribute("AdminBuseoVo") AdminBuseoVo adminBuseoVo, HttpServletRequest request,  HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		boolean rtn = adminBuseoService.setUpdate(adminBuseoVo);
		
		if(rtn)
		{
			try {
				response.getWriter().println("true");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else
		{
			try {
				response.getWriter().println("false");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	@RequestMapping(value = "/admin/buseo/delete.do", method = RequestMethod.POST)
	public void deletePost(@ModelAttribute("AdminBuseoVo") AdminBuseoVo adminBuseoVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		boolean rtn = adminBuseoService.setDelete(adminBuseoVo);
		if(rtn)
		{
			try {
				response.getWriter().println("true");
			} catch (IOException e) {
				e.printStackTrace();
			}	
		}else
		{

			try {
				response.getWriter().println("false");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	@RequestMapping(value = "/admin/buseo/excel.do", method = RequestMethod.GET)
	public ModelAndView excelGet(HttpServletRequest request, HttpServletResponse response) {

		ModelMap model = new ModelMap();

		return new ModelAndView("admin/buseo/excel", "model", model);
	}
	

	@RequestMapping(value = "/admin/buseo/excel.do", method = RequestMethod.POST)
	public String excelPost(MultipartHttpServletRequest request, HttpServletResponse response) {

		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+request.getContextPath()+"/upload/buseo/";
		System.out.println(drv);
		String filename = SUtil.setFileUpload(request, drv);
		ModelMap model = new ModelMap();

		try {
            FileInputStream fis = new FileInputStream(drv + filename);
            HSSFWorkbook workbook = new HSSFWorkbook(fis);
            HSSFSheet sheet = workbook.getSheetAt(0); // 해당 엑셀파일의 시트(Sheet) 수
            int rows = sheet.getPhysicalNumberOfRows(); // 해당 시트의 행의 개수
            for (int rowIndex = 2; rowIndex < rows; rowIndex++)
            {
                HSSFRow row = sheet.getRow(rowIndex); // 각 행을 읽어온다
                if (row != null)
                {
                    int cells = row.getPhysicalNumberOfCells();
                    AdminBuseoVo vo = new AdminBuseoVo();
                    
                    for (int columnIndex = 0; columnIndex <= cells; columnIndex++)
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
                        
                        if(columnIndex == 1)
                        {
                        	vo.setIDX(value);
                        }else if(columnIndex == 3)
                        {
                        	vo.setNAME(value);
                        }else if(columnIndex == 4)
                        {
                        	vo.setCREATE_TM(value);
                        }else if(columnIndex == 5)
                        {
                        	vo.setUPDATE_TM(value);
                        }
                    }//for cloumn
                   
                
                   
                }//for row
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
		
		
		return "redirect:/admin/buseo/list.do";
	}


	@RequestMapping(value = "/admin/buseo/excelDown.do", method = RequestMethod.GET)
	public void excelDown(HttpServletRequest request, HttpServletResponse response) {
		// 게시판 목록조회

		ModelMap model = adminBuseoService.getListAll();

		List<HashMap> list = (List<HashMap>) model.get("list");

		Workbook wb = new HSSFWorkbook();

	    Sheet sheet = wb.createSheet("부서");

	    Row row = null;

	    Cell cell = null;

	    int rowNo = 0;



	    // 헤더 생성
	    int cellCnt = 0;
	    row = sheet.createRow(rowNo++);
	    cell = row.createCell(++cellCnt);
		cell.setCellValue("다운로드");
		cell = row.createCell(++cellCnt);
		cell.setCellValue(SUtil.getNowDateTime() + " / 부서 삭제 부모번호 (-1)");
		
	    row = sheet.createRow(rowNo++);
	    
	    cellCnt = 0;
	    cell = row.createCell(++cellCnt);
		cell.setCellValue("번호");

		cell = row.createCell(++cellCnt);
		cell.setCellValue("부모번호");

		cell = row.createCell(++cellCnt);
		cell.setCellValue("부서명");

		cell = row.createCell(++cellCnt);
		cell.setCellValue("생성일");

		cell = row.createCell(++cellCnt);
		cell.setCellValue("업데이트일");
		
		

		for (int i = 0; i < list.size(); i++) {
			HashMap map = list.get(i);
			cellCnt = 0;
			row = sheet.createRow(i+2);
			cell = row.createCell(++cellCnt);
			cell.setCellValue(map.get("IDX").toString());

			cell = row.createCell(++cellCnt);
			cell.setCellValue(map.get("PARENT_IDX").toString());

			cell = row.createCell(++cellCnt);
			cell.setCellValue(map.get("NAME").toString());
			
			try {
				cell = row.createCell(++cellCnt);
				cell.setCellValue(map.get("CREATE_TM").toString());
			} catch (java.lang.NullPointerException e) {
				cell = row.createCell(++cellCnt);
				cell.setCellValue("");
			}

			try {
				cell = row.createCell(++cellCnt);
				cell.setCellValue(map.get("UPDATE_TM").toString());
			} catch (java.lang.NullPointerException e) {
				cell = row.createCell(++cellCnt);
				cell.setCellValue("");
			}
		}

	    // 컨텐츠 타입과 파일명 지정

	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename=buseo.xls");


	    try {
			wb.write(response.getOutputStream());
			//wb.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	
	
}
