package egovframework.kaist.user.survey_answer.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.user.survey_answer.model.UserSurveyAnswerVo;

public interface UserSurveyAnswerService {

	public int setInsert(UserSurveyAnswerVo userSurveyAnswerDomain);

	public boolean setUpdate(UserSurveyAnswerVo userSurveyAnswerDomain);
	
	public boolean setDelete(UserSurveyAnswerVo userSurveyAnswerDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getSurveyAnswerIdCheck(String survey_answerId);

	public ModelMap getList(UserSurveyAnswerVo userSurveyAnswerVo);

}
