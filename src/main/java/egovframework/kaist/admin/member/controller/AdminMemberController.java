package egovframework.kaist.admin.member.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ibatis.sqlmap.engine.scope.SessionScope;
import com.system.util.SUtil;

import egovframework.kaist.admin.buseo.service.AdminBuseoService;
import egovframework.kaist.admin.config.model.AdminConfigVo;
import egovframework.kaist.admin.config.service.AdminConfigService;
import egovframework.kaist.admin.matching.model.AdminMatchingVo;
import egovframework.kaist.admin.matching.service.AdminMatchingService;
import egovframework.kaist.admin.member.model.AdminMemberVo;
import egovframework.kaist.admin.member.service.AdminMemberService;

@Controller
public class AdminMemberController {

	@Autowired
	AdminMemberService adminMemberService;

	@Autowired
	AdminBuseoService adminBuseoService;
	
	@Autowired
	AdminConfigService adminConfigService;
	
	@Autowired
	AdminMatchingService adminMathingService;
	

	private static final Logger Logger = LoggerFactory.getLogger(AdminMemberController.class);

	
	@RequestMapping(value = { "/admin/member/info_agreement/insert.do" }, method = RequestMethod.GET)
	public ModelAndView info_agreement(
			@ModelAttribute("AdminConfigVo") AdminConfigVo adminConfigVo,
			HttpServletRequest request, HttpServletResponse response) {

		ModelMap model = new ModelMap();
		adminConfigVo.setKEY("INFO_AGREEMENT");
		model = adminConfigService.getList(adminConfigVo);
		List list = (List) model.get("list");
		String data = ""; 
				
		if(list.size()>0)
		{
			HashMap map = (HashMap) list.get(0);
			data = (String) map.get("DATA");
		}
		model.put("DATA", data);

		return new ModelAndView("admin/member/info_agreement", "model", model);
	}
	@RequestMapping(value = { "/admin/member/info_agreement/insert.do" }, method = RequestMethod.POST)
	public String info_agreementPost(
			@ModelAttribute("AdminConfigVo") AdminConfigVo adminConfigVo, 
			HttpServletRequest request, HttpServletResponse response) {

		ModelMap model = new ModelMap();

		adminConfigVo.setKEY("INFO_AGREEMENT");
		adminConfigVo.setNAME("개인정보수집이용동의서");
		
		adminConfigService.setUpdate(adminConfigVo);

		
		return "redirect:./insert.do";
	}
	
		
	@RequestMapping(value = { "/login.do", "admin/member/login.do" }, method = RequestMethod.POST)
	public void loginPost(@ModelAttribute("AdminMemberVo") AdminMemberVo adminMemberVo, 
			HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		model = adminMemberService.getView(adminMemberVo.getMEMBER_ID());

		AdminMemberVo adminMemberPageDomain = (AdminMemberVo) model.get("pageDomain");

		if(adminMemberPageDomain == null)
		{
			try {
				Logger.debug("아이디가 없습니다.");
				response.getWriter().println("false:-2");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if (adminMemberPageDomain.getMEMBER_ID().equals(adminMemberVo.getMEMBER_ID())) 
		{
			String pwd = SUtil.getSHA256(adminMemberVo.getPASSWORD());
			System.out.println("nks pwd : " + pwd);
			System.out.println("nks2pwd : " + adminMemberPageDomain.getPASSWORD());
			
			
			if (pwd.equals(adminMemberPageDomain.getPASSWORD())) {
				if(adminMemberPageDomain.getLEVEL().equals("1"))
				{
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
			        String clientIp = ip;
			    	
					session.setAttribute("ssion_user_ip", ip);
					session.setAttribute("ssion_user_id", adminMemberPageDomain.getMEMBER_ID());
					session.setAttribute("ssion_name", adminMemberPageDomain.getNAME());
					session.setAttribute("ssion_level", adminMemberPageDomain.getLEVEL());
					session.setAttribute("ssion_user", adminMemberPageDomain);
					session.setAttribute("session_login_tm", SUtil.getNowTime());
					session.setAttribute("session_login_date", SUtil.getNowDate());
					
					

					//adminMemberService.setMemberLogin(adminMemberPageDomain.getMEMBER_ID());
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
				//adminMemberService.setMemberLoginFail(adminMemberPageDomain.getMEMBER_ID());
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

	@RequestMapping(value = { "/admin/member/login.do", "/admin/member/logout.do" }, method = RequestMethod.GET)
	public ModelAndView loginGet(HttpServletRequest request, HttpServletResponse response) {

		ModelMap model = new ModelMap();

		HttpSession session = request.getSession();

		session.setAttribute("ssion_login", "nono");
		session.setAttribute("ssion_user_id", null);
		session.setAttribute("ssion_name", null);
		session.setAttribute("ssion_level", null);
		session.setAttribute("ssion_user", null);
		session.setAttribute("ssion_member_type", null);
		
		
		
		return new ModelAndView("user/member/login", "model", model);
	}

	/*회원 그룹 관리 - 모든 회원*/
	@RequestMapping(value = "/admin/member/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("AdminMemberVo") AdminMemberVo adminMemberVo,
			HttpServletRequest request, HttpServletResponse response) {

		System.out.println("zzzzzzdsadsasaddas");
		
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
		

		adminMemberVo.setPAGE(Integer.parseInt(PAGE));
		adminMemberVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = adminMemberVo.getPAGE() * adminMemberVo.getITEM_COUNT();
		
		adminMemberVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		adminMemberVo.setOFFSET(pagelimit);
		
		
		//지역별 관리자 확인 1.session에 지역확인 2.sutil 에 저장된 배열 받기(지역관리)
		HttpSession session = request.getSession();
		
		if(session.getAttribute("ssion_local_type") != null && session.getAttribute("ssion_local_type") != "전체") {
			
			System.out.println(session.getAttribute("ssion_local_type"));
			
			String LOCAL = (String) session.getAttribute("ssion_local_type");
			System.out.println(LOCAL);
			
			List <String> LO_TYPE = SUtil.getLO_TYPE_LIST(LOCAL);
			
			adminMemberVo.setLO_LIST(LO_TYPE);
			
			adminMemberVo.setLO_TYPE("TRUE");
			
		}
		
		model = adminMemberService.getList(adminMemberVo);
		
		model.put("SEARCH_TYPE", adminMemberVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", adminMemberVo.getSEARCH_TEXT());
		
		model.put("beforeDomain", adminMemberVo);
		
		//model.put("ADVISER", adminMemberService.getAdviserALL());
		
		return new ModelAndView("admin/member/list", "model", model);
	}

	
	/*학생부 관리 - 모든 학생*/
	@RequestMapping(value="/admin/member/allstudentlist.do" , method = RequestMethod.GET)
	public ModelAndView AllStudentList(@ModelAttribute("AdminMemberVo") AdminMemberVo adminMemberVo,
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
		

		adminMemberVo.setPAGE(Integer.parseInt(PAGE));
		adminMemberVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = adminMemberVo.getPAGE() * adminMemberVo.getITEM_COUNT();
		
		adminMemberVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		adminMemberVo.setOFFSET(pagelimit);
		
		adminMemberVo.setTYPE("1");
		
		//지역별 관리자 확인 1.session에 지역확인 2.sutil 에 저장된 배열 받기(지역관리)
		HttpSession session = request.getSession();
		
		if(session.getAttribute("ssion_local_type") != null && session.getAttribute("ssion_local_type") != "전체") {
			
			System.out.println(session.getAttribute("ssion_local_type"));
			
			String LOCAL = (String) session.getAttribute("ssion_local_type");
			System.out.println(LOCAL);
			
			List <String> LO_TYPE = SUtil.getLO_TYPE_LIST(LOCAL);
			
			adminMemberVo.setLO_LIST(LO_TYPE);
			
			adminMemberVo.setLO_TYPE("TRUE");
			
		}
		
		model = adminMemberService.getList(adminMemberVo);
		
		model.put("SEARCH_TYPE", adminMemberVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", adminMemberVo.getSEARCH_TEXT());
		
		model.put("beforeDomain", adminMemberVo);
		
		//model.put("ADVISER", adminMemberService.getAdviserALL());
		
		return new ModelAndView("admin/member/allstudentlist", "model", model);
	}
	
	
	/*학적부 관리 - 당해 학생*/
	@RequestMapping(value="/admin/member/studentrecordlist.do" , method = RequestMethod.GET)
	public ModelAndView StudentRecordList(@ModelAttribute("AdminMemberVo") AdminMemberVo adminMemberVo,
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
		

		adminMemberVo.setPAGE(Integer.parseInt(PAGE));
		adminMemberVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = adminMemberVo.getPAGE() * adminMemberVo.getITEM_COUNT();
		
		adminMemberVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		adminMemberVo.setOFFSET(pagelimit);
		
		adminMemberVo.setTYPE("1");
		adminMemberVo.setEXP_DATA(adminMemberVo.getYEAR().substring(2,4));
		
		//지역별 관리자 확인 1.session에 지역확인 2.sutil 에 저장된 배열 받기(지역관리)
		HttpSession session = request.getSession();
		
		if(session.getAttribute("ssion_local_type") != null && session.getAttribute("ssion_local_type") != "전체") {
			
			System.out.println(session.getAttribute("ssion_local_type"));
			
			String LOCAL = (String) session.getAttribute("ssion_local_type");
			System.out.println(LOCAL);
			
			List <String> LO_TYPE = SUtil.getLO_TYPE_LIST(LOCAL);
			
			adminMemberVo.setLO_LIST(LO_TYPE);
			
			adminMemberVo.setLO_TYPE("TRUE");
			
		}
		
		model = adminMemberService.getList(adminMemberVo);
		
		model.put("SEARCH_TYPE", adminMemberVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", adminMemberVo.getSEARCH_TEXT());
		
		model.put("beforeDomain", adminMemberVo);
		
		//model.put("ADVISER", adminMemberService.getAdviserALL());
		
		return new ModelAndView("admin/member/studentrecordlist", "model", model);
	}
	
	/*멘토 관리 - 당해 멘토*/
	@RequestMapping(value="/admin/member/mentolist.do" , method = RequestMethod.GET)
	public ModelAndView MentoList(@ModelAttribute("AdminMemberVo") AdminMemberVo adminMemberVo,
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
		

		adminMemberVo.setPAGE(Integer.parseInt(PAGE));
		adminMemberVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = adminMemberVo.getPAGE() * adminMemberVo.getITEM_COUNT();
		
		adminMemberVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		adminMemberVo.setOFFSET(pagelimit);
		
		adminMemberVo.setTYPE("2");
		adminMemberVo.setEXP_DATA(adminMemberVo.getYEAR().substring(2,4));
		
		//지역별 관리자 확인 1.session에 지역확인 2.sutil 에 저장된 배열 받기(지역관리)
		HttpSession session = request.getSession();
		
		if(session.getAttribute("ssion_local_type") != null && session.getAttribute("ssion_local_type") != "전체") {
			
			System.out.println(session.getAttribute("ssion_local_type"));
			
			String LOCAL = (String) session.getAttribute("ssion_local_type");
			System.out.println(LOCAL);
			
			List <String> LO_TYPE = SUtil.getLO_TYPE_LIST(LOCAL);
			
			adminMemberVo.setLO_LIST(LO_TYPE);
			
			adminMemberVo.setLO_TYPE("TRUE");
			
		}
		
		model = adminMemberService.getList(adminMemberVo);
		
		model.put("SEARCH_TYPE", adminMemberVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", adminMemberVo.getSEARCH_TEXT());
		
		model.put("beforeDomain", adminMemberVo);
		
		//model.put("ADVISER", adminMemberService.getAdviserALL());
		
		return new ModelAndView("admin/member/mentolist", "model", model);
	}
	
	/*
	@RequestMapping(value = "/admin/member/idCheck.do", method = RequestMethod.GET)
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
			ModelMap model2 = adminMemberService.getView(MEMBER_ID);
			AdminMemberVo vo = (AdminMemberVo) model2.get("pageDomain");
		
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
	
	/*강사 관리 - 년도별 (처음엔 해당 년도로 이동)*/
	@RequestMapping(value="/admin/CommMentoList.do" , method = RequestMethod.GET)
	public ModelAndView CommMentoListGet(@ModelAttribute("AdminMemberVo")AdminMemberVo AdminMemberVo , HttpServletRequest request , HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();
		
		return new ModelAndView("admin/member/insert" , "model" , model);
	}
	
	@RequestMapping(value = "/admin/member/insert.do", method = RequestMethod.GET)
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
		
		return new ModelAndView("admin/member/insert", "model", model);
	}

	@RequestMapping(value = "/admin/member/insert.do", method = RequestMethod.POST)
	public String insertPost(@ModelAttribute("AdminMemberVo") AdminMemberVo adminMemberVo,
			MultipartHttpServletRequest  request,  HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		if(!adminMemberVo.getPASSWORD().equals(""))
		{
			adminMemberVo.setPASSWORD(SUtil.getSHA256(adminMemberVo.getPASSWORD()));	
		}
		
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/member/";
		 
		String filename = SUtil.setFileUpload(request, drv);

	
		
		adminMemberVo.setIMAGE(filename);
		
		int rtn = adminMemberService.setInsert(adminMemberVo);

		
		return "redirect:list.do";
		
		
	}
	
	
	@RequestMapping(value = "/admin/member/{memberid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("memberid") String memberid, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		
		model = adminMemberService.getView(memberid);
	
		
		
		return new ModelAndView("admin/member/update", "model", model);
	}
	@RequestMapping(value = "/admin/member/{memberid}/infoPdf.do", method = RequestMethod.GET)
	public ModelAndView infoPdf(@PathVariable("memberid") String memberid, 
			HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		
		model = adminMemberService.getView(memberid);
	
		
		return new ModelAndView("admin/member/infoPdf", "model", model);
	}
	
	
	
	
	
	
	@RequestMapping(value = "/admin/member/update.do", method = RequestMethod.GET)
	public ModelAndView update( HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		model = adminMemberService.getView(SUtil.getUserId(request));

		model.put("buseo", adminBuseoService.getListAll());
		return new ModelAndView("admin/member/update2", "model", model);
	}
	
	
	@RequestMapping(value = "/admin/member/update.do", method = RequestMethod.POST)
	public String updatePost(@ModelAttribute("AdminMemberVo") AdminMemberVo adminMemberVo, MultipartHttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		
		if(!adminMemberVo.getPASSWORD().equals(""))
		{
			adminMemberVo.setPASSWORD(SUtil.getSHA256(adminMemberVo.getPASSWORD()));	
		}
		
		System.out.println(adminMemberVo.getMEMBER_ID());
		System.out.println(adminMemberVo.getPASSWORD());
		
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/member/";
		 
		String filename = SUtil.setFileUpload(request, drv);

	
		if(filename.length() > 1)
		{
			
			adminMemberVo.setIMAGE(filename);
		}else
		{
			adminMemberVo.setIMAGE("");
		}

		
		boolean rtn = adminMemberService.setUpdate(adminMemberVo);

		
		return "redirect:./"+adminMemberVo.getMEMBER_ID()+"/update.do";
	}

	@RequestMapping(value = "/admin/member/delete.do", method = RequestMethod.POST)
	public void deletePost(@ModelAttribute("AdminMemberVo") AdminMemberVo adminMemberVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String year = request.getParameter("year") != null ? request.getParameter("year") : "";
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		boolean rtn = adminMemberService.setDelete(adminMemberVo);
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
				e.printStackTrace();
			}
		}
	}

	@RequestMapping(value = "/admin/member/idCheck.do", method = RequestMethod.GET)
	public void idCheck(@ModelAttribute("AdminMemberVo") AdminMemberVo adminMemberVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String MEMBER_ID = request.getParameter("MEMBER_ID") != null ? request.getParameter("MEMBER_ID") : "";

		boolean rtn = adminMemberService.getMemberIdCheck(MEMBER_ID);
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

	@RequestMapping(value = "/admin/member/excel.do", method = RequestMethod.GET)
	public ModelAndView excelGet(HttpServletRequest request, HttpServletResponse response) {

		ModelMap model = new ModelMap();

		return new ModelAndView("admin/member/excel", "model", model);
	}
	

	@RequestMapping(value = "/admin/member/excelMemberUpload.do", method = RequestMethod.POST)
	public String excelPost(MultipartHttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+request.getContextPath()+"/upload/member/";
		System.out.println(drv);
		String filename = SUtil.setFileUpload(request, drv);
		
		
		filename = URLDecoder.decode(filename, "utf-8");  
		
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
                    AdminMemberVo vo = new AdminMemberVo();
                    //48위 항목 48개 여서 47까지
                    for (int columnIndex = 0; columnIndex <= 47; columnIndex++)
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
                        	vo.setMEMBER_ID(value);
                        }
                        else if(columnIndex == 1)
                        {
                        	value = SUtil.getSHA256(value);
                        	vo.setPASSWORD(value);
                        }
                        else if(columnIndex == 2)
                        {
                        	vo.setNAME(value);
                        }else if(columnIndex == 3)
                        {
                        	value = value.replace("-", "");
                        	vo.setPHONE(value);
                        }
                        else if(columnIndex == 4)
                        {
                        	vo.setEMAIL(value);
                        }else if(columnIndex == 5)
                        {
                        	vo.setLEVEL(value);
                        }
                        else if(columnIndex == 6)
                        {
                        	vo.setJOIN_TM(value);
                        }else if(columnIndex == 7)
                        {
                        	vo.setCREATE_TM(value);
                        }
                        else if(columnIndex == 8)
                        {
                        	vo.setTYPE(value);
                        }else if(columnIndex == 9)
                        {
                        	vo.setTYPE_SUB(value);
                        }
                        else if(columnIndex == 10)
                        {
                        	vo.setNAME_ENG(value);	
                        }else if(columnIndex == 11)
                        {
                        	vo.setNAME_HANJA(value);	
                        }
                        else if(columnIndex == 12)
                        {
                        	vo.setIMAGE(value);
                        }else if(columnIndex == 13)
                        {
                        	vo.setADDRESS_LOCAL(value);	
                        }
                        else if(columnIndex == 14)
                        {
                        	vo.setSCHOOL_NAME(value);	
                        }else if(columnIndex == 15)
                        {
                        	vo.setSCHOOL_TYPE(value);	
                        }
                        else if(columnIndex == 16)
                        {
                        	vo.setSCHOOL_YEAR(value);	
                        }else if(columnIndex == 17)
                        {
                        	vo.setSCHOOL_GROUP(value);
                        }
                        else if(columnIndex == 18)
                        {
                        	vo.setBIRTH(value);	
                        }else if(columnIndex == 19)
                        {
                        	vo.setSEX(value);
                        }
                        else if(columnIndex == 20)
                        {
                        	vo.setSCHOOL_ZIPCODE(value);	
                        } else if(columnIndex == 21)
                        {
                        	vo.setSCHOOL_ADDRESS(value);	
                        }
                        else if(columnIndex == 22)
                        {
                        	vo.setSCHOOL_ADDRESS_DETAIL(value);	
                        }else if(columnIndex == 23)
                        {
                        	vo.setSUPPORT_AREA(value);
                        }
                        else if(columnIndex == 24)
                        {
                        	vo.setZIPCODE(value);
                        	
                        }else if(columnIndex == 25)
                        {
                        	vo.setADDRESS(value);
                        }
                        else if(columnIndex == 26)
                        {
                        	vo.setADDRESS_DETAIL(value);
                        }else if(columnIndex == 27)
                        {
                        	vo.setPARENTS_NAME(value);
                        }
                        else if(columnIndex == 28)
                        {
                        	vo.setPARENTS_RELATION(value);	
                        }else if(columnIndex == 29)
                        {
                        	vo.setPARENTS_PHONE(value);	
                        }
                        else if(columnIndex == 30)
                        {
                        	vo.setPARENTS_PHONE2(value);	
                        }
                        else if(columnIndex == 31)
                        {
                        	vo.setINFO_AGREEMENT(value);	
                        }
                        else if(columnIndex == 32)
                        {
                        	vo.setDORMANCY_TM(value);	
                        }else if(columnIndex == 33)
                        {
                        	vo.setLOGIN_TM(value);	
                        }
                        else if(columnIndex == 34)
                        {
                        	vo.setUPDATE_TM(value);	
                        }else if(columnIndex == 35)
                        {
                        	vo.setSTATUS(value);	
                        }
                        else if(columnIndex == 36)
                        {
                        	vo.setSCHOOL_NUMBER(value);	
                        }else if(columnIndex == 37)
                        {
                        	vo.setSCHOOL_JIGGEUB(value);		
                        }
                        else if(columnIndex == 38)
                        {
                        	vo.setTEL(value);	
                        }else if(columnIndex == 39)
                        {
                        	vo.setINFO_AGREEMENT_TM(value);	
                        } else if(columnIndex == 40)
                        {
                        	//vo.setADMIN_AUTH(value);
                        }else if(columnIndex == 41)
                        {
                        	vo.setDORMANCY(value);	
                        }
                        else if(columnIndex == 42)
                        {
                        	vo.setAREA_NUMBER(value);	
                        }else if(columnIndex == 43)
                        {
                        	vo.setSCHOOL_MAJOR(value);		
                        }
                        else if(columnIndex == 44)
                        {
                        	vo.setELIGIBILITY(value);
                        } 
                        else if(columnIndex == 45)
                        {
                        	vo.setEXP(value);
                        }else if(columnIndex == 46)
                        {
                        	vo.setEXP_TYPE(value);
                        }else if(columnIndex == 47)
                        {
                        	vo.setEXP_DATA(value);
                        }
                        
                    }//for cloumn
                    ModelMap model2 = adminMemberService.getView(vo.getMEMBER_ID());
                    
        			AdminMemberVo vo2 = (AdminMemberVo) model2.get("pageDomain");
        			if(vo2 == null )
        			{
        				if(vo.getMEMBER_ID().length() > 3)
        				{
        					adminMemberService.setInsert(vo);
            				System.out.println(vo.getMEMBER_ID() + " 엑셀 회원 추가 : ");	
        				}
        				
        			}else if(vo2.getMEMBER_ID().equals(vo.getMEMBER_ID()))
        			{
        				adminMemberService.setUpdate(vo);
        				System.out.println(vo.getMEMBER_ID() + " 엑셀 회원 업데이트 :  " + vo.getSEX());
        			}else
        			{
        				System.out.println("회원 추가 실패");
        			}
                    
                }//for row
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
		
		
		return "redirect:./list.do";
	}


	
	
	

	@RequestMapping(value = "/admin/member/deleteArr.do", method = RequestMethod.POST)
	public void deleteArrPost(@ModelAttribute("AdminMemberVo") AdminMemberVo adminAgencyVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		String idx = adminAgencyVo.getMEMBER_ID();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				AdminMemberVo userMemberDomain = new AdminMemberVo();
				userMemberDomain.setMEMBER_ID(arrIdx[i]);
				adminMemberService.setDelete(userMemberDomain);		
			}
		}
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	
	@RequestMapping(value = "/admin/member/TypeToTextUpdateArr.do", method = RequestMethod.POST)
	public void statusUpdateArr(@ModelAttribute("AdminMemberVo") AdminMemberVo adminAgencyVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		String idx = adminAgencyVo.getMEMBER_ID();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				AdminMemberVo userMemberDomain = new AdminMemberVo();
				userMemberDomain.setMEMBER_ID(arrIdx[i]);
				userMemberDomain.setSEARCH_TYPE(adminAgencyVo.getSEARCH_TYPE());
				userMemberDomain.setSEARCH_TEXT(adminAgencyVo.getSEARCH_TEXT());
				adminMemberService.setUpdateTypeToText(userMemberDomain);		
			}
		}
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	
	@RequestMapping(value = "/admin/member/human/list.do", method = RequestMethod.GET)
	public ModelAndView human(@ModelAttribute("AdminMemberVo") AdminMemberVo adminMemberVo,
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
		

		adminMemberVo.setPAGE(Integer.parseInt(PAGE));
		adminMemberVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = adminMemberVo.getPAGE() * adminMemberVo.getITEM_COUNT();
		
		adminMemberVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		adminMemberVo.setOFFSET(pagelimit);
		
		adminMemberVo.setDORMANCY("1");
		
		adminMemberVo.setTYPE("");
		
    			
		
		model = adminMemberService.getList(adminMemberVo);
		
		model.put("SEARCH_TYPE", adminMemberVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", adminMemberVo.getSEARCH_TEXT());
		
		if(adminMemberVo.getSTART_TM().equals(""))
		{
			adminMemberVo.setSTART_TM(SUtil.getNowDate());	
		}
		if(adminMemberVo.getEND_TM().equals(""))
		{
			adminMemberVo.setEND_TM(SUtil.getNowDate());	
		}
		
		model.put("beforeDomain", adminMemberVo);

		
		return new ModelAndView("admin/member/human/list", "model", model);
	}
	
	@RequestMapping(value = "/admin/member/{type}/excelDown.do", method = RequestMethod.GET)
	public void excelDown(@PathVariable("type") String type, HttpServletRequest request, HttpServletResponse response)
	{
		
		String MEMBER_ID = request.getParameter("MEMBER_ID") != null ? request
				.getParameter("MEMBER_ID") : "";
				

   	    // 게시판 목록조회
		ModelMap map = null;
		
		if(MEMBER_ID.equals(""))
		{
			if(type.equals("human"))
			{
				map = adminMemberService.getListAllHuman();
			}else
			{
				map = adminMemberService.getListAll();
			}
			
		}else
		{
			MEMBER_ID = MEMBER_ID.substring(0, MEMBER_ID.length()-1);
			map = adminMemberService.getListMemberIdIn(MEMBER_ID);
		}
				
		List<HashMap> list = (List<HashMap>) map.get("list");

	    // 워크북 생성
	    Workbook wb = new HSSFWorkbook();

	    Sheet sheet = wb.createSheet("학생리스트");
	    
	    Sheet sheet2 = wb.createSheet("교사리스트");

	    Row row = null;
	    
	    Row row2 = null;

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
	    cell.setCellValue("아이디");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("학생명");

	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("시도명");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("학교급");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("학교명");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("학년");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("반");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("생년월일");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("성별");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("우편번호(학교)");

	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("주소(학교)");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("휴대폰");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("이메일");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("지원영역");
	    
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("우편번호(집)");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("주소(집)");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("보호자 성명");

	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("학생과의 관계");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("보호자 연락처");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("보호자 휴대폰");
	    
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("지원 자격");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("영재 교육 경험 여부");
	    
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("영재 교육 경험 종류");
	    
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("영재 교육 참여 기간");
	    
	    

	    
	    
	    
		
	    
	    
	    
	    
	    columnCnt = 0;
	    
	    row2 = sheet2.createRow(rowNo2++);

	    cell = row2.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("아이디");
	    
	    cell = row2.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("이름");

	    
	    cell = row2.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("시도명");
	    
	    cell = row2.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("소속학교명");
	    
	    cell = row2.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("직급");
	    
	    cell = row2.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("생년월일");
	    
	    cell = row2.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("성별");
	    
	    cell = row2.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("우편번호(학교)");

	    
	    cell = row2.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("주소(학교)");

	    cell = row2.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("연락처");
	    
	    cell = row2.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("휴대폰");
	    
	    cell = row2.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("이메일");
	    
	    cell = row2.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("지원영역");

	    cell = row2.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("전공");
	    
	    
	  
		

	    for(int i = 0; i < list.size(); i++ )
	    {
	    	System.out.println("----excel --- + " + i + " / " + list.size());
	    	 
	    	HashMap tempMap = list.get(i);
	    	
	    	if(type.equals("INFO_AGREEMENT"))
	    	{
	    		String temp = tempMap.get("MEMBER_ID")+"";
	    		if(!temp.equals("1"))
	    		{
	    			continue;
	    		}
	    	}
	    	if(i == 237)
	    	{
	    		System.out.println("aa");
	    	}
	    	String type2 = "";
	    	try {
	    		type2 = tempMap.get("TYPE") +"";
	    	}catch(java.lang.NullPointerException e)
	    	{
	    		;
	    	}
	    	if(type2 == null || type2.equals("") || type2.equals("null"))
	    	{
	    		continue;
	    	}
	    	if(type2.equals("1"))
	    	{
	    		columnCnt = 0;
	    	    row = sheet.createRow(rowNo++);

	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("MEMBER_ID")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("NAME")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("ADDRESS_LOCAL")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOT_TYPE")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_NAME")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    
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
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_GROUP")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("BIRTH")+"");
	    	    
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SEX")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_ZIPCODE")+"");

	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_ADDRESS")+"" + "SCHOOL_ADDRESS_DETAIL");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("PHONE")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("EMAIL")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SUPPORT_AREA")+"");
	    	    
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("ZIPCODE")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("ADDRESS")+""+tempMap.get("ADDRESS_DETAIL")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("PARENTS_NAME")+"");

	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("PARENTS_RELATION")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("PARENTS_PHONE")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("PARENTS_PHONE2")+"");
	    	    
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("ELIGIBILITY")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("EXP")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("EXP_TYPE")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("EXP_DATA")+"");
	    	    

	    	}else if(tempMap.get("TYPE").equals("2"))
	    	{
	    		columnCnt = 0;
	    	    row2 = sheet2.createRow(rowNo2++);


	    	    cell = row2.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("MEMBER_ID")+"");
	    	    
	    	    cell = row2.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("NAME")+"");


	    	    
	    	    cell = row2.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("ADDRESS_LOCAL")+"");
	    	    
	    	    cell = row2.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_NAME")+"");
	    	    
	    	    cell = row2.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_JIGGEUB")+"");
	    	    
	    	    cell = row2.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("BIRTH")+"");
	    	    
	    	    cell = row2.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SEX")+"");
	    	    
	    	    cell = row2.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_ZIPCODE")+"");

	    	    
	    	    cell = row2.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_ADDRESS")+""+tempMap.get("SCHOOL_ADDRESS_DETAIL"));

	    	    cell = row2.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("TEL")+"");
	    	    
	    	    cell = row2.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("PHONE")+"");
	    	    
	    	    cell = row2.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("EMAIL")+"");
	    	    
	    	    cell = row2.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SUPPORT_AREA")+"");
	    	    
	    	    cell = row2.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_MAJOR")+"");
	    	    
	    	    
	    	}
	    	System.out.println("----excel --- + " + i);
	    	
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
	
	@RequestMapping(value = "/admin/member/schoolNumberUpdate.do", method = RequestMethod.GET)
	public void schoolNumberUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		
		adminMemberService.setUpdateShoolNumber();
		response.getWriter().print("true");
		
	}
	@RequestMapping(value = "/admin/member/info_AgreementUpdate.do", method = RequestMethod.GET)
	public void info_AgreementUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		
		adminMemberService.setInfo_AgreementUpdate();
		response.getWriter().print("true");
		
	}
	
	@RequestMapping(value = "/admin/member/comparing.do" , method = RequestMethod.POST)
	public String comparing(MultipartHttpServletRequest request, HttpServletResponse response)throws UnsupportedEncodingException {
		String drv = request.getRealPath("");
		
		
		drv = drv.substring(0, drv.length()) + "./resources"+request.getContextPath()+"/upload/excelupload/";
		
		System.out.println(drv);
		
		String filename = SUtil.setFileUpload(request, drv);
		
		int student_idx = 20210000;
		int mento_idx = 20210000;
		int student_num = 0;
    	int mento_num = 0;
		
		System.out.println("=====1=====");
		filename = URLDecoder.decode(filename, "utf-8");  
		
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
                	String ph = "";
                	String clss = "";
                    int cells = row.getPhysicalNumberOfCells();
                    AdminMemberVo vo = new AdminMemberVo();
                    for (int columnIndex = 0; columnIndex <= 9; columnIndex++)
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
                        	if(value.equals("학생")){
                        		clss = "학생";
                        		vo.setLEVEL("11");
                        		vo.setTYPE("1");
                        	}else if(value.equals("교사")){
                        		clss = "교사";
                        		vo.setLEVEL("8");
                        		vo.setTYPE("2");
                        	}
                        	;
                        }else if(columnIndex == 1) {
                        	vo.setNAME(value);
                        	System.out.println(value);
                        }else if(columnIndex == 2) {
                        	if(value.equals("-")) {
                        		ph = "no";
                        	}else if(value.equals("")) {
                        		ph = "no";
                        	}else if(value.equals(null)) {
                        		ph = "no";
                        	}else {
                        		value = "0" + value;
                        		vo.setPHONE(value);
                        		value = value.substring(value.length() - 8 , value.length());
                        		value = SUtil.getSHA256(value);
                            	vo.setPASSWORD(value);
                        	}
                        }else if(columnIndex == 3) {
                        	if(ph.equals("no")) {
                        		value = "0" + value;
                        		vo.setPHONE(value);
                        		value = value.substring(value.length() - 8 , value.length());
                        		value = SUtil.getSHA256(value);
                            	vo.setPASSWORD(value);
                        	};
                        }else if(columnIndex == 4) {
							if(clss.equals("학생")) {
								vo.setADDRESS(value);                       		
                        	}
                        }else if(columnIndex == 5) {
                        	vo.setSCHOOL_TYPE(value);
                        }else if(columnIndex == 6) {
                        	if(clss.equals("학생")) {
                        		if(vo.getSCHOOL_TYPE().equals("초등학교")) {
                        			value = value.substring(0 , 1);
                        			vo.setSCHOOL_YEAR(value);
                        		}else if(vo.getSCHOOL_TYPE().equals("중학교")) {
                        			value = value.substring(0,1);
                        			int year = Integer.parseInt(value);
                        			year = year + 6;
                        			value = Integer.toString(year);
                        			vo.setSCHOOL_YEAR(value);
                        			
                        		}else if(vo.getSCHOOL_TYPE().equals("고등학교")) {
                        			value = value.substring(0,1);
                        			int year = Integer.parseInt(value);
                        			year = year + 9;
                        			value = Integer.toString(year);
                        			vo.setSCHOOL_YEAR(value);
                        			
                        		}
                        	}
                        }else if(columnIndex == 7) {
                        	vo.setSCHOOL_NAME(value);
                        }else if(columnIndex == 8) {
                        	if(clss.equals("학생")) {
								vo.setELIGIBILITY(value);                       		
                        	}
                        }else if(columnIndex == 9) {
                        	if(clss.equals("학생")) {
								vo.setSUPPORT_AREA(value);
                        	}
                        }
                    }//for cloumn
                    System.out.println("====2====");
                    ModelMap model2 = adminMemberService.getCheckView(vo);
                    
        			AdminMemberVo vo2 = (AdminMemberVo) model2.get("pageDomain");
        			if(vo2 == null )
        			{
        				if(clss.equals("학생")) {
        					int student_id = student_idx + 1000 + student_num;
        					student_num = student_num + 1;
        					System.out.println(student_num);
        					String student_ID = Integer.toString(student_id);
        					vo.setMEMBER_ID(student_ID);
        					vo.setEXP_DATA("21");
        					adminMemberService.setInsert(vo);
        					//adminMemberService.setInsert(vo);
            				//System.out.println(vo.getMEMBER_ID() + " 엑셀 회원 추가 : ");	
        				}else if(clss.equals("교사")) {
        					int mento_id = mento_idx + 2000 + mento_num;
        					mento_num = mento_num + 1;
        					String mento_ID = Integer.toString(mento_id);
        					vo.setMEMBER_ID(mento_ID);
        					vo.setEXP_DATA("21");
        					adminMemberService.setInsert(vo);
        					//adminMemberService.setInsert(vo);
            				//System.out.println(vo.getMEMBER_ID() + " 엑셀 회원 추가 : ");	
        				}
        				
        			}else
        			{
        				vo.setTEST("업데이트");
        				vo2.setSCHOOL_NAME(vo.getSCHOOL_NAME());
        				vo2.setSCHOOL_TYPE(vo.getSCHOOL_TYPE());
        				vo2.setSCHOOL_YEAR(vo.getSCHOOL_YEAR());
        				vo2.setELIGIBILITY(vo.getELIGIBILITY());
        				//adminMemberService.setUpdate(vo);
        				vo2.setEXP_DATA("20,21");
        				adminMemberService.setUpdate(vo2);
        				//System.out.println(vo.getMEMBER_ID() + " 엑셀 회원 업데이트 :  " + vo.getSEX());
        			}
                    
                }//for row
                
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
		
		
		return "redirect:./list.do";
	}
	
	
	
	@RequestMapping(value = "/admin/member/matching.do" , method = RequestMethod.POST)
	public String matching(MultipartHttpServletRequest request, HttpServletResponse response)throws UnsupportedEncodingException {
		String drv = request.getRealPath("");
		
		
		drv = drv.substring(0, drv.length()) + "./resources"+request.getContextPath()+"/upload/excelupload/";
		
		//System.out.println(drv);
		
		String filename = SUtil.setFileUpload(request, drv);
		
		filename = URLDecoder.decode(filename, "utf-8");  
		
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
                    AdminMatchingVo vo = new AdminMatchingVo();
                    
                    for (int columnIndex = 0; columnIndex <= 9; columnIndex++)
                    {
                    	int schooltype = 0;
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
                        }else if(columnIndex == 1) {
                        	vo.setPROFESSOR_MEMBER_ID(value);
                        }else if(columnIndex == 2) {
                        	vo.setSCHOOL_NAME(value);
                        }else if(columnIndex == 3) {
                        	if(value.equals("초등학교")) {
                        		schooltype = 0;
                        	}else if(value.equals("중학교")) {
                        		schooltype = 6;
                        	}else if(value.equals("고등학교")) {
                        		schooltype = 9;
                        	}
                        }else if(columnIndex == 4) {
                        	value = value.substring(0,1);
                        	int schoolyear = Integer.parseInt(value);
                        	 schoolyear = schooltype + schoolyear;
                        	 value = Integer.toString(schoolyear);
                        	vo.setSCHOOL_YEAR(value);
                        }
                    }//for cloumn
                    
                    vo.setYEAR("2021");
                    ModelMap model2 = adminMathingService.getOneList(vo);
                   
                    AdminMatchingVo vo2 = (AdminMatchingVo) model2.get("pageDomain");
        			
        			if(vo2 == null )
        			{
        				System.out.println(vo.getMEMBER_ID());
        				System.out.println(vo.getPROFESSOR_MEMBER_ID());
        				adminMathingService.setInsert(vo);
        				System.out.println("신규 매칭 = 학생아이디 : "+vo.getMEMBER_ID()+"교사 아이디 :"+vo.getPROFESSOR_MEMBER_ID());
        			}else
        			{
        				adminMathingService.setUpdate(vo);
        				System.out.println("업데이트 매칭 = 학생아이디 : "+vo.getMEMBER_ID()+"교사 아이디 :"+vo.getPROFESSOR_MEMBER_ID());
        				//adminMemberService.setUpdate(vo);
        				//System.out.println(vo.getMEMBER_ID() + " 엑셀 회원 업데이트 :  " + vo.getSEX());
        			}
                    
                }//for row
                
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
		
		
		return "redirect:./list.do";
	}
	
	
}
