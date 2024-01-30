package egovframework.kaist.admin.program_apply.service.impl;

import java.util.ArrayList;
import java.util.List;

import egovframework.kaist.admin.program.model.AdminProgramVo;
import egovframework.kaist.admin.program_apply.model.AdminProgramApplyVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminProgramApplyMapper")
public interface AdminProgramApplyMapper {

	public List<?> getListAll();
	
	public int setInsert(AdminProgramApplyVo userProgramApplyDomain);

	public boolean setUpdate(AdminProgramApplyVo userProgramApplyDomain);

	public boolean setDelete(AdminProgramApplyVo userProgramApplyDomain) ;

	public AdminProgramApplyVo getView(String Id) ;

	public List<?> getList(AdminProgramVo adminProgramVo);

	public int getListCnt(AdminProgramVo adminProgramVo);
	
}
