package egovframework.kaist.admin.survey_answer.service.impl;

import java.util.HashMap;
import java.util.List;

import egovframework.kaist.admin.survey_answer.model.AdminSurveyAnswerVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminSurveyAnswerMapper")
public interface AdminSurveyAnswerMapper {

	public List<?> getListAll();
	
	public int setInsert(AdminSurveyAnswerVo adminSurveyAnswerDomain);

	public boolean setUpdate(AdminSurveyAnswerVo adminSurveyAnswerDomain);

	public boolean setDelete(AdminSurveyAnswerVo adminSurveyAnswerDomain) ;

	public AdminSurveyAnswerVo getView(String Id) ;

	public List<?> getList(AdminSurveyAnswerVo adminSurveyAnswerVo);

	public int getListCnt(AdminSurveyAnswerVo adminSurveyAnswerVo);

	public List<HashMap> getListMemberAll(String surveyid);

	public List<HashMap> getListStat(AdminSurveyAnswerVo adminSurveyAnswerVo);
	
}
