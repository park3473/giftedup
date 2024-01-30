package egovframework.kaist.admin.stats.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.survey_question.model.AdminSurveyQuestionVo;

public interface AdminStatsService {

	public ModelMap getListADDRESS_LOCAL(String type);

	public ModelMap getListSEX(String type);

	public ModelMap getListSCHOOL_TYPE(String type);

	public ModelMap getListSCHOOL_GROUP(String string);

}
