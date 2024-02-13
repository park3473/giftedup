package egovframework.kaist.admin.member_re.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.enterprise.inject.Model;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.system.util.SUtil;

import egovframework.kaist.admin.MemberConfigVo;
import egovframework.kaist.admin.buseo.service.AdminBuseoService;
import egovframework.kaist.admin.config.service.AdminConfigService;
import egovframework.kaist.admin.dcmnt.model.DcmntVo;
import egovframework.kaist.admin.dcmnt.service.AdminDcmntService;
import egovframework.kaist.admin.matching.model.AdminMatchingVo;
import egovframework.kaist.admin.member_re.model.AdminDcmntFileVo;
import egovframework.kaist.admin.member_re.model.AdminDcmntVo;
import egovframework.kaist.admin.member_re.model.AdminMemberReVo;
import egovframework.kaist.admin.member_re.service.AdminMemberReService;
import egovframework.kaist.admin.sms_log.service.AdminSmsLogService;
import egovframework.kaist.user.member_re.model.UserMemberReDocumentVo;
import egovframework.kaist.user.member_re.model.UserMemberReVo;

@Controller
public class AdminMemberReController {

	@Autowired
	AdminMemberReService adminMember_reService;

	@Autowired
	AdminDcmntService adminDcmntService;
	
	@Autowired
	AdminBuseoService adminBuseoService;
	
	@Autowired
	AdminConfigService adminConfigService;
	
	@Autowired
	AdminSmsLogService adminSmsLogService;
	
	private static final Logger Logger = LoggerFactory.getLogger(AdminMemberReController.class);
	
	/* 신입생 선발 지원 - 접수자 관리 시작 */
	
	//신입생 선발 지원 리스트 - 접수자 관리
	@RequestMapping(value = "/admin/member_re/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("AdminMember_reVo") AdminMemberReVo adminMember_reVo,
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

		adminMember_reVo.setPAGE(Integer.parseInt(PAGE));
		adminMember_reVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		ModelMap model = new ModelMap();
	
		int pagelimit = adminMember_reVo.getPAGE() * adminMember_reVo.getITEM_COUNT();
		
		adminMember_reVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		adminMember_reVo.setOFFSET(pagelimit);
		
		//지역별 관리자 확인 1.session에 지역확인 2.sutil 에 저장된 배열 받기(지역관리)
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("ssion_local_type") != null && session.getAttribute("ssion_local_type") != "전체") {
			
			String LOCAL = (String) session.getAttribute("ssion_local_type");
			System.out.println(LOCAL);
			
			List <String> LO_TYPE = SUtil.getLO_TYPE_LIST(LOCAL);
			
			adminMember_reVo.setLO_LIST(LO_TYPE);
			
			adminMember_reVo.setLO_TYPE("TRUE");
		
		}
		
		model = adminMember_reService.getList(adminMember_reVo);
		
		
		model.put("SEARCH_TYPE", adminMember_reVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", adminMember_reVo.getSEARCH_TEXT());
		
		model.put("beforeDomain", adminMember_reVo);

		return new ModelAndView("admin/member_re/list", "model", model);
	}

	//신입생 선발 지원 리스트 - 접수자 정보 확인 및 수정 페이지 이동
	@RequestMapping(value="/admin/member_re/update.do" , method = RequestMethod.GET)
	public ModelAndView MemberReUpdateGet(@ModelAttribute("AdminMember_reVo") AdminMemberReVo adminMember_reVo,
			HttpServletRequest request, HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = adminMember_reService.getMemberReView(adminMember_reVo);
		
		model.put("beforeData", adminMember_reVo);
		
		return new ModelAndView("/admin/member_re/update" , "model" , model);
		
	}
	
	//신입생 선발 지원 리스트 - 접수자 정보 수정
	@RequestMapping(value="/admin/member_re/update.do" , method = RequestMethod.POST)
	public void MemberReUpdatePost(@ModelAttribute("AdminMember_reVo")AdminMemberReVo adminMember_reVo , @ModelAttribute("AdminDcmntFileVo")AdminDcmntFileVo AdminDcmntFileVo , HttpServletRequest request , HttpServletResponse response) {
		
		
		adminMember_reService.setMemberReUpdate(adminMember_reVo);
		System.out.println("???---1---");
		AdminDcmntFileVo.setMEMBER_IDX(adminMember_reVo.getIDX());
		AdminDcmntFileVo.setMEMBER_NAME(adminMember_reVo.getNAME());
		System.out.println("???---2---");
		adminMember_reService.setMemberReFileNameChage(AdminDcmntFileVo);
		System.out.println("???---3---");
	}
	
	//신입생 선발 지원 리스트 - 접수자 정보 삭제
	@RequestMapping(value="/admin/member_re/delete.do" , method = RequestMethod.POST)
	public void MemberReDelete(@ModelAttribute("AdminMember_reVo")AdminMemberReVo adminMember_reVo , @ModelAttribute("AdminDcmntFileVo")AdminDcmntFileVo AdminDcmntFileVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminMember_reService.setMemberReDelete(adminMember_reVo);
		
	}
	
	//신입생 선발 지원 리스트 - 접수자 관리 합격 처리
	@RequestMapping(value="/admin/member_re/pass.do" , method = RequestMethod.POST)
	public void MemberRePassPost(@ModelAttribute("AdminMember_reVo")AdminMemberReVo adminMember_reVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminMember_reService.setMemberRePass(adminMember_reVo);
		
	}
	
	//신입생 선발 지원 리스트 - 접수자 관리 합격 처리
	@RequestMapping(value="/admin/member_re/passDown.do" , method = RequestMethod.POST)
	public void MemberRePassDownPost(@ModelAttribute("AdminMember_reVo")AdminMemberReVo adminMember_reVo , HttpServletRequest request , HttpServletResponse response) {
			
		adminMember_reService.setMemberRePassDown(adminMember_reVo);
			
	}
	
	/* 신입생 선발 지원 - 접수자 관리 종료 */
	
	/* 신입생 선발 지원 - 합격자 관리 시작 */
	@RequestMapping(value="/admin/member_re/pass.do" , method =RequestMethod.GET)
	public ModelAndView MemberRePassGet(@ModelAttribute("AdminMember_reVo")AdminMemberReVo adminMember_reVo , HttpServletRequest request , HttpServletResponse response) {
		
		String PAGE = request.getParameter("PAGE") != null ? request
				.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request
				.getParameter("ITEM_COUNT") : "10";
		
		String RESULT = request.getParameter("RESULT") != null ? request.getParameter("RESULT") : "pass" ;
			
		adminMember_reVo.setRESULT(RESULT);
		
		if(PAGE == null)
		{
			PAGE = "0";
		}
		
		if(ITEM_COUNT == null)
		{
			ITEM_COUNT = "10";
		}

		adminMember_reVo.setPAGE(Integer.parseInt(PAGE));
		adminMember_reVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		ModelMap model = new ModelMap();
	
		int pagelimit = adminMember_reVo.getPAGE() * adminMember_reVo.getITEM_COUNT();
		
		adminMember_reVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		adminMember_reVo.setOFFSET(pagelimit);
		
		//지역별 관리자 확인 1.session에 지역확인 2.sutil 에 저장된 배열 받기(지역관리)
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("ssion_local_type") != null && session.getAttribute("ssion_local_type") != "전체") {
			
			String LOCAL = (String) session.getAttribute("ssion_local_type");
			System.out.println(LOCAL);
			
			List <String> LO_TYPE = SUtil.getLO_TYPE_LIST(LOCAL);
			
			adminMember_reVo.setLO_LIST(LO_TYPE);
			
			adminMember_reVo.setLO_TYPE("TRUE");
		
		}
		
		model = adminMember_reService.getList(adminMember_reVo);
		
		
		model.put("SEARCH_TYPE", adminMember_reVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", adminMember_reVo.getSEARCH_TEXT());
		
		model.put("beforeDomain", adminMember_reVo);

		return new ModelAndView("admin/member_re/pass", "model", model);
		
	}
	
	/* 신입생 선발 지원 - 접수자 관리 종료 */
	
	/*서류 관련 부분 시작*/
	
	//서류 관리
	@RequestMapping(value="/admin/member_re/dcmnt.do" , method = RequestMethod.GET)
	public ModelAndView Dcmnt_list(@ModelAttribute("DcmntVo") DcmntVo Dcmnt_Vo, HttpServletRequest request, HttpServletResponse response) {
		ModelMap model = new ModelMap();
		model = adminDcmntService.getDcmntList(Dcmnt_Vo);
		model.put("beforeDomain", Dcmnt_Vo);
		return new ModelAndView("/admin/member_re/dcmnt","model",model);
	}
	
	//서류 리스트 확인
	@RequestMapping(value = "/admin/member_re/Dcmnt_list.do",method = RequestMethod.POST,produces = "application/json; charset=utf8")
	@ResponseBody
	public String dcmnt_list(@ModelAttribute("AdminMemberReVo") AdminMemberReVo adminMember_reVo, HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException{
		
		List<?> checklist = adminDcmntService.getIdxCheck(adminMember_reVo);
		
		if(checklist.size() <= 0) {
			System.out.println(checklist);
			List<AdminDcmntVo> dcmntlist = adminMember_reService.getDcmnt(adminMember_reVo);
			ObjectMapper mapper = new ObjectMapper();
			String jsonStr = mapper.writeValueAsString(dcmntlist);
			return jsonStr;
		}else{
			ObjectMapper mapper = new ObjectMapper();
			String jsonStr = mapper.writeValueAsString(checklist);
			return jsonStr;
		}
	}
	
	
	//서류확인
	@RequestMapping(value = "/admin/member_re/DcmntUpdateArr.do", method = RequestMethod.POST)
	public ModelAndView dcmntUpdateArr(@PathVariable("dcmnt_check") String dcmnt_check, @ModelAttribute("AdminMember_reVo") AdminMemberReVo adminMember_reVo, HttpServletRequest request, HttpServletResponse response) {
			
		ModelMap model = new ModelMap();
		model = adminMember_reService.setDcmntUpdate(dcmnt_check);
		return new ModelAndView("admin/member_re/list", "model", model);
	}
	
	//서류 제출 확인 update
	@RequestMapping(value="/admin/member_re/Dcmnt_result_update.do" , method = RequestMethod.POST)
	public void dcmntresultupdate(@ModelAttribute("DcmntVo") DcmntVo Dcmnt_Vo, HttpServletRequest request, HttpServletResponse response) {
		adminDcmntService.setUpdate(Dcmnt_Vo);
	}
	
	//서류 제출 확인 insert
	@RequestMapping(value="/admin/member_re/Dcmnt_result_insert.do" , method = RequestMethod.POST)
	public void dcmntresultinsert(@ModelAttribute("DcmntVo") DcmntVo Dcmnt_Vo, HttpServletRequest request, HttpServletResponse response) {
		adminDcmntService.setInsert(Dcmnt_Vo);
	}
	
	
	//서류 제출 확인 출력 update
	@RequestMapping(value="/admin/member_re/Dcmnt_result_change.do" , method = RequestMethod.POST)
	public void Dcmnt_result_change(@ModelAttribute("DcmntVo") DcmntVo Dcmnt_Vo, HttpServletRequest request, HttpServletResponse response) {
		adminMember_reService.setDcmntCheck(Dcmnt_Vo);
	}
	
	//제출 서류 다운로드
	@RequestMapping(value="/admin/member_re/FileLinkCheck.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public String AdminMemberReDocumentFileDown(@ModelAttribute("AdminDcmntFileVo")AdminDcmntFileVo AdminDcmntFileVo  , HttpServletRequest  request , HttpServletResponse response) throws JsonProcessingException {
		
		String result = "";
		
		result = adminMember_reService.getFileLinkCheck(AdminDcmntFileVo);
		
		System.out.println("result : " + result);
		
		ObjectMapper mapper = new ObjectMapper();
		
		result = mapper.writeValueAsString(result);
		
		return result;
		
	}
	
	//서류 update
	@ResponseBody
	@RequestMapping(value="/admin/member_re/dcmnt_update.do" , method = RequestMethod.POST)
	public void dcmnt_update(@ModelAttribute("DcmntVo") DcmntVo Dcmnt_Vo, HttpServletRequest request, HttpServletResponse response) {
		adminDcmntService.setDcmntUpdate(Dcmnt_Vo);
	}
	
	//서류 delete
	@ResponseBody
	@RequestMapping(value="/admin/member_re/dcmnt_delete.do" , method = RequestMethod.POST)
	public void dcmnt_delete(@ModelAttribute("DcmntVo") DcmntVo Dcmnt_Vo, HttpServletRequest request, HttpServletResponse response) {
		adminDcmntService.setDcmntDelete(Dcmnt_Vo);
	}
	
	//서류 insert
	@ResponseBody
	@RequestMapping(value="/admin/member_re/dcmnt_insert.do" , method = RequestMethod.POST)
	public void dcmnt_insert(@ModelAttribute("DcmntVo") DcmntVo Dcmnt_Vo, HttpServletRequest request, HttpServletResponse response) {
		adminDcmntService.setDcmntInsert(Dcmnt_Vo);
	}
	
	
	
	/*서류 관련 부분 종료*/
	
	
	/*신입생 선발 설정 관련 시작*/
	
	//신입생 선발 설정 페이지 이동
	@RequestMapping(value="/admin/member_re/config.do" , method = RequestMethod.GET)
	public ModelAndView MemberReConfig(@ModelAttribute("MemberConfigVo")MemberConfigVo MemberConfigVo , HttpServletRequest request , HttpServletResponse response) {
		
		
		
		ModelMap model = new ModelMap();
		model = adminMember_reService.getConfig(MemberConfigVo);
		
		return new ModelAndView("/admin/member_re/config" , "model" , model);
		
	}
	
	//신입생 선발 설정
	@RequestMapping(value="/admin/member_re/config.do" , method = RequestMethod.POST)
	public String MemberReConfigInsert(@ModelAttribute("MemberConfigVo")MemberConfigVo MemberConfigVo , HttpServletRequest request , HttpServletResponse response) {
		
		
		MemberConfigVo.setTYPE("1");
		
		MemberConfigVo.setSTART_TM(request.getParameter("type_1_start_tm"));
		
		MemberConfigVo.setEND_TM(request.getParameter("type_1_end_tm"));
		
		adminMember_reService.setMemberReConfig(MemberConfigVo);
		
		MemberConfigVo.setTYPE("2");
		
		MemberConfigVo.setSTART_TM(request.getParameter("type_2_start_tm"));
		
		MemberConfigVo.setEND_TM(request.getParameter("type_2_end_tm"));
		
		adminMember_reService.setMemberReConfig(MemberConfigVo);
		
		return "redirect:/admin/member_re/config.do?YEAR="+MemberConfigVo.getYEAR()+"";
	}
	
	
	//신입생 선발 설정 중지
	@RequestMapping(value="/admin/member_re/ConfigStat.do" , method = RequestMethod.POST)
	public void SetMemberReConfigStat(@ModelAttribute("MemberConfigVo")MemberConfigVo MemberConfigVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminMember_reService.setConfigStat(MemberConfigVo);
		
	}
	
	
	//신입생 선발 설정 수정
	@RequestMapping(value="/admin/member_re/ConfigUpdate.do" , method = RequestMethod.POST)
	public void SetMemberReConfigUpdate(@ModelAttribute("MemberConfigVo")MemberConfigVo MemberConfigVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminMember_reService.setConfigUpdate(MemberConfigVo);
		
	}
	
	//신입색 선발 설정 삭제
	@RequestMapping(value="/admin/member_re/ConfigDel.do" , method = RequestMethod.POST)
	public void DelMemberReConfig(@ModelAttribute("MemberConfigVo")MemberConfigVo MemberConfigVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminMember_reService.DelConfig(MemberConfigVo);
		
	}
	
	/*신입생 선발 설정 관련 종료*/
	
	//신입생 선발 선정 모듈
	//-------------------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/admin/member_re/PassMemberReUploadProgram.do" , method = RequestMethod.GET)
	public void PassMemberReUploadProgram(@ModelAttribute("AdminMemberReVo")AdminMemberReVo AdminMemberReVo , @ModelAttribute("AdminMatchingVo")AdminMatchingVo AdminMatchingVo , HttpServletRequest request , HttpServletResponse response) {
		
		List<?> list = adminMember_reService.getAllListPass();
		
		
		Date dt = new Date();
		
		int id = dt.getYear() + 1900;
		
		System.out.println(id);
		
		int mento_num = 1;
		
		int student_num = 1;
		
		String MEMBER_ID = "";
		
		for(int i = 0; i < list.size(); i ++) {
		
			HashMap map = (HashMap) list.get(i);
			
			System.out.println("값 테스트 : " + map.get("IDX") + "");
			
			if(map.get("MEMBER_ID").equals("")) {
				
				System.out.println("신규 유저 IDX : " + map.get("IDX") );
				
				MEMBER_ID = id + "";
				
				String BIRTHCHANGE = map.get("BIRTH") + "";
				
				BIRTHCHANGE = BIRTHCHANGE.replace(".", "");
				
				BIRTHCHANGE = BIRTHCHANGE.substring(2,BIRTHCHANGE.length());
				
				String PASSWORD = SUtil.getSHA256(BIRTHCHANGE);
				
				
				if(map.get("LEVEL").equals("8")) {
					
					MEMBER_ID += "2";
					
					if(mento_num >= 100) {
						
						MEMBER_ID += ("" + mento_num +"");
						
					}else if(mento_num >= 10) {
						
						MEMBER_ID += ("0" + mento_num +"");
						
					}else {
						
						MEMBER_ID += ("00" + mento_num +"");
						
					}
					
					System.out.println("MEMBER_ID : " + MEMBER_ID);
					
					mento_num += 1;
					
				}else if(map.get("LEVEL").equals("11")) {
					
					MEMBER_ID += "1";
					
					if(student_num >= 100) {
						
						MEMBER_ID += ("" + student_num +"");
						
					}else if(student_num >= 10) {
						
						MEMBER_ID += ("0" + student_num +"");
						
					}else {
						
						MEMBER_ID += ("00" + student_num +"");
						
					}
					
					System.out.println("MEMBER_ID : " + MEMBER_ID);
					
					student_num += 1;
					
				}else {
					
					System.out.println("error : level / IDX : " + map.get("IDX"));
					
				}
				
				System.out.println("PASSWORD : " + PASSWORD);
				
				String NAME = (String) map.get("NAME");
				
				String Last_Name = NAME.substring(NAME.length() - 1);
				
				
				if(Last_Name.matches("[+-]?\\d*(\\.\\d+)?")) {
					
					NAME = NAME.substring(0,NAME.length() - 1);
					System.out.println(NAME + "는 123 유저 임");
					
					AdminMemberReVo.setNAME(NAME);
					AdminMemberReVo.setBIRTH(map.get("BIRTH") + "");
					AdminMemberReVo.setMEMBER_ID(MEMBER_ID);
					AdminMemberReVo.setPASSWORD(PASSWORD);
					AdminMemberReVo.setRESULT("new");
					
					//123 등 여러 중복 회원 이기에 회원 등록 NAME , BIRTH 로 키 잡아서 MEMBER_ID 등록
					adminMember_reService.setMemberReNewMemberIdDis(AdminMemberReVo);
					
				}else {
					
					System.out.println(NAME + "는 123 유저 아님");
					
					AdminMemberReVo.setIDX(map.get("IDX")+"");
					
					AdminMemberReVo.setMEMBER_ID(MEMBER_ID);
					
					AdminMemberReVo.setPASSWORD(PASSWORD);
					
					//회원 등록 IDX 로 키 잡아서 MEMBER_ID 등록
					adminMember_reService.setMemberReNewMemberId(AdminMemberReVo);
					
				}
						
				
			}else {
				
				System.out.println("기존 유저 ID : " + map.get("MEMBER_ID") + " IDX : " + map.get("IDX"));
				
			}
			
			
		}
		
		System.out.println("전체 아이디 발급 종료 --");
		
		System.out.println("유형 1 매칭 시작 -----");
		
		List<?> MatchingList = adminMember_reService.getMatchingAllList();
		
		for(int j = 0; j < MatchingList.size(); j += 2) {
			
			System.out.println("j 번째 매칭 : " + j);
			
			//매칭에 필요한 교사 , 학생 리스트 가져오기
			
			HashMap MentoMap = (HashMap) MatchingList.get(j);
			
			HashMap StudentMap = (HashMap) MatchingList.get(j+1);
			
			//매칭에 필요한 데이터 --> 멘토 아이디 , 학생 아이디 , 년도 , 학년 , 반 , 학교명(학생 학교?)
			
			System.out.println("해당 매칭 번호 : " + MentoMap.get("MATCHING") + "");
			
			
			AdminMatchingVo.setMEMBER_ID(StudentMap.get("MEMBER_ID")+"");
			
			AdminMatchingVo.setPROFESSOR_MEMBER_ID(MentoMap.get("MEMBER_ID")+"");
			
			AdminMatchingVo.setSUPPORT_GROUP(StudentMap.get("SCHOOL_YEAR")+"");
			
			AdminMatchingVo.setYEAR(Integer.toString(id)+"");
			
			AdminMatchingVo.setSCHOOL_YEAR(StudentMap.get("SCHOOL_YEAR")+"");
			
			AdminMatchingVo.setSCHOOL_GROUP(StudentMap.get("SCHOOL_GROUP")+"");
			
			AdminMatchingVo.setSCHOOL_NAME(StudentMap.get("SCHOOL_NAME")+"");
			
			System.out.println("matching-data =================");
			System.out.println("member_id : " + AdminMatchingVo.getMEMBER_ID());
			System.out.println("mento_member_id : " + AdminMatchingVo.getPROFESSOR_MEMBER_ID());
			System.out.println("support group & school_year : " + AdminMatchingVo.getSUPPORT_GROUP());
			System.out.println("year : " + AdminMatchingVo.getYEAR());
			System.out.println("school_group : " + AdminMatchingVo.getSCHOOL_GROUP());
			System.out.println("school_name : " + AdminMatchingVo.getSCHOOL_NAME());
			System.out.println("===============================\n");
			
			adminMember_reService.setMatching(AdminMatchingVo);
			
		}
		
	}
	
	//신입생 선발 접수자 관리 엑셀 다운
	//-------------------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/admin/member_re/excelDown.do", method = RequestMethod.GET)
	public void excelDown(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ModelMap map = adminMember_reService.getListAll();
		List<HashMap> list = (List<HashMap>) map.get("list");

	    Workbook wb = new HSSFWorkbook();
	    Sheet sheet = wb.createSheet("신입생_리스트");
	    Row row = null;
	    Cell cell = null;
	    int rowNo = 0;
	    
	    int WidthCnt = 0;
	    
	    for(WidthCnt=0; WidthCnt < 25; WidthCnt++) {
	    	sheet.setColumnWidth(WidthCnt, 7000);
	    }
	    /*
	    sheet.setColumnWidth(18, 11000);
	    sheet.setColumnWidth(25, 11000);
	    */
	    
	    
	    CellStyle headStyle = wb.createCellStyle();
	    
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);
	    
	    headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
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
	    cell.setCellValue("유형");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("매칭 번호(유형 1)");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("타입 (학생 or 교사)");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("이름");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("생년월일");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("성별");

	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("핸드폰");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("이메일");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("부모님 전화번호");

	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("지역");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("집주소(우편번호)");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("집주소 (전체주소)");

	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("학교 지역");

	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("학교 주소(전체)");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("학교 타입 (학생 = 초 , 중 , 고) | (교사 = 초등 , 중등)");

	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("학교 명");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("학년");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("반");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("지원 유형");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("지원 자격");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("학생(자기소개서) | 교사(지원동기)");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("영재교육 경험");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("영재교육 경험 기간");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("결과");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("서류 제출 여부");
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("기존 아이디");
	    
	    
	    cell = row.createCell(++columnCnt);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("기존 비밀번호(암호화)");
	    
	    
	    for(int i = 0; i < list.size(); i++ )
	    {
	    	
	    	System.out.println("----excel----"+i+"/"+list.size());
	    	
	    	HashMap tempMap = list.get(i);
	    	columnCnt = 0;
    	    row = sheet.createRow(rowNo++);

    	    cell = row.createCell(columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("TYPE")+"");

    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    String matching = tempMap.get("MATCHING")+"";
    	    if(matching.equals("null") || matching.equals("") || matching.equals(null)) {
    	    	cell.setCellValue(" ");
    	    }else {
    	    	cell.setCellValue(tempMap.get("MATCHING")+"");
    	    }
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    String level = tempMap.get("LEVEL")+"";
    	    
    	    if(level == null) {
    	    	cell.setCellValue("");
    	    }else if(level.equals("8")) {
    	    	cell.setCellValue("교사");
    	    }else if(level.equals("11")) {
    	    	cell.setCellValue("학생");
    	    }

    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("NAME")+"");

    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("BIRTH")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("SEX")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("PHONE")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("EMAIL")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("PARENT_PHONE")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("ZIPCODE")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("ADDRESS_LOCAL")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("ADDRESS")+"-"+tempMap.get("ADDRESS_DETAIL"));
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("SCHOOL_LOCATION")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("SCHOOL_ADDRESS")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("SCHOOL_TYPE")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("SCHOOL_NAME")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    
    	    String SCHOOL_YEAR = tempMap.get("SCHOOL_YEAR")+"";
    	    if(SCHOOL_YEAR == null)
    	    {
    	    	cell.setCellValue("");	
    	    }else if(SCHOOL_YEAR.equals("4"))
    	    {
    	    	cell.setCellValue("초등학교4학년");
    	    }else if(SCHOOL_YEAR.equals("5"))
    	    {
    	    	cell.setCellValue("초등학교5학년");
    	    }else if(SCHOOL_YEAR.equals("6"))
    	    {
    	    	cell.setCellValue("초등학교6학년");
    	    }else if(SCHOOL_YEAR.equals("7"))
    	    {
    	    	cell.setCellValue("중학교1학년");
    	    }else if(SCHOOL_YEAR.equals("8"))
    	    {
    	    	cell.setCellValue("중학교2학년");
    	    }else if(SCHOOL_YEAR.equals("9"))
    	    {
    	    	cell.setCellValue("중학교3학년");
    	    }else if(SCHOOL_YEAR.equals("10"))
    	    {
    	    	cell.setCellValue("고등학교1학년");
    	    }
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("SCHOOL_GROUP")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("TYPE_SUB")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("ELIGIBILITY")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("SELF_INTR")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("EXP_TYPE")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    String lc = tempMap.get("EXP_DATA")+"";
    	   
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    String rs = tempMap.get("RESULT")+"";
    	    if(rs == null)
    	    {
    	    	cell.setCellValue("대기");	
    	    }else if(rs.equals("check"))
    	    {
    	    	cell.setCellValue("대기");
    	    }else if(rs.equals("pass"))
    	    {
    	    	cell.setCellValue("합격");
    	    }
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    
    	    String file = tempMap.get("FILE_TYPE")+"";
    	    if(file == null) {
    	    	
    	    }else if(file.equals("1")) {
    	    	cell.setCellValue("대기");
    	    }else if(file.equals("2")) {
    	    	cell.setCellValue("완료");
    	    }
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("MEMBER_ID")+"");
    	    
    	    cell = row.createCell(++columnCnt);
    	    cell.setCellStyle(bodyStyle);
    	    cell.setCellValue(tempMap.get("PASSWORD")+"");
    	    
	    }
	    	

	    // 컨텐츠 타입과 파일명 지정

	    response.setContentType("ms-vnd/excel");
	    String excel_name_is = "신입생_리스트";
	    excel_name_is = URLEncoder.encode(excel_name_is,"UTF-8");
	    response.setHeader("Content-Disposition", "attachment;filename="+excel_name_is+".xls");



	    // 엑셀 출력

	    wb.write(response.getOutputStream());

	    wb.close();


	}
	
	
	
	
	//신입생 선발 대상자관리 엑셀 파일 다운
	//-------------------------------------------------------------------------------------------------------------------
		@RequestMapping(value = "/admin/member_re/passExcelDown.do", method = RequestMethod.GET)
		public void passExcelDown(HttpServletRequest request, HttpServletResponse response) throws IOException {

			ModelMap map = adminMember_reService.getPassListAll();
			List<HashMap> list = (List<HashMap>) map.get("list");

		    Workbook wb = new HSSFWorkbook();
		    Sheet sheet = wb.createSheet("신입생_리스트");
		    Row row = null;
		    Cell cell = null;
		    int rowNo = 0;
		    
		    int WidthCnt = 0;
		    
		    for(WidthCnt=0; WidthCnt < 25; WidthCnt++) {
		    	sheet.setColumnWidth(WidthCnt, 7000);
		    }
		    /*
		    sheet.setColumnWidth(18, 11000);
		    sheet.setColumnWidth(25, 11000);
		    */
		    
		    
		    CellStyle headStyle = wb.createCellStyle();
		    
		    headStyle.setBorderTop(BorderStyle.THIN);
		    headStyle.setBorderBottom(BorderStyle.THIN);
		    headStyle.setBorderLeft(BorderStyle.THIN);
		    headStyle.setBorderRight(BorderStyle.THIN);
		    
		    headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
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
		    cell.setCellValue("유형");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("매칭 번호(유형 1)");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("타입 (학생 or 교사)");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("이름");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("생년월일");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("성별");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("핸드폰");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("이메일");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("부모님 전화번호");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("지역");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("집주소(우편번호)");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("집주소 (전체주소)");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학교 지역");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학교 주소(전체)");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학교 타입 (학생 = 초 , 중 , 고) | (교사 = 초등 , 중등)");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학교 명");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학년");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("반");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("지원 유형");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("지원 자격");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학생(자기소개서) | 교사(지원동기)");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("영재교육 경험");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("영재교육 경험 기간");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("기존 아이디");
		    
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("기존 비밀번호(암호화)");
		    
		    
		    for(int i = 0; i < list.size(); i++ )
		    {
		    	
		    	System.out.println("----excel----"+i+"/"+list.size());
		    	
		    	HashMap tempMap = list.get(i);
		    	columnCnt = 0;
	    	    row = sheet.createRow(rowNo++);

	    	    cell = row.createCell(columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("TYPE")+"");

	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    String matching = tempMap.get("MATCHING")+"";
	    	    if(matching.equals("null") || matching.equals("") || matching.equals(null)) {
	    	    	cell.setCellValue(" ");
	    	    }else {
	    	    	cell.setCellValue(tempMap.get("MATCHING")+"");
	    	    }
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    String level = tempMap.get("LEVEL")+"";
	    	    
	    	    if(level == null) {
	    	    	cell.setCellValue("");
	    	    }else if(level.equals("8")) {
	    	    	cell.setCellValue("교사");
	    	    }else if(level.equals("11")) {
	    	    	cell.setCellValue("학생");
	    	    }

	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("NAME")+"");

	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("BIRTH")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SEX")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("PHONE")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("EMAIL")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("PARENT_PHONE")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("ADDRESS_LOCAL")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("ZIPCODE")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("ADDRESS")+"-"+tempMap.get("ADDRESS_DETAIL"));
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_LOCATION")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_ADDRESS")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_TYPE")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_NAME")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    
	    	    String SCHOOL_YEAR = tempMap.get("SCHOOL_YEAR")+"";
	    	    if(SCHOOL_YEAR == null)
	    	    {
	    	    	cell.setCellValue("");	
	    	    }else if(SCHOOL_YEAR.equals("4"))
	    	    {
	    	    	cell.setCellValue("초등학교4학년");
	    	    }else if(SCHOOL_YEAR.equals("5"))
	    	    {
	    	    	cell.setCellValue("초등학교5학년");
	    	    }else if(SCHOOL_YEAR.equals("6"))
	    	    {
	    	    	cell.setCellValue("초등학교6학년");
	    	    }else if(SCHOOL_YEAR.equals("7"))
	    	    {
	    	    	cell.setCellValue("중학교1학년");
	    	    }else if(SCHOOL_YEAR.equals("8"))
	    	    {
	    	    	cell.setCellValue("중학교2학년");
	    	    }else if(SCHOOL_YEAR.equals("9"))
	    	    {
	    	    	cell.setCellValue("중학교3학년");
	    	    }else if(SCHOOL_YEAR.equals("10"))
	    	    {
	    	    	cell.setCellValue("고등학교1학년");
	    	    }
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_GROUP")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("TYPE_SUB")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("ELIGIBILITY")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SELF_INTR")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("EXP_TYPE")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("EXP_DATA")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("MEMBER_ID")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("PASSWORD")+"");
	    	    
		    }
		    	

		    // 컨텐츠 타입과 파일명 지정

		    response.setContentType("ms-vnd/excel");
		    String excel_name_is = "합격자_리스트";
		    excel_name_is = URLEncoder.encode(excel_name_is,"UTF-8");
		    response.setHeader("Content-Disposition", "attachment;filename="+excel_name_is+".xls");



		    // 엑셀 출력

		    wb.write(response.getOutputStream());

		    wb.close();


		}
		
		
		//신입생 선발 접수자 관리 - 매칭 합친거
		//-------------------------------------------------------------------------------------------------------------------
		@RequestMapping(value = "/admin/member_re/AllexcelDown.do", method = RequestMethod.GET)
		public void excelDownAll(HttpServletRequest request, HttpServletResponse response) throws IOException {
			ModelMap map = adminMember_reService.getListAll();
			List<HashMap> list = (List<HashMap>) map.get("list");

		    Workbook wb = new HSSFWorkbook();
		    Sheet sheet = wb.createSheet("신입생_리스트");
		    Row row = null;
		    Cell cell = null;
		    int rowNo = 0;
		    
		    int WidthCnt = 0;
		    
		    for(WidthCnt=0; WidthCnt < 25; WidthCnt++) {
		    	sheet.setColumnWidth(WidthCnt, 7000);
		    }
		    /*
		    sheet.setColumnWidth(18, 11000);
		    sheet.setColumnWidth(25, 11000);
		    */
		    
		    
		    CellStyle headStyle = wb.createCellStyle();
		    
		    headStyle.setBorderTop(BorderStyle.THIN);
		    headStyle.setBorderBottom(BorderStyle.THIN);
		    headStyle.setBorderLeft(BorderStyle.THIN);
		    headStyle.setBorderRight(BorderStyle.THIN);
		    
		    headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
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
		    cell.setCellValue("유형");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("매칭 번호(유형 1)");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("구분");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("이름");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("생년월일");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("성별");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("핸드폰");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("이메일");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("부모님 전화번호");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("지역");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("집주소(우편번호)");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("집주소 (전체주소)");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학교 지역");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학교 주소(전체)");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학교 타입 (학생 = 초 , 중 , 고) | (교사 = 초등 , 중등)");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학교 명");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학년");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("반");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("지원 유형");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("지원 자격");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학생(자기소개서) | 교사(지원동기)");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("영재교육 경험");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("영재교육 경험 기간");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("서류 제출 여부");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("기존 아이디");
		    
		    //교사 부분
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("매칭 번호(유형 1)");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("구분");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("이름");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("생년월일");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("성별");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("핸드폰");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("이메일");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("지역");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("집주소(우편번호)");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("집주소 (전체주소)");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학교 주소(전체)");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학교 타입 (학생 = 초 , 중 , 고) | (교사 = 초등 , 중등)");

		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학교 명");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학년");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("반");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("지원 유형");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("지원 자격");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("학생(자기소개서) | 교사(지원동기)");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("영재교육 경험");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("영재교육 경험 기간");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("서류 제출 여부");
		    
		    cell = row.createCell(++columnCnt);
		    cell.setCellStyle(headStyle);
		    cell.setCellValue("기존 아이디");
		    
		    
		    String TYPE = "";
	    	String MATCHING = "";
	    	String LEVEL = "";
	    	AdminMemberReVo Vo2 = new AdminMemberReVo();
		    
		    for(int i = 0; i < list.size(); i++ )
		    {
		    	
		    	System.out.println("----excel----"+i+"/"+list.size());
		    	
		    	HashMap tempMap = list.get(i);
		    	
		    	
		    	TYPE = tempMap.get("TYPE") + "";		    	
		    	MATCHING = tempMap.get("MATCHING") + "";
		    	LEVEL = tempMap.get("LEVEL") + "";
		    	
		    	if(!MATCHING.equals("") && TYPE.equals("1") && LEVEL.equals("8")) {
		    		
		    		System.out.println("교사 넘김");
		    		
		    	}else {
		    		
		    	
		    	columnCnt = 0;
	    	    row = sheet.createRow(rowNo++);

	    	    cell = row.createCell(columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("TYPE")+"");

	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    String matching = tempMap.get("MATCHING")+"";
	    	    if(matching.equals("null") || matching.equals("") || matching.equals(null)) {
	    	    	cell.setCellValue(" ");
	    	    }else {
	    	    	cell.setCellValue(tempMap.get("MATCHING")+"");
	    	    }
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    String level = tempMap.get("LEVEL")+"";
	    	    
	    	    if(level == null) {
	    	    	cell.setCellValue("");
	    	    }else if(level.equals("8")) {
	    	    	cell.setCellValue("교사");
	    	    }else if(level.equals("11")) {
	    	    	cell.setCellValue("학생");
	    	    }

	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("NAME")+"");

	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("BIRTH")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SEX")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("PHONE")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("EMAIL")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("PARENT_PHONE")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("ZIPCODE")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("ADDRESS_LOCAL")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("ADDRESS")+"-"+tempMap.get("ADDRESS_DETAIL"));
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_LOCATION")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_ADDRESS")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_TYPE")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_NAME")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    
	    	    String SCHOOL_YEAR = tempMap.get("SCHOOL_YEAR")+"";
	    	    if(SCHOOL_YEAR == null)
	    	    {
	    	    	cell.setCellValue("");	
	    	    }else if(SCHOOL_YEAR.equals("4"))
	    	    {
	    	    	cell.setCellValue("초등학교4학년");
	    	    }else if(SCHOOL_YEAR.equals("5"))
	    	    {
	    	    	cell.setCellValue("초등학교5학년");
	    	    }else if(SCHOOL_YEAR.equals("6"))
	    	    {
	    	    	cell.setCellValue("초등학교6학년");
	    	    }else if(SCHOOL_YEAR.equals("7"))
	    	    {
	    	    	cell.setCellValue("중학교1학년");
	    	    }else if(SCHOOL_YEAR.equals("8"))
	    	    {
	    	    	cell.setCellValue("중학교2학년");
	    	    }else if(SCHOOL_YEAR.equals("9"))
	    	    {
	    	    	cell.setCellValue("중학교3학년");
	    	    }else if(SCHOOL_YEAR.equals("10"))
	    	    {
	    	    	cell.setCellValue("고등학교1학년");
	    	    }
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SCHOOL_GROUP")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("TYPE_SUB")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("ELIGIBILITY")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("SELF_INTR")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("EXP_TYPE")+"");
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("EXP_DATA")+"");
	    	   
	    	    /*
	    	     * 합격여부는 필요없다고 생각함
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    String rs = tempMap.get("RESULT")+"";
	    	    if(rs == null)
	    	    {
	    	    	cell.setCellValue("대기");	
	    	    }else if(rs.equals("check"))
	    	    {
	    	    	cell.setCellValue("대기");
	    	    }else if(rs.equals("pass"))
	    	    {
	    	    	cell.setCellValue("합격");
	    	    }
	    	    */
	    	    
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    
	    	    String file = tempMap.get("FILE_TYPE")+"";
	    	    if(file == null) {
	    	    	
	    	    }else if(file.equals("1")) {
	    	    	cell.setCellValue("대기");
	    	    }else if(file.equals("2")) {
	    	    	cell.setCellValue("완료");
	    	    }
	    	    
	    	    cell = row.createCell(++columnCnt);
	    	    cell.setCellStyle(bodyStyle);
	    	    cell.setCellValue(tempMap.get("MEMBER_ID")+"");
		    	
	    	    	//학생일시 교사 뒤에 붙여주기
	    	    	if(!MATCHING.equals("") && TYPE.equals("1") && LEVEL.equals("11")) {
	    	    		
	    	    		Vo2.setMATCHING(MATCHING);
	    	    		Vo2.setTYPE(TYPE);
	    	    		Vo2.setLEVEL(LEVEL);
	    	    		
	    	    		//학생일시 가져오는 거니 멘토 가져오기
	    	    		Vo2 = adminMember_reService.getMatchingMentoView(Vo2);
	    	    		
	    	    		cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getMATCHING()+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue("교사");

	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getNAME()+"");

	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getBIRTH()+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getSEX()+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getPHONE()+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getEMAIL()+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getZIPCODE()+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getADDRESS_LOCAL()+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getADDRESS()+Vo2.getADDRESS_DETAIL()+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(tempMap.get("SCHOOL_ADDRESS")+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(tempMap.get("SCHOOL_TYPE")+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(tempMap.get("SCHOOL_NAME")+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getSCHOOL_YEAR()+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getSCHOOL_GROUP()+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getTYPE_SUB()+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getELIGIBILITY()+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getSELF_INTR()+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getEXP_TYPE()+"");
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    cell.setCellValue(Vo2.getEXP_DATA()+"");
	    	    	   
	    	    	    /*
	    	    	     * 합격여부는 필요없다고 생각함
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    String rs = tempMap.get("RESULT")+"";
	    	    	    if(rs == null)
	    	    	    {
	    	    	    	cell.setCellValue("대기");	
	    	    	    }else if(rs.equals("check"))
	    	    	    {
	    	    	    	cell.setCellValue("대기");
	    	    	    }else if(rs.equals("pass"))
	    	    	    {
	    	    	    	cell.setCellValue("합격");
	    	    	    }
	    	    	    */
	    	    	    
	    	    	    
	    	    	    cell = row.createCell(++columnCnt);
	    	    	    cell.setCellStyle(bodyStyle);
	    	    	    
	    	    	    file = Vo2.getFILE_TYPE()+"";
	    	    	    if(file == null) {
	    	    	    	
	    	    	    }else if(file.equals("1")) {
	    	    	    	cell.setCellValue("대기");
	    	    	    }else if(file.equals("2")) {
	    	    	    	cell.setCellValue("완료");
	    	    	    }
	    	    		
	    	    		
	    	    	}
	    	    
	    	    
		    	}
	    	    
	    	    
		    }
		    	

		    // 컨텐츠 타입과 파일명 지정

		    response.setContentType("ms-vnd/excel");
		    String excel_name_is = "신입생_리스트";
		    excel_name_is = URLEncoder.encode(excel_name_is,"UTF-8");
		    response.setHeader("Content-Disposition", "attachment;filename="+excel_name_is+".xls");



		    // 엑셀 출력

		    wb.write(response.getOutputStream());

		    wb.close();


		}


}
