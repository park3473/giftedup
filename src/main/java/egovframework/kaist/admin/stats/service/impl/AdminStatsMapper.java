package egovframework.kaist.admin.stats.service.impl;

import java.util.ArrayList;
import java.util.List;

import egovframework.kaist.admin.survey_question.model.AdminSurveyQuestionVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminStatsMapper")
public interface AdminStatsMapper {

	public List<?> getListADDRESS_LOCAL(String type);
	
	public List<?> getListSEX(String type);
	
	public List<?> getListSCHOOL_TYPE(String type);

	public List<?> getListSCHOOL_GROUP(String string);
	
	
}
