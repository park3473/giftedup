package egovframework.kaist.user.survey_answer.service.impl;

import java.util.List;

import egovframework.kaist.user.survey_answer.model.UserSurveyAnswerVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userSurveyAnswerMapper")
public interface UserSurveyAnswerMapper {

	public List<?> getListAll();
	
	public int setInsert(UserSurveyAnswerVo userSurveyAnswerDomain);

	public boolean setUpdate(UserSurveyAnswerVo userSurveyAnswerDomain);

	public boolean setDelete(UserSurveyAnswerVo userSurveyAnswerDomain) ;

	public UserSurveyAnswerVo getView(String Id) ;

	public List<?> getList(UserSurveyAnswerVo userSurveyAnswerVo);

	public int getListCnt(UserSurveyAnswerVo userSurveyAnswerVo);
	
}
