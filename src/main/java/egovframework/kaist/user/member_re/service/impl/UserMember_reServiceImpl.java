package egovframework.kaist.user.member_re.service.impl;
 

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.xml.bind.ParseConversionEvent;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;
import com.system.util.SUtil;

import egovframework.kaist.admin.MemberConfigVo;
import egovframework.kaist.admin.dcmnt.service.impl.AdminDcmntMapper;
import egovframework.kaist.admin.member_re.service.impl.AdminMemberReMapper;
import egovframework.kaist.user.member.model.UserMemberVo;
import egovframework.kaist.user.member_re.model.UserMemberReDocumentVo;
import egovframework.kaist.user.member_re.model.UserMemberReVo;
import egovframework.kaist.user.member_re.service.UserMemberReService;
import egovframework.kaist.user.school.model.UserSchoolVo;

@Service("userMember_reService")
@Transactional
public class UserMember_reServiceImpl implements UserMemberReService {

	
	@Resource(name = "adminDcmntMapper")
	private AdminDcmntMapper adminDcmntMapper;
	
	@Resource(name = "userMember_reMapper")
	private UserMemberReMapper userMember_reMapper;
	
	@Resource(name = "adminMember_reMapper")
	private AdminMemberReMapper adminMember_reMapper;
	
	protected Log log = LogFactory.getLog(UserMember_reServiceImpl.class);


	@Override
	public String getMemberReConfigCheck(MemberConfigVo memberConfigVo) throws ParseException {
		
		String result = "";

		//Date Now = LocalDate.now(ZoneId.of("Asia/Seoul"));
		
		Date now = new Date();
		
		MemberConfigVo Config = userMember_reMapper.getConfig(memberConfigVo);
		
		String st_tm = Config.getSTART_TM();
		String ed_tm = Config.getEND_TM(); 
		
		SimpleDateFormat tm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date Start_tm = tm.parse(st_tm);
		Date End_tm = tm.parse(ed_tm);
		
		System.out.println("st_tm : " + Start_tm);
		System.out.println("ed_tm : " + End_tm);
		System.out.println("now_tm : " + now);
		
		if((Start_tm.before(now) && now.before(End_tm)) || Start_tm == now || End_tm == now) {
			
			result = "TRUE";
			
		}else{
			
			result = "FALSE";
			
		};
		
		
		
		return result;
		
	}


	@Override
	public void setMemberReInsert(UserMemberReVo userMemberReVo) {
		
		userMember_reMapper.setMemberReInsert(userMemberReVo);
		
	}


	@Override
	public String getMatchingCnt() {
		String MatchingCnt = userMember_reMapper.getMatchingCnt();
		
		if(MatchingCnt == null) {
			MatchingCnt = "0";
		}
		
		
		return MatchingCnt;
	}


	@Override
	public void setMemberReUpdate(UserMemberReVo userMemberReVo) {
		
		userMember_reMapper.setMemberReUpdate(userMemberReVo);
		
	}


	@Override
	public ModelMap getMemberReView(UserMemberReVo userMemberReVo) {
		
		ModelMap model = new ModelMap();
		
		String result = "true";
		
		if(userMemberReVo.getTYPE().equals("1")) {
			
			userMemberReVo.setLEVEL("8");
			
			UserMemberReVo mento_view = userMember_reMapper.getMemberReView(userMemberReVo);
			
			if(mento_view == null) {

				result = "false";
				
				
			}else {
			
				
				
				System.out.println(mento_view.getMATCHING());
				
				userMemberReVo.setMATCHING(mento_view.getMATCHING());
				userMemberReVo.setLEVEL("11");
				
				UserMemberReVo student_view = userMember_reMapper.getMemberReView(userMemberReVo);
			
				model.put("mento_view", mento_view);
				model.put("student_view", student_view);
				
			}
			
			
			
		}else if(userMemberReVo.getTYPE().equals("2") || userMemberReVo.getTYPE().equals("3")) {
		
			System.out.println("???zzz");
			
			UserMemberReVo view = userMember_reMapper.getMemberReView(userMemberReVo);
			
			if(view == null) {
				
				result = "false";	
				
			}else {
			
				model.put("view", view);
				
			}
			
			
		}
		
		model.put("result", result);
		
		return model;
	}


	@Override
	public void setMemberReDelete(UserMemberReVo userMemberReVo) {
		
		userMember_reMapper.setMemberReDelete(userMemberReVo);
		
	}
	
	@Override
	public List<?> getDcmntList(){
		
		List<?> list = userMember_reMapper.getDcmntList();
		
		return list;
	}


	@Override
	public ModelMap getSchoolList(UserSchoolVo userSchoolVo) {
	
		ModelMap model = new ModelMap();
		
		List<?> list = userMember_reMapper.getSchoolList(userSchoolVo);
	
		model.put("list", list);
		
		return model;
	}


	@Override
	public ModelMap getMemberView(UserMemberReVo userMemberReVo) {
		
		ModelMap model = new ModelMap();
		
		UserMemberVo view = userMember_reMapper.getMemberView(userMemberReVo);
		
		model.put("view", view);
		
		return model;
	}


	@Override
	public String getMemberReCheck(UserMemberReVo userMemberReVo) {
		
		String result = "";
		
		int Cnt = userMember_reMapper.getMemberReCheck(userMemberReVo);
		
		if(Cnt > 0) {
			
			result = "true";
			
		}else if(Cnt == 0){
			
			result = "false";
			
		}
		
		return result;
	}


	@Override
	public ModelMap getMemberReDocumentList(UserMemberReDocumentVo userMemberReDocumentVo) {
		// TODO Auto-generated method stub
		
		ModelMap model = new ModelMap();
		
		List<?> document = userMember_reMapper.getDocumentList(userMemberReDocumentVo);
		
		userMemberReDocumentVo.setTITLE("1");
		List<?> list_title_1 = userMember_reMapper.getMemberReDocumentList(userMemberReDocumentVo);
		
		userMemberReDocumentVo.setTITLE("2");
		List<?> list_title_2 = userMember_reMapper.getMemberReDocumentList(userMemberReDocumentVo);
		
		model.put("document", document);
		model.put("list_1", list_title_1);
		model.put("list_2", list_title_2);
		
		
		return model;
	}


	@Override
	public void setMemberReFile(UserMemberReDocumentVo userMemberReDocumentVo) {
		
		//우선 유형 데이터 가져와서 분류
		String TYPE = userMemberReDocumentVo.getTYPE();
		System.out.println(TYPE);
		if(TYPE.equals("1")) {
			System.out.println("유형1");
			//유형 1
			UserMemberReVo MemberReVo = new UserMemberReVo();
			
			
			//매칭 번호 가져오기
			MemberReVo.setIDX(userMemberReDocumentVo.getMEMBER_IDX());
			String Matching = userMember_reMapper.getMatchingView(MemberReVo);
			
			MemberReVo.setLEVEL("11");
			MemberReVo.setMATCHING(Matching);
			//매칭 번호로 학생 가져오기
			UserMemberReVo Student = userMember_reMapper.getMemberReMatchingView(MemberReVo);
			
			MemberReVo.setLEVEL("8");
			MemberReVo.setMATCHING(Matching);
			//매칭 번호로 멘토 가져오기
			UserMemberReVo Mento = userMember_reMapper.getMemberReMatchingView(MemberReVo);
			
			
			int Count = 0; 
			//유형 1 이므로 멘토의IDX 넣어야됨
			userMemberReDocumentVo.setMEMBER_IDX(Mento.getIDX());
			Count = userMember_reMapper.getMemberReFileListCnt(userMemberReDocumentVo);
			
			System.out.println(Count);
			
			userMember_reMapper.setMemberReFile(userMemberReDocumentVo);
		
			//유형1 이므로 학생의 지원 분야
			String EL = Student.getELIGIBILITY();
			
			int FullCount = 0;
			
			FullCount = userMember_reMapper.getMemberReFileFullCnt(EL); 
			
			FullCount = FullCount + 3;
			
			System.out.println("FullCount : " + FullCount);
			
			Count = userMember_reMapper.getMemberReFileListCnt(userMemberReDocumentVo);
			
			System.out.println("Count : " + Count);
			
			if(Count >= FullCount) {
				
				String IDX = "";
				//학생 먼저 file type 변경
				IDX = Student.getIDX();
				userMember_reMapper.setMemberReFileTypeTwo(IDX);
				//멘토 변경
				IDX = Mento.getIDX(); 
				userMember_reMapper.setMemberReFileTypeTwo(IDX);
				
			}else {
				
				String IDX = "";
				//학생 먼저 file type 변경
				IDX = Student.getIDX();
				userMember_reMapper.setMemberReFileTypeOne(IDX);
				//멘토 변경
				IDX = Mento.getIDX(); 
				userMember_reMapper.setMemberReFileTypeOne(IDX);
				
			}
			
			
		}else {
			// 유형 2,3
			System.out.println("유형2,3");
			int Count = 0; 
			
			Count = userMember_reMapper.getMemberReFileListCnt(userMemberReDocumentVo);
			
			System.out.println(Count);
			
			userMember_reMapper.setMemberReFile(userMemberReDocumentVo);
		
			String IDX = userMemberReDocumentVo.getMEMBER_IDX();
			
			String EL = userMember_reMapper.getMemberReELIGIBILITY(IDX);
			
			int FullCount = 0;
			
			FullCount = userMember_reMapper.getMemberReFileFullCnt(EL); 
			
			FullCount = FullCount + 3;
			
			System.out.println("FullCount : " + FullCount);
			
			Count = userMember_reMapper.getMemberReFileListCnt(userMemberReDocumentVo);
			
			System.out.println("Count : " + Count);
			
			if(FullCount == Count) {
				
				userMember_reMapper.setMemberReFileTypeTwo(IDX);
				
			}else {
				
				userMember_reMapper.setMemberReFileTypeOne(IDX);
				
			}
			
		}
		
				
	}


	@Override
	public void setMemberReFileNameChange(UserMemberReDocumentVo userMemberReDocumentVo) {
		// TODO Auto-generated method stub
		userMember_reMapper.setMemberReFileNameChange(userMemberReDocumentVo);
	}


	@Override
	public UserMemberReDocumentVo getMemberReDocumentView(UserMemberReDocumentVo userMemberReDocumentVo) {
		
		UserMemberReDocumentVo User = userMember_reMapper.getMemberReDocumentView(userMemberReDocumentVo);
		
		return User;
	}


	@Override
	public void setMemberReDocumentDelete(UserMemberReDocumentVo user) {
		// TODO Auto-generated method stub
		
		userMember_reMapper.setMemberReDocumentDelete(user);
		
		String IDX = user.getMEMBER_IDX();
		
		userMember_reMapper.setMemberReFileTypeOne(IDX);
		
	}


	@Override
	public UserMemberReVo getMentoView(UserMemberReVo userMemberReVo) {
		// TODO Auto-generated method stub
		
		UserMemberReVo mento = userMember_reMapper.getMemberReMentoView(userMemberReVo);
		
		return mento;
	}


	@Override
	public ModelMap getMemberRePassView(UserMemberReVo userMemberReVo) {
		// TODO Auto-generated method stub
		
		ModelMap model = new ModelMap();
		
		UserMemberReVo view = userMember_reMapper.getMemberPassView(userMemberReVo);
		
		System.out.println("???");
		
		System.out.println(view);
		
		model.put("view", view);
		
		return model;
	}


	@Override
	public String getFileLinkCheck(UserMemberReDocumentVo userMemberReDocumentVo) {
		
		String result = "";
		
		result = userMember_reMapper.getFileLinkCheck(userMemberReDocumentVo);
		
		return result;
	}
	
	
 
	
		
}
