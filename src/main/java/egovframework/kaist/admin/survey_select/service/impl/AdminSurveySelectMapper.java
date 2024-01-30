package egovframework.kaist.admin.survey_select.service.impl;

import java.util.ArrayList;
import java.util.List;

import egovframework.kaist.admin.survey_select.model.AdminSurveySelectVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminSurveySelectMapper")
public interface AdminSurveySelectMapper {

	public List<?> getListAll();
	
	public int setInsert(AdminSurveySelectVo AdminSurveySelectVo);

	public boolean setUpdate(AdminSurveySelectVo AdminSurveySelectVo);

	public boolean setDelete(AdminSurveySelectVo AdminSurveySelectVo) ;

	public AdminSurveySelectVo getView(String Id) ;

	public List<?> getList(AdminSurveySelectVo AdminSurveySelectVo);

	public int getListCnt(AdminSurveySelectVo AdminSurveySelectVo);
	
}
