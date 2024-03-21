package egovframework.kaist.admin.exam.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.kaist.admin.exam.model.AdminExamRespondentsVo;
import egovframework.kaist.admin.exam.model.AdminExamResultVo;
import egovframework.kaist.admin.exam.model.AdminExamVo;
import egovframework.kaist.admin.exam.service.AdminExamService;
import egovframework.kaist.admin.member.service.impl.AdminMemberMapper;
import egovframework.kaist.admin.member.service.impl.AdminMemberServiceImpl;
import egovframework.kaist.admin.question.model.AdminQuestionListVo;
import egovframework.kaist.user.exam.service.impl.UserExamMapper;
import egovframework.kaist.user.question.service.impl.UserQuestionMapper;

@Service("adminExamService")
@Transactional
public class AdminExamServiceImpl implements AdminExamService {

	@Resource(name="adminExamMapper")
	AdminExamMapper adminExamMapper;

	protected Log log = LogFactory.getLog(AdminExamServiceImpl.class);
	
	@Override
	public ModelMap getAllList(AdminExamVo adminExamVo) {
		
		ModelMap modelMap = new ModelMap();
		
		List<?> list = adminExamMapper.getExamAllList(adminExamVo);
		
		int itemtotalcount = adminExamMapper.getAllListCnt(adminExamVo);
		
		modelMap.put("list", list);
		
		modelMap.put("totalCount" , itemtotalcount);
		
		return modelMap;
	}

	@Override
	public void setAdminExamData(AdminExamVo adminExamVo, String type) {
		// TODO Auto-generated method stub
		switch (type) {
		case "insert":
			adminExamMapper.setAdminExamDataInsert(adminExamVo);
			break;
		case "update":
			adminExamMapper.setAdminExamDataUpdate(adminExamVo);
			break;
		case "delete":
			adminExamMapper.setAdminExamDataDelete(adminExamVo);
			break;
		default:
			System.out.println("Type 오류");
			
			break;
		}
		
		
	}

	@Override
	public ModelMap getExamView(AdminExamVo adminExamVo) {
		
		ModelMap model = new ModelMap();
		
		AdminExamVo view = adminExamMapper.getExamView(adminExamVo);
		
		model.put("view", view);
		
		//AdminExamVo vo = new AdminExamVo();
		
		//vo.setL_category("TRUE");
		
		//l category 가져오기 
		//List<?> LCategoryList = adminExamMapper.getExamCategoryList(vo); 
		
		//model.put("LCategoryList", LCategoryList);
		
		//vo.setL_category("");
		//vo.setM_category("TRUE");
		
		//m category 가져오기
		//List<?> MCategoryList = adminExamMapper.getExamCategoryList(vo); 
		
		//model.put("MCategoryList", MCategoryList);
		
		return model;
	}

	@Override
	public ModelMap getQuestionList(AdminQuestionListVo adminQuestionListVo) {
		
		ModelMap model = new ModelMap();
		
		List<?> list = adminExamMapper.getQuestionList(adminQuestionListVo);
		
		model.put("list", list);
		
		return model;
	}

	@Override
	public void setAdminExamQuestionList(AdminQuestionListVo adminQuestionListVo, String type) {
		
		switch (type) {
		case "insert":
			adminExamMapper.setAdminExamQuestionListInsert(adminQuestionListVo);
			break;
		case "update":
			adminExamMapper.setAdminExamQuestionListUpdate(adminQuestionListVo);
			break;
		case "delete":
			adminExamMapper.setAdminExamQuestionListDelete(adminQuestionListVo);
			break;

		default:
			break;
		}
		
		
	}

	@Override
	public ModelMap getExamCategoryAllList() {
		
		ModelMap model = new ModelMap();
		
		//AdminExamVo vo = new AdminExamVo();
		
		//vo.setL_category("TRUE");
		
		//l category 가져오기 
		//List<?> LCategoryList = adminExamMapper.getExamCategoryList(vo); 
		
		//model.put("LCategoryList", LCategoryList);
		
		//vo.setL_category("");
		//vo.setM_category("TRUE");
		
		//m category 가져오기
		//List<?> MCategoryList = adminExamMapper.getExamCategoryList(vo); 
		
		//model.put("MCategoryList", MCategoryList);
		
		return model;
		
	}

	@Override
	public ModelMap getStatusData(AdminExamVo adminExamVo) {
		
		ModelMap model = new ModelMap();
		
		/*0319방식 변경 = 응답자 리스트가 아닌
		 * TOTAL_CNT = 총 응답자 수
		 * RESPON_CNT = 응답한 수
		 */
		
		int total_cnt = adminExamMapper.getExamRespondentsTotalCnt(adminExamVo);
		
		int respon_cnt = adminExamMapper.getExamRespondentsCnt(adminExamVo);
		
		//문제리스트
		List<?> question = adminExamMapper.getStatusQuestionList(adminExamVo);
		
		//응답자들 결과 리스트
		List<?> resultList = adminExamMapper.getExamResultMemberAll(adminExamVo);
		
		model.put("total_cnt", total_cnt);
		
		model.put("respon_cnt", respon_cnt);
		
		model.put("question" , question);
		
		model.put("resultList", resultList);
		
		return model;
	}

	@Override
	public void setAdminExamQuestionSort(AdminQuestionListVo adminQuestionListVo) {
		
		adminExamMapper.setAdminExamQuestionSort(adminQuestionListVo);
		
	}

	@Override
	public ModelMap getExamRespondentsList(AdminExamRespondentsVo adminExamRespondentsVo) {
		
		ModelMap model = new ModelMap();
		
		List<?> respondents = adminExamMapper.getRespondentsList(adminExamRespondentsVo);
		
		model.put("respondents", respondents);
		
		return model;
	}

	@Override
	public ModelMap getExamRespondentsAjaxList(AdminExamRespondentsVo adminExamRespondentsVo , String callType) {
		
		ModelMap model = new ModelMap();
		
		switch (callType) {
		case "member":
			List<?> member = adminExamMapper.getNoRespondentsList(adminExamRespondentsVo);
			model.put("member", member);
			break;
		case "respondents":
			List<?> respondents = adminExamMapper.getRespondentsList(adminExamRespondentsVo);
			model.put("respondents", respondents);
			break;
		}
		
		model.put("callType", callType);
			
		return model;
	}

	@Override
	public void setExamRespondents(AdminExamRespondentsVo adminExamRespondentsVo, String type) {
		
		switch (type) {
		case "insert":
			adminExamMapper.setExamRespondentsInsert(adminExamRespondentsVo);
			break;
		case "delete":
			adminExamMapper.setExamRespondentsDelte(adminExamRespondentsVo);
			break;
		}
		
		
	}

	@Override
	public int getExamRespondentsAjaxListCnt(AdminExamRespondentsVo adminExamRespondentsVo) {
		
		int result = adminExamMapper.getExamRespondentsAjaxListCnt(adminExamRespondentsVo);
		
		return result;
	}

	@Override
	public ModelMap getAllResultList(AdminExamResultVo adminExamResultVo) {

ModelMap modelMap = new ModelMap();
		
		List<?> list = adminExamMapper.getExamAllResultList(adminExamResultVo);
		
		System.out.println("size : " + list.size());
		
		int itemtotalcount = adminExamMapper.getAllResultListCnt(adminExamResultVo);
		int itemCount  = adminExamResultVo.getITEM_COUNT();
		int itempage = adminExamResultVo.getPAGE();
		
		PageVO pageVo = new PageVO(itemCount, itemtotalcount, itempage);
		
		if(pageVo.isItempagenext() == true){
			modelMap.put("itempagenext", "true");
		}else {
			modelMap.put("itempagenext", "false");
		}
		
		System.out.println(pageVo.getItempage());
		
		modelMap.put("page", pageVo.getItempage());
		System.out.println("itemCount" + pageVo.getItemCount());
		modelMap.put("itemCount", pageVo.getItemCount());
		modelMap.put("itempagestart", pageVo.getItempagestart());
		modelMap.put("itempageend", pageVo.getItempageend());
		modelMap.put("itemtotalcount", pageVo.getItemtotalcount());
		modelMap.put("itemtotalpage", pageVo.getItemtotalpage());
		
		modelMap.put("list", list);
		
		return modelMap;
		
	}

	@Override
	public ModelMap getExamRespondentsResultList(AdminExamRespondentsVo adminExamRespondentsVo) {
		
		ModelMap model = new ModelMap();
		
		List<?> ResultList = adminExamMapper.getRespondentsResultList(adminExamRespondentsVo);
		
		model.put("ResultList", ResultList);
		
		return model;
	}

	@Override
	public ModelMap getExamRespondentsResultView(AdminExamRespondentsVo adminExamRespondentsVo) {
		
		ModelMap model = new ModelMap();
		
		//해당 응답자의 결과 가져오기
		AdminExamResultVo view = new AdminExamResultVo();
		
		view.setExam_idx(adminExamRespondentsVo.getExam_idx());
		view.setMember_id(adminExamRespondentsVo.getMember_id());
		
		view = adminExamMapper.getExamResultView(view);
		
		AdminExamVo ExamVo = new AdminExamVo();
		
		ExamVo.setIdx(adminExamRespondentsVo.getExam_idx());
		//해당 응답자의 문제 가져오기
		List<?> question = adminExamMapper.getStatusQuestionList(ExamVo);
		
		model.put("view", view);
		model.put("question", question);
		
		return model;
		
	}

	@Override
	public ModelMap getExamResultExcelData(AdminExamVo adminExamVo) {

		ModelMap model = new ModelMap();
		
		List<?> question = adminExamMapper.getStatusQuestionList(adminExamVo);
		
		List<?> respondents = adminExamMapper.getExamResultMemberAll(adminExamVo);
		
		model.put("question", question);
		
		model.put("respondents", respondents);
		
		return model;
	}
	
}
