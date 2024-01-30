package egovframework.kaist.user.survey_question.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.user.survey_question.model.UserSurveyQuestionVo;

public interface UserSurveyQuestionService {

	public int setInsert(UserSurveyQuestionVo userSurveyQuestionVo);

	public boolean setUpdate(UserSurveyQuestionVo userSurveyQuestionVo);
	
	public boolean setDelete(UserSurveyQuestionVo userSurveyQuestionVo);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getsurveyQuestionIdCheck(String survey_questionId);

	public ModelMap getList(UserSurveyQuestionVo userSurveyQuestionVo);

	public ModelMap getListQuestionSelect(UserSurveyQuestionVo userSurveyQuestionVo);

	
}
