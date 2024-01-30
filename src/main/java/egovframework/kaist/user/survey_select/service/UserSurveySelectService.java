package egovframework.kaist.user.survey_select.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.user.survey_select.model.UserSurveySelectVo;

public interface UserSurveySelectService {

	public int setInsert(UserSurveySelectVo usersurveySelectDomain);

	public boolean setUpdate(UserSurveySelectVo usersurveySelectDomain);
	
	public boolean setDelete(UserSurveySelectVo usersurveySelectDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getsurveySelectIdCheck(String survey_selectId);

	public ModelMap getList(UserSurveySelectVo usersurveySelectVo);

}
