package egovframework.kaist.user.member_re.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.ProcessBuilder.Redirect;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
import egovframework.kaist.admin.sms_log.model.AdminSmsLogVo;
import egovframework.kaist.admin.sms_log.service.AdminSmsLogService;
import egovframework.kaist.user.buseo.service.UserBuseoService;
import egovframework.kaist.user.member.model.UserMemberVo;
import egovframework.kaist.user.member.service.UserMemberService;
import egovframework.kaist.user.member_re.model.UserMemberReDocumentVo;
import egovframework.kaist.user.member_re.model.UserMemberReVo;
import egovframework.kaist.user.member_re.service.UserMemberReService;
import egovframework.kaist.user.school.model.UserSchoolVo;

@Controller
public class UserMemberReController {

	@Autowired
	UserMemberReService userMember_reService;

	@Autowired
	UserBuseoService userBuseoService;

	@Autowired
	UserMemberService userMemberService;
	
	@Autowired
	AdminSmsLogService adminSmsLogService;
	
	
	
	
	@Value("#{PUBLIC['SMS.MEMBER_RE.INSERT']}") 
	String MEMBER_RE_INSERT = "";
	
	
	private static final Logger Logger = LoggerFactory.getLogger(UserMemberReController.class);
	
	
	/*신입생 선발 지원서 신청 부분 start*/
	
	//사용자 - 신입생 선발 지원서  - 지원 소개 페이지 이동
	@RequestMapping(value="/user/member_re/intro.do" , method = RequestMethod.GET)
	public String MemberReIntroGet(HttpServletRequest request , HttpServletResponse response) {
			
		return "/user/member_re/intro";
	}
	
	//사용자 - 신입생 선발 지원서  - 지원 동의서 체크 페이지 이동
	@RequestMapping(value="/user/member_re/check.do" , method = RequestMethod.GET)
	public String MemberReCheckGet(HttpServletRequest request , HttpServletResponse response) {
		
		return "/user/member_re/check";
	}
	
	//사용자 - 신입생 선발 지원서 - 신청 기간 설정 확인
	@RequestMapping(value="/user/member_re/configcheck.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public String MemberReConfigCheck(@ModelAttribute("MemberConfigVo")MemberConfigVo MemberConfigVo , HttpServletRequest request , HttpServletResponse response) throws ParseException, JsonProcessingException {
		
		String result = "";
		
		System.out.println(MemberConfigVo);
		
		result = userMember_reService.getMemberReConfigCheck(MemberConfigVo);
		
		System.out.println(result);
		
		ObjectMapper mapper = new ObjectMapper();
		
		result = mapper.writeValueAsString(result);
		
		return result;
	}
	
	//사용자 - 신입생 선발 지원서 - 신청 페이지 이동
	@RequestMapping(value="/user/member_re/insert.do" , method = RequestMethod.GET)
	public ModelAndView MemberReInsertGet(@ModelAttribute("UserMemberReVo")UserMemberReVo UserMemberReVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		System.out.println(UserMemberReVo.getTYPE());
		
		if(UserMemberReVo.getTYPE().equals("1")) {
			
			model.put("TYPE", "1");
			
		}else if(UserMemberReVo.getTYPE().equals("2")) {
			
			model.put("TYPE", "2");
			
		}else if(UserMemberReVo.getTYPE().equals("3")) {
			
			model = userMemberService.getView(UserMemberReVo.getMEMBER_ID());
			
			model.put("TYPE", "3");
		}
		
		List<?> list = userMember_reService.getDcmntList();
		
		model.put("list", list);
		
		return new ModelAndView("/user/member_re/insert", "model" , model);
		
	}
	
	//사용자 - 신입생 선발 지원서 - 학교 검색
	@RequestMapping(value="/user/member_re/school_search.do" , method = RequestMethod.GET)
	public ModelAndView SchoolSearchGet(@ModelAttribute("UserSchoolVo")UserSchoolVo UserSchoolVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = userMember_reService.getSchoolList(UserSchoolVo);
		
		return new ModelAndView("/user/member_re/school_search" , "model" , model);
	}
	
	//사용자 - 신입생 선발 지원서 - 기존 유저 확인 및 정보가져오기
	@RequestMapping(value="/user/member_re/membercheck.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public String MemberReCheckPost(@ModelAttribute("UserMemberReVo")UserMemberReVo UserMemberReVo , HttpServletRequest request , HttpServletResponse response) throws JsonProcessingException {
					
		ModelMap model = new ModelMap();
			
		model = userMember_reService.getMemberView(UserMemberReVo);
			
		UserMemberVo UserMemberVo = (UserMemberVo) model.get("view");
		if(UserMemberVo == null) {
				
			System.out.println("기존 확인 불가능");
				
			String result = "FALSE";
			
			ObjectMapper mapper = new ObjectMapper();
			
			result = mapper.writeValueAsString(result);
			
			return result;
				
		}else {
				
			System.out.println("확인");
			
			ObjectMapper mapper = new ObjectMapper();
			
			String result = mapper.writeValueAsString(UserMemberVo);
			
			return result;
				
		}
			
			
	}
	
	//사용자 - 신입생 선발 지원서 - [유형1 - 매칭 번호 가져오기]
	@RequestMapping(value="/user/member_re/matchingcnt.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public String MemberReMatchingCnt(@ModelAttribute("UserMemberReVo")UserMemberReVo UserMemberReVo , HttpServletRequest request , HttpServletResponse response) throws JsonProcessingException {
		
		String result = "";
		
		String Cnt = userMember_reService.getMatchingCnt();
		System.out.println(Cnt);
		
		int cnt = Integer.parseInt(Cnt);
		cnt += 1;
		Cnt = Integer.toString(cnt);
		result = Cnt;
		
		System.out.println(result);
		
		ObjectMapper mapper = new ObjectMapper();
		
		result = mapper.writeValueAsString(result);
		
		return result;
	}
	
	
	//사용자 - 신입생 선발 지원서 - 신청 페이지 등록
	@RequestMapping(value="/user/member_re/insert.do" , method = RequestMethod.POST)
	public void MemberReInsertPost(@ModelAttribute("UserMemberReVo")UserMemberReVo UserMemberReVo , HttpServletRequest request , HttpServletResponse response) {
		
		userMember_reService.setMemberReInsert(UserMemberReVo);
		
	}
	
	//사용자 - 신입생 선발 지원서 - 지원서 확인
	@RequestMapping(value="/user/member_re/view.do" , method = RequestMethod.GET)
	public ModelAndView MemberReViewGet(@ModelAttribute("UserMemberReVo")UserMemberReVo UserMemberReVo , HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		ModelMap model = new ModelMap();
		
		model = userMember_reService.getMemberReView(UserMemberReVo);
		
		System.out.println("result : "+model.get("result"));
		
		if(model.get("result").equals("false")) {
			
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('확인되는 지원서가 없습니다.');location.href='/index.do';</script>");
			out.flush();
			
			return new ModelAndView("/user/member_re/intro" , "model" , model);
			
		}else {
			return new ModelAndView("/user/member_re/view" , "model" , model);
		}
		
		
	}
	
	//사용자 - 신입생 선발 지원서 - 기존 유저 예방
	@RequestMapping(value="/user/member_re/membercheck2.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public String MemberReMemberCheck2(@ModelAttribute("UserMemberReVo")UserMemberReVo UserMemberReVo , HttpServletRequest request , HttpServletResponse response) throws JsonProcessingException {
		
		String result = "";
		
		result = userMember_reService.getMemberReCheck(UserMemberReVo);
		
		System.out.println(result);
		
		ObjectMapper mapper = new ObjectMapper();
		
		result = mapper.writeValueAsString(result);
		
		return result;
		
	}
	
	//사용자 - 신입생 선발 지원서 - 지원서 수정 페이지 이동
	@RequestMapping(value="/user/member_re/update.do" , method = RequestMethod.GET)
	public ModelAndView MemberReUpdateGet(@ModelAttribute("UserMemberReVo")UserMemberReVo UserMemberReVo , HttpServletRequest request , HttpServletResponse response) {
			
		ModelMap model = new ModelMap();
		
		model = userMember_reService.getMemberReView(UserMemberReVo);
		
		List<?> list = userMember_reService.getDcmntList();
		
		model.put("list", list);
		
		return new ModelAndView("/user/member_re/update" , "model" , model);
	}
	
	//사용자 - 신입생 선발 지원서 - 신청 업데이트
	@RequestMapping(value="/user/member_re/update.do" , method = RequestMethod.POST)
	public void MemberReUpdatePost(@ModelAttribute("UserMemberReVo")UserMemberReVo UserMemberReVo , @ModelAttribute("UserMemberReDocumentVo")UserMemberReDocumentVo UserMemberReDocumentVo , HttpServletRequest request , HttpServletResponse response) {
	
		userMember_reService.setMemberReUpdate(UserMemberReVo);
		UserMemberReDocumentVo.setMEMBER_IDX(UserMemberReVo.getIDX());
		UserMemberReDocumentVo.setMEMBER_NAME(UserMemberReVo.getNAME());
		userMember_reService.setMemberReFileNameChange(UserMemberReDocumentVo);
		
	}
	
	//사용자 - 신입생 선발 지원서 - 신청 삭제
	@RequestMapping(value="/user/member_re/delete.do" , method = RequestMethod.POST)
	public void MemberReDeletePost(@ModelAttribute("UserMemberReVo")UserMemberReVo UserMemberReVo , HttpServletRequest request , HttpServletResponse response)  throws JsonProcessingException  {
		
		userMember_reService.setMemberReDelete(UserMemberReVo);
		
	}
	
	//사용자 - 신입생 선발 지원서
	@RequestMapping(value="/user/member_re/pass_view.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public String MemberRePassView(@ModelAttribute("UserMemberReVo")UserMemberReVo UserMemberReVo , HttpServletRequest request , HttpServletResponse response) throws JsonProcessingException {
		
		ModelMap model = new ModelMap();
		
		model = userMember_reService.getMemberRePassView(UserMemberReVo);
		
		UserMemberReVo UserMemberReVo2 = (UserMemberReVo) model.get("view");
		if(UserMemberReVo2 == null) {
				
			System.out.println("기존 확인 불가능");
				
			String result = "FALSE";
			
			ObjectMapper mapper = new ObjectMapper();
			
			result = mapper.writeValueAsString(result);
			
			return result;
				
		}else {
				
			System.out.println("확인");
			
			ObjectMapper mapper = new ObjectMapper();
			
			String result = mapper.writeValueAsString(UserMemberReVo2);
			
			return result;
				
		}
		
		
	}
	
	
	/*신입생 선발 지원서 신청 부분 end*/
	
	/*신입생 선발 지원서 서류 부분 start*/
	
	//사용자 - 신입생 선발 신청서 - 신청서 리스트
	@RequestMapping(value="/user/member_re/document.do" , method = RequestMethod.GET)
	public ModelAndView MemberReDocumentList(@ModelAttribute("UserMemberReDocumentVo")UserMemberReDocumentVo UserMemberReDocumentVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = userMember_reService.getMemberReDocumentList(UserMemberReDocumentVo);
		
		model.put("beforeData", UserMemberReDocumentVo);
		
		return new ModelAndView("/user/member_re/document" , "model" , model);
	}
	
	@RequestMapping(value="/user/member_re/documentview.do" , method = RequestMethod.GET)
	public String MemberReDocumentView(@ModelAttribute("UserMemberReDocumentVo")UserMemberReDocumentVo UserMemberReDocumentVo , @ModelAttribute("UserMemberReVo")UserMemberReVo UserMemberReVo , HttpServletRequest request , HttpServletResponse response) throws UnsupportedEncodingException {
		
		UserMemberReVo mento = userMember_reService.getMentoView(UserMemberReVo);
		
		String mento_idx = mento.getIDX();
		
		String mento_name = mento.getNAME();
		
		String mento_birth = mento.getBIRTH();
		
		String mento_type = mento.getTYPE();
		
		String mento_el = request.getParameter("ELIGIBILITY");
		
		mento_name = URLEncoder.encode(mento_name,"UTF-8");
		
		mento_el = URLEncoder.encode(mento_el,"UTF-8");
		
		
		return "redirect:/user/member_re/document.do?IDX="+mento_idx+"&MEMBER_NAME="+mento_name+"&BIRTH="+mento_birth+"&TYPE="+mento_type+"&ELIGIBILITY="+mento_el+"";
	}
	
	//사용자 - 신입생 선발 서류 등록
	@RequestMapping(value="/user/member_re/document_upload.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public void MemberReDocumentUpload(@ModelAttribute("UserMemberReDocumentVo")UserMemberReDocumentVo UserMemberReDocumentVo  , MultipartHttpServletRequest  request , HttpServletResponse response) throws InterruptedException, UnsupportedEncodingException {
		
		String birth = UserMemberReDocumentVo.getBIRTH();
		String name = UserMemberReDocumentVo.getMEMBER_NAME();
		
		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/member_re/delete/"+birth+""+name+"/";
		
		System.out.println(drv);
		
		String filename = SUtil.setFileUpload(request, drv);
		
		
		/*
		TimeUnit.SECONDS.sleep(2);
		
		String birth = UserMemberReDocumentVo.getBIRTH();
		String name = UserMemberReDocumentVo.getMEMBER_NAME();
		
		System.out.println(birth + name);
		
		String sub_folder = birth + name;
		
		String filename2 = SUtil.FtpFileUpload(request, drv , sub_folder , filename);
		*/
		
		filename = URLDecoder.decode(filename , "UTF-8");
		
		System.out.println("filename = " + filename);
		
		UserMemberReDocumentVo.setLINK(filename);
		
		userMember_reService.setMemberReFile(UserMemberReDocumentVo);
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//사용자 - 신입생 선발 서류 삭제
	@RequestMapping(value="/user/member_re/document_delete.do" , method = RequestMethod.POST)
	public void MemberReDocumentDelete(@ModelAttribute("UserMemberReDocumentVo")UserMemberReDocumentVo UserMemberReDocumentVo  , HttpServletRequest  request , HttpServletResponse response) {
		
		UserMemberReDocumentVo User = userMember_reService.getMemberReDocumentView(UserMemberReDocumentVo);
		
		System.out.println(User.getNAME());
		System.out.println(User.getLINK());
		System.out.println(User.getMEMBER_NAME());
		
		boolean result = SUtil.FtpFileDelete(User);
		
		userMember_reService.setMemberReDocumentDelete(User);

	
	}
	
	//사용자 - 신입생 선발 서류 파일 다운로드
	@RequestMapping(value="/user/member_re/FileLinkCheck.do" , method = RequestMethod.POST , produces = "application/json; charset=utf8")
	@ResponseBody
	public String UserMemberReDocumentFileDown(@ModelAttribute("UserMemberReDocumentVo")UserMemberReDocumentVo UserMemberReDocumentVo  , HttpServletRequest  request , HttpServletResponse response) throws JsonProcessingException {
		
		String result = "";
		
		result = userMember_reService.getFileLinkCheck(UserMemberReDocumentVo);
		
		System.out.println("result : " + result);
		
		ObjectMapper mapper = new ObjectMapper();
		
		result = mapper.writeValueAsString(result);
		
		return result;
		
	}
	
	
	/*신입생 선발 지원서 서류 부분 end*/
	
}
