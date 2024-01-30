package egovframework.kaist.user.survey_question.service.impl;

import java.util.List;

import egovframework.kaist.user.survey_question.model.UserSurveyQuestionVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userSurveyQuestionMapper")
public interface UserSurveyQuestionMapper {

	public List<?> getListAll();
	
	public long setInsert(UserSurveyQuestionVo usersurveyQuestionDomain);

	public boolean setUpdate(UserSurveyQuestionVo usersurveyQuestionDomain);

	public boolean setDelete(UserSurveyQuestionVo usersurveyQuestionDomain) ;

	public UserSurveyQuestionVo getView(String Id) ;

	public List<?> getList(UserSurveyQuestionVo usersurveyQuestionVo);

	public int getListCnt(UserSurveyQuestionVo usersurveyQuestionVo);
	
}
