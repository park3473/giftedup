package egovframework.kaist.admin.exam.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

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
		
		System.out.println("size : " + list.size());
		
		int itemtotalcount = adminExamMapper.getAllListCnt(adminExamVo);
		int itemCount  = adminExamVo.getITEM_COUNT();
		int itempage = adminExamVo.getPAGE();
		
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
		
		List<?> question = adminExamMapper.getStatusQuestionList(adminExamVo);
		
		List<?> resultList = adminExamMapper.getExamResultMemberAll(adminExamVo);
		
		model.put("question" , question);
		
		model.put("resultList", resultList);
		
		return model;
	}
	
}
