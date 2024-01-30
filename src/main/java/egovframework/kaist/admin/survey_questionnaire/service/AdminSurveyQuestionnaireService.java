package egovframework.kaist.admin.survey_questionnaire.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.survey_questionnaire.model.AdminSurveyQuestionnaireVo;

public interface AdminSurveyQuestionnaireService {

	public int setInsert(AdminSurveyQuestionnaireVo userSurveyQuestionnaireDomain);

	public boolean setUpdate(AdminSurveyQuestionnaireVo userSurveyQuestionnaireDomain);
	
	public boolean setDelete(AdminSurveyQuestionnaireVo userSurveyQuestionnaireDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getSurveyQuestionnaireIdCheck(String survey_questionnaireId);

	public ModelMap getList(AdminSurveyQuestionnaireVo adminSurveyQuestionnaireVo);

	 ModelMap getListZtreeAll(AdminSurveyQuestionnaireVo adminSurveyQuestionnaireVo);
}
