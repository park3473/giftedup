package egovframework.kaist.admin.program.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.program.model.AdminProgramVo;

public interface AdminProgramService {

	public int setInsert(AdminProgramVo userProgramDomain);

	public boolean setUpdate(AdminProgramVo userProgramDomain);
	
	public boolean setDelete(AdminProgramVo userProgramDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getProgramIdCheck(String programId);

	public ModelMap getList(AdminProgramVo adminProgramVo);

	public ModelMap getListGroupByYear();

}
