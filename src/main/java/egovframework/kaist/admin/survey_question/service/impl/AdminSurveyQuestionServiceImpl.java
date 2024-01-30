package egovframework.kaist.admin.survey_question.service.impl;
 

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.kaist.admin.survey_question.model.AdminSurveyQuestionVo;
import egovframework.kaist.admin.survey_question.service.AdminSurveyQuestionService;
import egovframework.kaist.admin.survey_questionnaire.model.AdminSurveyQuestionnaireVo;
import egovframework.kaist.admin.survey_questionnaire.service.impl.AdminSurveyQuestionnaireMapper;
import egovframework.kaist.admin.survey_select.service.impl.AdminSurveySelectMapper;

@Service("adminSurveyQuestionService")
@Transactional
public class AdminSurveyQuestionServiceImpl implements AdminSurveyQuestionService {

	@Resource(name = "adminSurveyQuestionnaireMapper")
	private AdminSurveyQuestionnaireMapper adminSurveyQuestionnaireMapper;
	
	@Resource(name = "adminSurveyQuestionMapper")
	private AdminSurveyQuestionMapper adminsurveyQuestionMapper;
	
	
	@Resource(name = "adminSurveySelectMapper")
	private AdminSurveySelectMapper adminSurveySeleteMapper;
	
	protected Log log = LogFactory.getLog(AdminSurveyQuestionServiceImpl.class);
	
 
	@Override
	public int setInsert(AdminSurveyQuestionVo domain) {
		
		long vo = adminsurveyQuestionMapper.setInsert(domain);
		
		return (int)domain.getIDX();
	}

	@Override
	public boolean setUpdate(AdminSurveyQuestionVo domain) {
		return adminsurveyQuestionMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(AdminSurveyQuestionVo domain) {
		return adminsurveyQuestionMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminsurveyQuestionMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		AdminSurveyQuestionVo vo = adminsurveyQuestionMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getsurveyQuestionIdCheck(String survey_questionId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminsurveyQuestionMapper.getListAll();
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map   = (HashMap) list.get(i);
			System.out.println("survey_questionId : " + survey_questionId);
			System.out.println("map.get(\"MEMBER_ID\") : " + map.get("MEMBER_ID"));
			if(map.get("MEMBER_ID").equals(survey_questionId))
			{
				return true;
			}
		}
		return false;
		
	}


	@Override
	public ModelMap getList(AdminSurveyQuestionVo adminsurveyQuestionVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminsurveyQuestionMapper.getList(adminsurveyQuestionVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = adminsurveyQuestionMapper.getListCnt(adminsurveyQuestionVo);
		
		int itemCount = adminsurveyQuestionVo.getITEM_COUNT();
		int itempage = adminsurveyQuestionVo.getPAGE();

		PageVO pageVo = new PageVO(itemCount, itemtotalcount, itempage);

		if (pageVo.isItempagenext() == true) {
			modelMap.put("itempagenext", "true");
		} else {
			modelMap.put("itempagenext", "false");
		}

		modelMap.put("page", pageVo.getItempage());
		modelMap.put("itemCount", pageVo.getItemCount());
		modelMap.put("itempagestart", pageVo.getItempagestart());
		modelMap.put("itempageend", pageVo.getItempageend());
		modelMap.put("itemtotalcount", pageVo.getItemtotalcount());
		modelMap.put("itemtotalpage", pageVo.getItemtotalpage());


		
		return modelMap;
		
	}

	@Override
	public ModelMap getListQuestionSelect(AdminSurveyQuestionVo adminSurveyQuestionVo) {
		
		ModelMap modelMap = new ModelMap();
		List<?> list = adminsurveyQuestionMapper.getList(adminSurveyQuestionVo);
		/*
		List listSelect = new ArrayList();
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map = (HashMap) list.get(i);
			Long idx = (Long) map.get("IDX");
			
			AdminSurveySelectVo adminsurveySelectVo = new AdminSurveySelectVo();
			adminsurveySelectVo.setSURVEY_QUESTION_IDX(idx+"");
			adminsurveySelectVo.setOFFSET(0);
			adminsurveySelectVo.setLIMIT(999999);
			List<?> list2 = adminSurveySeleteMapper.getList(adminsurveySelectVo);
			listSelect.add(list2);
			
			
		}*/
		modelMap.addAttribute("list", list);
		//modelMap.addAttribute("listSelect", listSelect);
		return modelMap;
	}

	
		
}
