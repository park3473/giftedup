package egovframework.kaist.user.survey_questionnaire.service.impl;
 

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.kaist.user.survey_question.service.impl.UserSurveyQuestionMapper;
import egovframework.kaist.user.survey_questionnaire.model.UserSurveyQuestionnaireVo;
import egovframework.kaist.user.survey_questionnaire.service.UserSurveyQuestionnaireService;
import egovframework.kaist.user.survey_select.service.impl.UserSurveySelectMapper;

@Service("userSurveyQuestionnaireService")
@Transactional
public class UserSurveyQuestionnaireServiceImpl implements UserSurveyQuestionnaireService {

	

	@Resource(name = "userSurveyQuestionnaireMapper")
	private UserSurveyQuestionnaireMapper userSurveyQuestionnaireMapper;
	
	@Resource(name = "userSurveyQuestionMapper")
	private UserSurveyQuestionMapper usersurveyQuestionMapper;
	
	
	@Resource(name = "userSurveySelectMapper")
	private UserSurveySelectMapper userSurveySeleteMapper;
	
	protected Log log = LogFactory.getLog(UserSurveyQuestionnaireServiceImpl.class);
	
 
	@Override
	public int setInsert(UserSurveyQuestionnaireVo domain) {
		return userSurveyQuestionnaireMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(UserSurveyQuestionnaireVo domain) {
		return userSurveyQuestionnaireMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(UserSurveyQuestionnaireVo domain) {
		return userSurveyQuestionnaireMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = userSurveyQuestionnaireMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		UserSurveyQuestionnaireVo vo = userSurveyQuestionnaireMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getSurveyQuestionnaireIdCheck(String survey_questionnaireId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userSurveyQuestionnaireMapper.getListAll();
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map   = (HashMap) list.get(i);
			System.out.println("survey_questionnaireId : " + survey_questionnaireId);
			System.out.println("map.get(\"MEMBER_ID\") : " + map.get("MEMBER_ID"));
			if(map.get("MEMBER_ID").equals(survey_questionnaireId))
			{
				return true;
			}
		}
		return false;
		
	}


	@Override
	public ModelMap getList(UserSurveyQuestionnaireVo userSurveyQuestionnaireVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userSurveyQuestionnaireMapper.getList(userSurveyQuestionnaireVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = userSurveyQuestionnaireMapper.getListCnt(userSurveyQuestionnaireVo);
		
		int itemCount = userSurveyQuestionnaireVo.getITEM_COUNT();
		int itempage = userSurveyQuestionnaireVo.getPAGE();

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

		
}
