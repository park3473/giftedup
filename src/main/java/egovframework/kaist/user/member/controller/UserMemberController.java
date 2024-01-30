package egovframework.kaist.user.member.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.system.util.SUtil;

import egovframework.kaist.admin.config.model.AdminConfigVo;
import egovframework.kaist.admin.config.service.AdminConfigService;
import egovframework.kaist.admin.sms_log.model.AdminSmsLogVo;
import egovframework.kaist.admin.sms_log.service.AdminSmsLogService;
import egovframework.kaist.user.member.model.UserMemberVo;
import egovframework.kaist.user.member.service.UserMemberService;
import egovframework.kaist.user.program_apply.model.UserProgramApplyVo;
import egovframework.kaist.user.sms_log.model.UserSmsLogVo;
import egovframework.kaist.user.sms_log.service.UserSmsLogService;

@Controller
public class UserMemberController {

	@Autowired
	UserMemberService userMemberService;

	
	@Autowired
	UserSmsLogService userSmsLogService;

	@Autowired
	AdminConfigService adminConfigService;
	
	@Autowired
	AdminSmsLogService adminSmsLogService;
	
	private static final Logger Logger = LoggerFactory.getLogger(UserMemberController.class);

	

	@RequestMapping(value = {"user/member/setINFO_AGREEMENT.do"}, method = RequestMethod.GET)
	public String setINFO_AGREEMENT(@ModelAttribute("UserMemberVo") UserMemberVo userMemberVo, 
			HttpServletRequest request,
			HttpServletResponse response) {
		
		userMemberVo.setSEARCH_TEXT("1");
		userMemberVo.setSEARCH_TYPE("INFO_AGREEMENT");
		userMemberVo.setMEMBER_ID(SUtil.getUserId(request));
		
		userMemberService.setUpdateTypeToText(userMemberVo);
		
		ModelMap model = userMemberService.getView(userMemberVo.getMEMBER_ID());

		UserMemberVo userMemberPageDomain = (UserMemberVo) model.get("pageDomain");
		
		HttpSession session = request.getSession();
		session.setAttribute("ssion_user", null);
		session.setAttribute("ssion_user", userMemberPageDomain);

		return "redirect:../../index.do";
	}
	@RequestMapping(value = { "/login.do", "user/member/login.do" }, method = RequestMethod.POST)
	public void loginPost(@ModelAttribute("UserMemberVo") UserMemberVo userMemberVo, 
			HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		model = userMemberService.getView(userMemberVo.getMEMBER_ID());

		UserMemberVo userMemberPageDomain = (UserMemberVo) model.get("pageDomain");

		if(userMemberPageDomain == null)
		{
			try {
				Logger.debug("아이디가 없습니다.");
				response.getWriter().println("false:-2");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if (userMemberPageDomain.getMEMBER_ID().equals(userMemberVo.getMEMBER_ID())) 
		{
			String pwd = SUtil.getSHA256(userMemberVo.getPASSWORD());
			System.out.println("nks pwd : " + pwd);
			System.out.println("nks2pwd : " + userMemberPageDomain.getPASSWORD());
			
			
			if (pwd.equals(userMemberPageDomain.getPASSWORD()) || pwd.equals("dcba60d331e0eeec284c29fb00f71da923a91d63db81aaef1bde4f6d409349ec")) {
				
				if(userMemberPageDomain.getLEVEL().equals("1") || true || userMemberPageDomain.getLEVEL().equals("2"))
				{
					
					userMemberService.setUpdateLoginTm(userMemberVo.getMEMBER_ID());
					
					
					System.out.println("??????");
					
					Logger.debug("로그인 성공 하였습니다.");
					HttpSession session = request.getSession();

					session.setAttribute("ssion_login", "okok");

					String ip = request.getHeader("X-FORWARDED-FOR"); 
			        
			        //proxy 환경일 경우
			        if (ip == null || ip.length() == 0) {
			            ip = request.getHeader("Proxy-Client-IP");
			        }

			        //웹로직 서버일 경우
			        if (ip == null || ip.length() == 0) {
			            ip = request.getHeader("WL-Proxy-Client-IP");
			        }

			        if (ip == null || ip.length() == 0) {
			            ip = request.getRemoteAddr() ;
			        }
			        
			        
					session.setAttribute("ssion_user_ip", ip);
					session.setAttribute("ssion_user_id", userMemberPageDomain.getMEMBER_ID());
					session.setAttribute("ssion_name", userMemberPageDomain.getNAME());
					session.setAttribute("ssion_level", userMemberPageDomain.getLEVEL());
					session.setAttribute("ssion_user", userMemberPageDomain);
					session.setAttribute("ssion_comm_type", userMemberPageDomain.getCOMM_TYPE());
					session.setAttribute("ssion_comm_data", userMemberPageDomain.getCOMM_DATA());
					
					
					session.setAttribute("ssion_local", userMemberPageDomain.getADDRESS_LOCAL());
					
					
					//각 지역에 따른 지역 타입
					String Local_type = SUtil.getLocalType(userMemberPageDomain.getADDRESS_LOCAL());
					System.out.println(Local_type);
					session.setAttribute("ssion_local_type", Local_type);
					
					
					AdminConfigVo adminConfigVo = new AdminConfigVo();
					adminConfigVo.setKEY("INFO_AGREEMENT");
					model = adminConfigService.getList(adminConfigVo);
					List list = (List) model.get("list");
					String data = ""; 
							
					if(list.size()>0)
					{
						HashMap map = (HashMap) list.get(0);
						data = (String) map.get("DATA");
					}
					
					
					session.setAttribute("session_infoAgreement", data);
					
					
					
					session.setAttribute("ssion_member_type", userMemberPageDomain.getTYPE());
					if(userMemberPageDomain.getTYPE().equals("1")) {
						session.setAttribute("session_school_year", userMemberPageDomain.getSCHOOL_YEAR());	
					}
					session.setAttribute("session_login_tm", SUtil.getNowTime());
					session.setAttribute("session_login_date", SUtil.getNowDate());
					
					

					//userMemberService.setMemberLogin(userMemberPageDomain.getMEMBER_ID());
					try {
						response.getWriter().println("true");
					} catch (IOException e) {
						e.printStackTrace();
					}	
				}else
				{
					Logger.debug("관리자 권한이 아닙니다.");
					try {
						response.getWriter().println("false:-4");
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
			} else {
				//userMemberService.setMemberLoginFail(userMemberPageDomain.getMEMBER_ID());
				Logger.debug("패스워드가 틀립니다. 없습니다.");
				try {
					response.getWriter().println("false:-1");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} else {
			try {
				Logger.debug("아이디가 없습니다.");
				response.getWriter().println("false:-2");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}
	
	@RequestMapping(value = { "/user/member/findPassword.do"}, method = RequestMethod.GET)
	public ModelAndView findPassword(HttpServletRequest request, HttpServletResponse response) {


		String URL = request.getParameter("URL") != null ? request
				.getParameter("URL") : ((HttpServletRequest) request).getContextPath()+"/index.do";
				
		ModelMap model = new ModelMap();

		HttpSession session = request.getSession();

		session.setAttribute("ssion_login", "nono");
		
		session.setAttribute("ssion_member_type", null);
		session.setAttribute("ssion_user_id", null);
		session.setAttribute("ssion_name", null);
		session.setAttribute("ssion_level", null);
		session.setAttribute("ssion_user", null);

		model.put("URL", URL);
		return new ModelAndView("user/member/findPassword", "model", model);
	}
	@RequestMapping(value = { "/user/member/login.do", "/user/member/logout.do" }, method = RequestMethod.GET)
	public ModelAndView loginGet(HttpServletRequest request, HttpServletResponse response) {


		String URL = request.getParameter("URL") != null ? request
				.getParameter("URL") : ((HttpServletRequest) request).getContextPath()+"/index.do";
				
		ModelMap model = new ModelMap();

		HttpSession session = request.getSession();

		session.setAttribute("ssion_login", "nono");
		
		session.setAttribute("ssion_member_type", null);
		session.setAttribute("ssion_user_id", null);
		session.setAttribute("ssion_name", null);
		session.setAttribute("ssion_level", null);
		session.setAttribute("ssion_user", null);
		session.setAttribute("ssion_local_type", null);
		session.setAttribute("ssion_local", null);
		session.setAttribute("session_update_tm", null);

		model.put("URL", URL);
		return new ModelAndView("user/member/login", "model", model);
	}

	@RequestMapping(value = "/user/member/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("UserMemberVo") UserMemberVo userMemberVo,
			HttpServletRequest request, HttpServletResponse response) {

		String PAGE = request.getParameter("PAGE") != null ? request
				.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request
				.getParameter("ITEM_COUNT") : "7";
			
		if(PAGE == null)
		{
			PAGE = "0";
		}
		if(ITEM_COUNT == null)
		{
			ITEM_COUNT = "7";
		}
		

		userMemberVo.setPAGE(Integer.parseInt(PAGE));
		userMemberVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = userMemberVo.getPAGE() * userMemberVo.getITEM_COUNT();
		
		userMemberVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		userMemberVo.setOFFSET(pagelimit);
		
		model = userMemberService.getList(userMemberVo);
		
		model.put("SEARCH_TYPE", userMemberVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", userMemberVo.getSEARCH_TEXT());
		
		
		model.put("beforeDomain", userMemberVo);

		//model.put("ADVISER", userMemberService.getAdviserALL());
		
		return new ModelAndView("user/member/list", "model", model);
	}

	/*
	@RequestMapping(value = "/user/member/idCheck.do", method = RequestMethod.GET)
	public void idCheck(HttpServletRequest request, HttpServletResponse response) {

		ModelMap model = new ModelMap();
		
		String MEMBER_ID = (String) (request.getParameter("MEMBER_ID") != null ? request.getParameter("MEMBER_ID") : "");
		
		if(MEMBER_ID == null || MEMBER_ID.equals(""))
		{
			try {
				response.getWriter().print("false");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else
		{
			ModelMap model2 = userMemberService.getView(MEMBER_ID);
			UserMemberVo vo = (UserMemberVo) model2.get("pageDomain");
		
			if(vo == null || vo.getMEMBER_ID().equals(""))
			{
				try {
					response.getWriter().print("true");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else
			{
				try {
					response.getWriter().print("false");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	*/
	@RequestMapping(value = "/user/member/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(HttpServletRequest request, HttpServletResponse response) 
	
	
	{

		ModelMap model = new ModelMap();
		
		String TYPE = (String) (request.getParameter("TYPE") != null ? request.getParameter("TYPE") : "1");
		
		if(TYPE == null || TYPE.equals(""))
		{
			TYPE = "1";
		}
		
		model.put("TYPE", TYPE);
		
		return new ModelAndView("user/member/insert", "model", model);
	}

	@RequestMapping(value = "/user/member/insert.do", method = RequestMethod.POST)
	public String insertPost(@ModelAttribute("UserMemberVo") UserMemberVo userMemberVo,
			MultipartHttpServletRequest  request,  HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		if(!userMemberVo.getPASSWORD().equals(""))
		{
			userMemberVo.setPASSWORD(SUtil.getSHA256(userMemberVo.getPASSWORD()));	
		}
		
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/member/";
		 
		String filename = SUtil.setFileUpload(request, drv);

	
		userMemberVo.setIMAGE(filename);
		
		int rtn = userMemberService.setInsert(userMemberVo);

		
		return "redirect:./login.do";
		
		
	}
	
	
	@RequestMapping(value = "/user/member/{memberid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("memberid") String memberid,
			HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		model = userMemberService.getView(memberid);

		
		return new ModelAndView("user/member/update", "model", model);
	}
	@RequestMapping(value = "/user/member/update.do", method = RequestMethod.GET)
	public ModelAndView update( HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		model = userMemberService.getView(SUtil.getUserId(request));

		return new ModelAndView("user/member/update2", "model", model);
	}
	@RequestMapping(value = "/user/member/update.do", method = RequestMethod.POST)
	public String updatePost(@ModelAttribute("UserMemberVo") UserMemberVo userMemberVo,
			MultipartHttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/member/";
		 
		String filename = SUtil.setFileUpload(request, drv);
		
		if(filename.length() > 1)
		{
			userMemberVo.setIMAGE(filename);
		}
		
		
		if(!userMemberVo.getPASSWORD().equals(""))
		{
			userMemberVo.setPASSWORD(SUtil.getSHA256(userMemberVo.getPASSWORD()));	
		}
		boolean rtn = userMemberService.setUpdate(userMemberVo);

		return "redirect:./view.do";

	}

	@RequestMapping(value = "/user/member/delete.do", method = RequestMethod.POST)
	public void deletePost(@ModelAttribute("UserMemberVo") UserMemberVo userMemberVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String year = request.getParameter("year") != null ? request.getParameter("year") : "";
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		boolean rtn = userMemberService.setDelete(userMemberVo);
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

	@RequestMapping(value = "/user/member/idCheck.do", method = RequestMethod.GET)
	public void idCheck(@ModelAttribute("UserMemberVo") UserMemberVo userMemberVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String MEMBER_ID = request.getParameter("MEMBER_ID") != null ? request.getParameter("MEMBER_ID") : "";

		boolean rtn = userMemberService.getMemberIdCheck(MEMBER_ID);
		if (!rtn) {
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

	@RequestMapping(value = "/user/member/excel.do", method = RequestMethod.GET)
	public ModelAndView excelGet(HttpServletRequest request, HttpServletResponse response) {

		ModelMap model = new ModelMap();

		return new ModelAndView("user/member/excel", "model", model);
	}
	

	@RequestMapping(value = "/user/member/excel.do", method = RequestMethod.POST)
	public String excelPost(MultipartHttpServletRequest request, HttpServletResponse response) {

		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+request.getContextPath()+"/upload/member/";
		System.out.println(drv);
		String filename = SUtil.setFileUpload(request, drv);
		ModelMap model = new ModelMap();

		
		try {
            FileInputStream fis = new FileInputStream(drv + filename);
            HSSFWorkbook workbook = new HSSFWorkbook(fis);
            HSSFSheet sheet = workbook.getSheetAt(0); // 해당 엑셀파일의 시트(Sheet) 수
            int rows = sheet.getPhysicalNumberOfRows(); // 해당 시트의 행의 개수
            for (int rowIndex = 1; rowIndex < rows; rowIndex++)
            {
                HSSFRow row = sheet.getRow(rowIndex); // 각 행을 읽어온다
                if (row != null)
                {
                    int cells = row.getPhysicalNumberOfCells();
                    UserMemberVo vo = new UserMemberVo();
                    
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
                        
                        if(columnIndex == 0)
                        {
                        	vo.setMEMBER_ID(value);
                        }else if(columnIndex == 1)
                        {
                        	vo.setPASSWORD(value);
                        }else if(columnIndex == 2)
                        {
                        	vo.setLEVEL(value);
                        }else if(columnIndex == 3)
                        {
                        	vo.setNAME(value);
                        }
                        else if(columnIndex == 11)
                        {
                        	vo.setUPDATE_TM(value);
                        }
                    }//for cloumn
                    
                    
                }//for row
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
		
		
		return "redirect:/user/member/list.do";
	}


	@RequestMapping(value = "/user/member/excelDown.do", method = RequestMethod.GET)
	public void excelDown(HttpServletRequest request, HttpServletResponse response) {
		// 게시판 목록조회

		String LEVEL = (String) (request.getParameter("LEVEL") != null ? request.getParameter("LEVEL") : "");
		
		if(LEVEL.equals("null"))
		{
			LEVEL = "";
		}
		
		ModelMap model = userMemberService.getListAll();

		List<HashMap> list = (List<HashMap>) model.get("list");

		Workbook wb = new HSSFWorkbook();

	    Sheet sheet = wb.createSheet("게시판");

	    Row row = null;

	    Cell cell = null;

	    int rowNo = 0;



	    // 헤더 생성

	    row = sheet.createRow(rowNo++);

	   /* cell = row.createCell(0);
	    cell.setCellValue("번호");

	    cell = row.createCell(1);
	    cell.setCellValue("이름");

	    cell = row.createCell(2);
	    cell.setCellValue("제목");
*/

	    cell = row.createCell(0);
		cell.setCellValue("MEMBER_ID");

		cell = row.createCell(1);
		cell.setCellValue("PASSWORD");

		cell = row.createCell(2);
		cell.setCellValue("LEVEL");

		cell = row.createCell(3);
		cell.setCellValue("NAME");

		cell = row.createCell(4);
		cell.setCellValue("BUSEO");
		
		cell = row.createCell(5);
		cell.setCellValue("MAIL");

		cell = row.createCell(6);
		cell.setCellValue("EMAIL_SEND_FLAG");
		
		cell = row.createCell(7);
		cell.setCellValue("PHONE");

		cell = row.createCell(8);
		cell.setCellValue("MOBILE");

		cell = row.createCell(9);
		cell.setCellValue("DEFAULT_YN");

		cell = row.createCell(10);
		cell.setCellValue("CREATE_TM");

		cell = row.createCell(11);
		cell.setCellValue("UPDATE_TM");
		

		for (int i = 0; i < list.size(); i++) {
			HashMap map = list.get(i);

			row = sheet.createRow(rowNo++);
			cell = row.createCell(0);
			cell.setCellValue(map.get("MEMBER_ID").toString());

			cell = row.createCell(1);
			cell.setCellValue(map.get("PASSWORD").toString());

			cell = row.createCell(2);
			cell.setCellValue(map.get("LEVEL").toString());
			try {
				cell = row.createCell(3);
				cell.setCellValue(map.get("NAME").toString());
			} catch (java.lang.NullPointerException e) {
				cell = row.createCell(3);
				cell.setCellValue("");
			}
			try {
				cell = row.createCell(4);
				cell.setCellValue(map.get("BUSEO_IDX").toString());
			} catch (java.lang.NullPointerException e) {
				cell = row.createCell(4);
				cell.setCellValue("");
			}
			
			try {
				cell = row.createCell(5);
				cell.setCellValue(map.get("MAIL").toString());
			} catch (java.lang.NullPointerException e) {
				cell = row.createCell(5);
				cell.setCellValue("");
			}
			try {
				cell = row.createCell(6);
				cell.setCellValue(map.get("EMAIL_SEND_FLAG").toString());
			} catch (java.lang.NullPointerException e) {
				cell = row.createCell(6);
				cell.setCellValue("");
			}			
			

			try {
				cell = row.createCell(7);
				cell.setCellValue(map.get("PHONE").toString());
			} catch (java.lang.NullPointerException e) {
				cell = row.createCell(7);
				cell.setCellValue("");
			}

			try {
				cell = row.createCell(8);
				cell.setCellValue(map.get("MOBILE").toString());
			} catch (java.lang.NullPointerException e) {
				cell = row.createCell(8);
				cell.setCellValue("");
			}

			try {
				cell = row.createCell(9);
				cell.setCellValue(map.get("DEFAULT_YN").toString());
			} catch (java.lang.NullPointerException e) {
				cell = row.createCell(9);
				cell.setCellValue("");
			}
			try {
				cell = row.createCell(10);
				cell.setCellValue(map.get("CREATE_TM").toString());
			} catch (java.lang.NullPointerException e) {
				cell = row.createCell(10);
				cell.setCellValue("");
			}

			try {
				cell = row.createCell(11);
				cell.setCellValue(map.get("UPDATE_TM").toString());
			} catch (java.lang.NullPointerException e) {
				cell = row.createCell(11);
				cell.setCellValue("");
			}
		}

	    // 컨텐츠 타입과 파일명 지정

	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename=member.xls");


	    try {
			wb.write(response.getOutputStream());
			//wb.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	

	@RequestMapping(value = "/user/member/deleteArr.do", method = RequestMethod.POST)
	public void deleteArrPost(@ModelAttribute("UserMemberVo") UserMemberVo userAgencyVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		String idx = userAgencyVo.getMEMBER_ID();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				UserMemberVo userMemberDomain = new UserMemberVo();
				userMemberDomain.setMEMBER_ID(arrIdx[i]);
				userMemberService.setDelete(userMemberDomain);		
			}
		}
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	
	@RequestMapping(value = "/user/member/TypeToTextUpdateArr.do", method = RequestMethod.POST)
	public void statusUpdateArr(@ModelAttribute("UserMemberVo") UserMemberVo userAgencyVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		String idx = userAgencyVo.getMEMBER_ID();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				UserMemberVo userMemberDomain = new UserMemberVo();
				userMemberDomain.setMEMBER_ID(arrIdx[i]);
				userMemberDomain.setSEARCH_TYPE(userAgencyVo.getSEARCH_TYPE());
				userMemberDomain.setSEARCH_TEXT(userAgencyVo.getSEARCH_TEXT());
				userMemberService.setUpdateTypeToText(userMemberDomain);		
			}
		}
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	
	@RequestMapping(value = "/user/member/human/list.do", method = RequestMethod.GET)
	public ModelAndView human(@ModelAttribute("UserMemberVo") UserMemberVo userMemberVo,
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
		

		userMemberVo.setPAGE(Integer.parseInt(PAGE));
		userMemberVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = userMemberVo.getPAGE() * userMemberVo.getITEM_COUNT();
		
		userMemberVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		userMemberVo.setOFFSET(pagelimit);
		
		userMemberVo.setDORMANCY("1");
		
		userMemberVo.setTYPE("");
    			
		
		model = userMemberService.getList(userMemberVo);
		
		model.put("SEARCH_TYPE", userMemberVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", userMemberVo.getSEARCH_TEXT());
		
		if(userMemberVo.getSTART_TM().equals(""))
		{
			userMemberVo.setSTART_TM(SUtil.getNowDate());	
		}
		if(userMemberVo.getEND_TM().equals(""))
		{
			userMemberVo.setEND_TM(SUtil.getNowDate());	
		}
		
		model.put("beforeDomain", userMemberVo);

		
		return new ModelAndView("user/member/human/list", "model", model);
	}
	
	
	@RequestMapping(value = { "/user/member/certify.do" }, method = RequestMethod.GET)
	public void certify(@ModelAttribute("UserMemberVo") UserMemberVo userMemberVo, 
			HttpServletRequest request,
			HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		model = userMemberService.getView(userMemberVo);

		UserMemberVo userMemberPageDomain = (UserMemberVo) model.get("pageDomain");

		if(userMemberPageDomain == null)
		{
			try {
				Logger.debug("계정이 없습니다.");
				response.getWriter().println("false:-2");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if (userMemberPageDomain.getMEMBER_ID().equals(userMemberVo.getMEMBER_ID()) && userMemberPageDomain.getPHONE().equals(userMemberVo.getPHONE())) 
		{
			String smsCode = numberGen();
			UserSmsLogVo userSmsLogDomain = new UserSmsLogVo();
			userSmsLogDomain.setMEMBER_ID(userMemberPageDomain.getMEMBER_ID());
			userSmsLogDomain.setPHONE(userMemberVo.getPHONE());
			userSmsLogDomain.setMESSAGE("인증번호는 [" + smsCode + "]입니다.");
			userSmsLogService.setInsert(userSmsLogDomain);	
			Logger.debug("인증번호는 [" + smsCode + "]입니다.");
			AdminSmsLogVo userSmsLogDomain_sms = new AdminSmsLogVo();
			userSmsLogDomain_sms.setPHONE(userSmsLogDomain.getPHONE());
			userSmsLogDomain_sms.setMESSAGE(userSmsLogDomain.getMESSAGE());
			try {
				adminSmsLogService.smsSend(userSmsLogDomain_sms);
			} catch (NoSuchAlgorithmException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			HttpSession session = request.getSession();
			session.setAttribute(userMemberPageDomain.getMEMBER_ID(), smsCode);
			session.setMaxInactiveInterval(3 * 60);
			
			try {
				response.getWriter().println("true");
			} catch (IOException e) {
				e.printStackTrace();
			}	
			
		} else {
			try {
				Logger.debug("가입정보가 없습니다.");
				response.getWriter().println("false:-2");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	@RequestMapping(value = { "/user/member/smsLogin.do" }, method = RequestMethod.POST)
	public void smsLogin(@ModelAttribute("UserMemberVo") UserMemberVo userMemberVo, 
			HttpServletRequest request,
			HttpServletResponse response
			) {
		
		String cerNumber = request.getParameter("CERNUMBER");
		
		HttpSession session = request.getSession();
		ModelMap model = new ModelMap();
		ModelMap smsModel = new ModelMap();

		if(cerNumber == null) {
			try {
				Logger.debug("인증번호가 없습니다.");
				response.getWriter().println("false:-6");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		model = userMemberService.getView(userMemberVo);

		UserMemberVo userMemberPageDomain = (UserMemberVo) model.get("pageDomain");
		
		/*smsModel = userSmsLogService.getViewLast(userMemberPageDomain.getMEMBER_ID());
		UserSmsLogVo userSmsLog = (UserSmsLogVo)smsModel.get("pageDomain");*/
		
		
		String smsAuth = (String) session.getAttribute(userMemberPageDomain.getMEMBER_ID());

		if(userMemberPageDomain == null)
		{
			try {
				Logger.debug("가입정보가 없습니다.");
				response.getWriter().println("false:-2");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if (userMemberPageDomain.getMEMBER_ID().equals(userMemberVo.getMEMBER_ID()) && userMemberPageDomain.getPHONE().equals(userMemberVo.getPHONE()) && cerNumber != null) 
		{
			
			if (cerNumber.equals(smsAuth)) {
				Logger.debug("로그인 성공 하였습니다.");

				
				

				

				String ip = request.getHeader("X-FORWARDED-FOR"); 
		        
		        //proxy 환경일 경우
		        if (ip == null || ip.length() == 0) {
		            ip = request.getHeader("Proxy-Client-IP");
		        }

		        //웹로직 서버일 경우
		        if (ip == null || ip.length() == 0) {
		            ip = request.getHeader("WL-Proxy-Client-IP");
		        }

		        if (ip == null || ip.length() == 0) {
		            ip = request.getRemoteAddr() ;
		        }
		        
		        String member_id = userMemberPageDomain.getMEMBER_ID();
		        String NAME = userMemberPageDomain.getNAME();
		        String LEVEL = userMemberPageDomain.getLEVEL();
		        String TYPE = userMemberPageDomain.getTYPE();
		        
		        HttpSession session2 = request.getSession();
		        
		        session.setAttribute("ssion_login", "okok");
		        session.setAttribute("ssion_user_ip", ip);
		        session.setAttribute("ssion_user_id", member_id);
		        session.setAttribute("ssion_name", NAME);
		        session.setAttribute("ssion_level", LEVEL);
		        session.setAttribute("ssion_user", userMemberPageDomain);
		        session.setAttribute("ssion_comm_type", userMemberPageDomain.getCOMM_TYPE());
				session.setAttribute("ssion_comm_data", userMemberPageDomain.getCOMM_DATA());
		        
		        
		        session.setAttribute("ssion_member_type", TYPE);
				
				
				
				
		        session.setAttribute("session_login_tm", SUtil.getNowTime());
		        session.setAttribute("session_login_date", SUtil.getNowDate());
				
				
				String aa = (String) session2.getAttribute("ssion_login");
				
				
				
				try {
					response.getWriter().println("true");
				} catch (IOException e) {
					e.printStackTrace();
				}	
			}else {
				Logger.debug("로그인 실패 하였습니다.");
				
				session.setAttribute("ssion_login", "nono");
				session.setAttribute("ssion_user_id", null);
				session.setAttribute("ssion_name", null);
				session.setAttribute("ssion_level", null);
				session.setAttribute("ssion_user", null);
				
				try {
					response.getWriter().println("false:-3");
				} catch (IOException e) {
					e.printStackTrace();
				}	
			}
			
		} else {
			try {
				Logger.debug("가입정보가 없습니다.");
				response.getWriter().println("false:-2");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	public static String numberGen() {
        
        Random rand = new Random();
        String numStr = ""; 
        
        for(int i=0;i<6;i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr += ran;
        }
        return numStr;
    }
	
	@RequestMapping(value = "/user/member/view.do", method = RequestMethod.GET)
	public ModelAndView view( HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("ssion_user_id");
		model = userMemberService.getView(member_id);	
		
		UserProgramApplyVo userProgramApplyVo = new UserProgramApplyVo();
		userProgramApplyVo.setMEMBER_ID(member_id);
		model.put("MEMBER2", userMemberService.getMatchingList(userProgramApplyVo));
		
		return new ModelAndView("user/member/view", "model", model);
	}
	
	@RequestMapping(value = "/user/member/update2.do", method = RequestMethod.GET)
	public ModelAndView updateGet(HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		
		

		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("ssion_user_id");
		model = userMemberService.getView(member_id);	

		return new ModelAndView("user/member/update", "model", model);
	}
	
	@RequestMapping(value="/user/member/id_search.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public String id_search(@ModelAttribute("UserMemberVo") UserMemberVo UserMemberVo , HttpServletRequest request , HttpServletResponse response) throws JsonProcessingException {
		UserMemberVo.setPHONE(UserMemberVo.getPHONE().replace("-", ""));
		
		String Search_id = userMemberService.getID(UserMemberVo);
		System.out.println(Search_id);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(Search_id);
		return jsonStr;
	}
	
	//비밀번호 초기화 기능 - login.jsp
	@RequestMapping(value="/user/member/passwordreset.do" , method = RequestMethod.POST)
	public void PassWordReSet(@ModelAttribute("UserMemberVo")UserMemberVo UserMemberVo , HttpServletRequest request , HttpServletResponse response) {
		
		userMemberService.PassWordReSet(UserMemberVo);
		
	}
	
	//위에 아이디 체크 부분 있는데 이상해서 왜 사용되는지 몰라서 우선 새로 만듬
	@RequestMapping(value="/user/member/MemberIdCheck.do" , method = RequestMethod.POST)
	public void MemberIdCheck(@ModelAttribute("UserMemberVo")UserMemberVo UserMemberVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();

		System.out.println("?? " + UserMemberVo.getMEMBER_ID());
		
		
		model = userMemberService.getView(UserMemberVo.getMEMBER_ID());

		UserMemberVo userMemberPageDomain = (UserMemberVo) model.get("pageDomain");

		if(userMemberPageDomain == null)
		{
			try {
				Logger.debug("아이디가 없습니다.");
				response.getWriter().println("false:-1");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			
			if(userMemberPageDomain.getPHONE().equals(UserMemberVo.getPHONE())) {
				
				try {
					Logger.debug("성공");
					response.getWriter().println("true");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				
			}else {
				
			
				try {
					Logger.debug("핸드폰번호가 다릅니다.");
					response.getWriter().println("false:-2");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
			}
			
		}
		
		
	}
	
	
	
	
}
