package egovframework.kaist.admin.survey_questionnaire.service.impl;

import java.util.ArrayList;
import java.util.List;

import egovframework.kaist.admin.survey_questionnaire.model.AdminSurveyQuestionnaireVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminSurveyQuestionnaireMapper")
public interface AdminSurveyQuestionnaireMapper {

	public List<?> getListAll();
	
	public int setInsert(AdminSurveyQuestionnaireVo userSurveyQuestionnaireDomain);

	public boolean setUpdate(AdminSurveyQuestionnaireVo userSurveyQuestionnaireDomain);

	public boolean setDelete(AdminSurveyQuestionnaireVo userSurveyQuestionnaireDomain) ;

	public AdminSurveyQuestionnaireVo getView(String Id) ;

	public List<?> getList(AdminSurveyQuestionnaireVo adminSurveyQuestionnaireVo);

	public int getListCnt(AdminSurveyQuestionnaireVo adminSurveyQuestionnaireVo);
	
}
