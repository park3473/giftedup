package egovframework.kaist.user.survey_questionnaire.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.user.survey_questionnaire.model.UserSurveyQuestionnaireVo;

public interface UserSurveyQuestionnaireService {

	public int setInsert(UserSurveyQuestionnaireVo userSurveyQuestionnaireDomain);

	public boolean setUpdate(UserSurveyQuestionnaireVo userSurveyQuestionnaireDomain);
	
	public boolean setDelete(UserSurveyQuestionnaireVo userSurveyQuestionnaireDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getSurveyQuestionnaireIdCheck(String survey_questionnaireId);

	public ModelMap getList(UserSurveyQuestionnaireVo userSurveyQuestionnaireVo);


}
