package egovframework.kaist.user.survey_question.service.impl;
 

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.kaist.user.survey_question.model.UserSurveyQuestionVo;
import egovframework.kaist.user.survey_question.service.UserSurveyQuestionService;
import egovframework.kaist.user.survey_questionnaire.model.UserSurveyQuestionnaireVo;
import egovframework.kaist.user.survey_questionnaire.service.impl.UserSurveyQuestionnaireMapper;
import egovframework.kaist.user.survey_select.service.impl.UserSurveySelectMapper;

@Service("userSurveyQuestionService")
@Transactional
public class UserSurveyQuestionServiceImpl implements UserSurveyQuestionService {

	@Resource(name = "userSurveyQuestionnaireMapper")
	private UserSurveyQuestionnaireMapper userSurveyQuestionnaireMapper;
	
	@Resource(name = "userSurveyQuestionMapper")
	private UserSurveyQuestionMapper usersurveyQuestionMapper;
	
	
	@Resource(name = "userSurveySelectMapper")
	private UserSurveySelectMapper userSurveySeleteMapper;
	
	protected Log log = LogFactory.getLog(UserSurveyQuestionServiceImpl.class);
	
 
	@Override
	public int setInsert(UserSurveyQuestionVo domain) {
		
		long vo = usersurveyQuestionMapper.setInsert(domain);
		
		return (int)domain.getIDX();
	}

	@Override
	public boolean setUpdate(UserSurveyQuestionVo domain) {
		return usersurveyQuestionMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(UserSurveyQuestionVo domain) {
		return usersurveyQuestionMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = usersurveyQuestionMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		UserSurveyQuestionVo vo = usersurveyQuestionMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getsurveyQuestionIdCheck(String survey_questionId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = usersurveyQuestionMapper.getListAll();
		
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
	public ModelMap getList(UserSurveyQuestionVo usersurveyQuestionVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = usersurveyQuestionMapper.getList(usersurveyQuestionVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = usersurveyQuestionMapper.getListCnt(usersurveyQuestionVo);
		
		int itemCount = usersurveyQuestionVo.getITEM_COUNT();
		int itempage = usersurveyQuestionVo.getPAGE();

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
	public ModelMap getListQuestionSelect(UserSurveyQuestionVo userSurveyQuestionVo) {
		
		ModelMap modelMap = new ModelMap();
		List<?> list = usersurveyQuestionMapper.getList(userSurveyQuestionVo);
		
		modelMap.addAttribute("list", list);
		//modelMap.addAttribute("listSelect", listSelect);
		return modelMap;
	}

	
		
}
