package egovframework.kaist.user.survey.service.impl;


import java.util.ArrayList;

import java.util.List;

import egovframework.kaist.user.survey.model.UserSurveyVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userSurveyMapper")
public interface UserSurveyMapper {

	public List<?> getListAll();
	
	public int setInsert(UserSurveyVo userSurveyDomain);

	public boolean setUpdate(UserSurveyVo userSurveyDomain);

	public boolean setDelete(UserSurveyVo userSurveyDomain) ;

	public UserSurveyVo getView(String Id) ;

	public List<?> getList(UserSurveyVo userSurveyVo);

	public int getListCnt(UserSurveyVo userSurveyVo);
	
}
