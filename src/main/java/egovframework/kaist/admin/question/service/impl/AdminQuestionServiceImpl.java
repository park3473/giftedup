package egovframework.kaist.admin.question.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.kaist.admin.question.model.AdminQuestionVo;
import egovframework.kaist.admin.question.service.AdminQuestionService;
import egovframework.kaist.admin.select.service.impl.AdminSelectMapper;


@Service("adminQuestionService")
@Transactional
public class AdminQuestionServiceImpl implements AdminQuestionService {

	@Resource(name="adminQuestionMapper")
	AdminQuestionMapper adminQuestionMapper;
	
	@Resource(name="adminSelectMapper")
	AdminSelectMapper adminSelectMapper;

	@Override
	public ModelMap getAllList(AdminQuestionVo adminQuestionVo) {
		
		ModelMap modelMap = new ModelMap();
		
		List<?> list = adminQuestionMapper.getAllList(adminQuestionVo);
		
		System.out.println("size : " + list.size());
		int itemtotalcount = adminQuestionMapper.getAllListCnt(adminQuestionVo);
		int itemcount  = adminQuestionVo.getITEM_COUNT();
		int itempage = adminQuestionVo.getPAGE();
		
		PageVO pageVo = new PageVO(itemcount, itemtotalcount, itempage);
		
		if(pageVo.isItempagenext() == true){
			modelMap.put("itempagenext", "true");
		}else {
			modelMap.put("itempagenext", "false");
		}
		
		System.out.println(pageVo.getItempage());
		
		modelMap.put("page", pageVo.getItempage());
		modelMap.put("itemCount", pageVo.getItemCount());
		modelMap.put("itempagestart", pageVo.getItempagestart());
		modelMap.put("itempageend", pageVo.getItempageend());
		modelMap.put("itemtotalcount", pageVo.getItemtotalcount());
		modelMap.put("itemtotalpage", pageVo.getItemtotalpage());
		
		
		
		modelMap.put("list", list);
		
		return modelMap;
	}

	@Override
	public void setQuestionData(AdminQuestionVo adminQuestionVo, String type) {
		
		switch (type) {
		case "insert":
			adminQuestionMapper.setQuestionDataInsert(adminQuestionVo);
			break;
		case "update":
			adminQuestionMapper.setQuestionDataUpdate(adminQuestionVo);
			break;
		case "delete":
			adminQuestionMapper.setQuestionDataDelete(adminQuestionVo);
			break;
		default:
			System.out.println("Type오류");
			break;
		}
		
	}

	@Override
	public List<?> getTypeAllList() {
		
		List<?> TypeList = adminQuestionMapper.getTypeAllList();
		
		return TypeList;
	}

	@Override
	public ModelMap getQuestionData(AdminQuestionVo adminQuestionVo) {
		
		ModelMap model = new ModelMap();
		
		AdminQuestionVo view = new AdminQuestionVo();
		
		view = adminQuestionMapper.getQuestionData(adminQuestionVo);
		
		String value = adminQuestionVo.getIdx();
		
		List<?> list = adminSelectMapper.getSelectList(value);
		
		model.put("view", view);
		
		model.put("list", list);
		
		return model;
	}

	@Override
	public String setQuestionAjaxData(AdminQuestionVo adminQuestionVo) {
		
		adminQuestionMapper.setQuestionDataAjaxInsert(adminQuestionVo);
		
		System.out.println("Question_idx : " + adminQuestionVo.getIdx());
		
		String Question_idx = adminQuestionVo.getIdx();
		
		return Question_idx;
	}

	@Override
	public List<?> getQuestionAllList(AdminQuestionVo adminQuestionVo) {
		
		List<?> list = adminQuestionMapper.getQuestionAllList(adminQuestionVo);
		
		return list;
	}
	
}
