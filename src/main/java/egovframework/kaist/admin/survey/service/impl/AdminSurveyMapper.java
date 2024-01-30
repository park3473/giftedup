package egovframework.kaist.admin.survey.service.impl;

import java.util.ArrayList;
import java.util.List;

import egovframework.kaist.admin.survey.model.AdminSurveyVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminSurveyMapper")
public interface AdminSurveyMapper {

	public List<?> getListAll();
	
	public int setInsert(AdminSurveyVo userSurveyDomain);

	public boolean setUpdate(AdminSurveyVo userSurveyDomain);

	public boolean setDelete(AdminSurveyVo userSurveyDomain) ;

	public AdminSurveyVo getView(String Id) ;

	public List<?> getList(AdminSurveyVo adminSurveyVo);

	public int getListCnt(AdminSurveyVo adminSurveyVo);
	
}
