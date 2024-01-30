package egovframework.kaist.admin.survey.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.survey.model.AdminSurveyVo;

public interface AdminSurveyService {

	public int setInsert(AdminSurveyVo userSurveyDomain);

	public boolean setUpdate(AdminSurveyVo userSurveyDomain);
	
	public boolean setDelete(AdminSurveyVo userSurveyDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getSurveyIdCheck(String surveyId);

	public ModelMap getList(AdminSurveyVo adminSurveyVo);

}
