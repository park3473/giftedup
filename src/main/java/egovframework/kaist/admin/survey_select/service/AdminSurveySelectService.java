package egovframework.kaist.admin.survey_select.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.survey_select.model.AdminSurveySelectVo;

public interface AdminSurveySelectService {

	public int setInsert(AdminSurveySelectVo usersurveySelectDomain);

	public boolean setUpdate(AdminSurveySelectVo usersurveySelectDomain);
	
	public boolean setDelete(AdminSurveySelectVo usersurveySelectDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getsurveySelectIdCheck(String survey_selectId);

	public ModelMap getList(AdminSurveySelectVo adminsurveySelectVo);

}
