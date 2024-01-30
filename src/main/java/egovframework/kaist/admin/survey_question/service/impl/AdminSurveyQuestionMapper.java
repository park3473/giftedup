package egovframework.kaist.admin.survey_question.service.impl;

import java.util.ArrayList;
import java.util.List;

import egovframework.kaist.admin.survey_question.model.AdminSurveyQuestionVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminSurveyQuestionMapper")
public interface AdminSurveyQuestionMapper {

	public List<?> getListAll();
	
	public long setInsert(AdminSurveyQuestionVo usersurveyQuestionDomain);

	public boolean setUpdate(AdminSurveyQuestionVo usersurveyQuestionDomain);

	public boolean setDelete(AdminSurveyQuestionVo usersurveyQuestionDomain) ;

	public AdminSurveyQuestionVo getView(String Id) ;

	public List<?> getList(AdminSurveyQuestionVo adminsurveyQuestionVo);

	public int getListCnt(AdminSurveyQuestionVo adminsurveyQuestionVo);
	
}
