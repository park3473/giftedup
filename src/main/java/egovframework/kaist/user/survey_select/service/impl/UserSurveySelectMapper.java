package egovframework.kaist.user.survey_select.service.impl;

import java.util.ArrayList;
import java.util.List;

import egovframework.kaist.user.survey_select.model.UserSurveySelectVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userSurveySelectMapper")
public interface UserSurveySelectMapper {

	public List<?> getListAll();
	
	public int setInsert(UserSurveySelectVo UserSurveySelectVo);

	public boolean setUpdate(UserSurveySelectVo UserSurveySelectVo);

	public boolean setDelete(UserSurveySelectVo UserSurveySelectVo) ;

	public UserSurveySelectVo getView(String Id) ;

	public List<?> getList(UserSurveySelectVo UserSurveySelectVo);

	public int getListCnt(UserSurveySelectVo UserSurveySelectVo);
	
}
