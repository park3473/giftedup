package egovframework.kaist.user.survey_questionnaire.service.impl;

import java.util.ArrayList;
import java.util.List;

import egovframework.kaist.user.survey_questionnaire.model.UserSurveyQuestionnaireVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userSurveyQuestionnaireMapper")
public interface UserSurveyQuestionnaireMapper {

	public List<?> getListAll();
	
	public int setInsert(UserSurveyQuestionnaireVo userSurveyQuestionnaireDomain);

	public boolean setUpdate(UserSurveyQuestionnaireVo userSurveyQuestionnaireDomain);

	public boolean setDelete(UserSurveyQuestionnaireVo userSurveyQuestionnaireDomain) ;

	public UserSurveyQuestionnaireVo getView(String Id) ;

	public List<?> getList(UserSurveyQuestionnaireVo userSurveyQuestionnaireVo);

	public int getListCnt(UserSurveyQuestionnaireVo userSurveyQuestionnaireVo);
	
}
