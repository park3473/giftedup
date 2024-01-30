package egovframework.kaist.user.survey.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.user.survey.model.UserSurveyVo;

public interface UserSurveyService {

	public int setInsert(UserSurveyVo userSurveyDomain);

	public boolean setUpdate(UserSurveyVo userSurveyDomain);
	
	public boolean setDelete(UserSurveyVo userSurveyDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getSurveyIdCheck(String surveyId);

	public ModelMap getList(UserSurveyVo userSurveyVo);

}
