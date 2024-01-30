package egovframework.kaist.admin.survey_answer.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.survey_answer.model.AdminSurveyAnswerVo;



public interface AdminSurveyAnswerService {

	public int setInsert(AdminSurveyAnswerVo adminSurveyAnswerDomain);

	public boolean setUpdate(AdminSurveyAnswerVo adminSurveyAnswerDomain);
	
	public boolean setDelete(AdminSurveyAnswerVo adminSurveyAnswerDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getSurveyAnswerIdCheck(String survey_answerId);

	public ModelMap getList(AdminSurveyAnswerVo adminSurveyAnswerVo);

	public List<HashMap> getListMemberAll(String surveyid);

	public List<HashMap> getListStat(AdminSurveyAnswerVo adminSurveyAnswerVo);

}
