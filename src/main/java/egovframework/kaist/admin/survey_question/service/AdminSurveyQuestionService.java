package egovframework.kaist.admin.survey_question.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.survey_question.model.AdminSurveyQuestionVo;

public interface AdminSurveyQuestionService {

	public int setInsert(AdminSurveyQuestionVo adminSurveyQuestionVo);

	public boolean setUpdate(AdminSurveyQuestionVo adminSurveyQuestionVo);
	
	public boolean setDelete(AdminSurveyQuestionVo adminSurveyQuestionVo);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getsurveyQuestionIdCheck(String survey_questionId);

	public ModelMap getList(AdminSurveyQuestionVo adminSurveyQuestionVo);

	public ModelMap getListQuestionSelect(AdminSurveyQuestionVo adminSurveyQuestionVo);

	
}
