package egovframework.kaist.admin.program.service.impl;

import java.util.ArrayList;
import java.util.List;

import egovframework.kaist.admin.program.model.AdminProgramVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminProgramMapper")
public interface AdminProgramMapper {

	public List<?> getListAll();
	
	public int setInsert(AdminProgramVo userProgramDomain);

	public boolean setUpdate(AdminProgramVo userProgramDomain);

	public boolean setDelete(AdminProgramVo userProgramDomain) ;

	public AdminProgramVo getView(String Id) ;

	public List<?> getList(AdminProgramVo adminProgramVo);

	public int getListCnt(AdminProgramVo adminProgramVo);

	public List<?> getListGroupByYear();
	
}
