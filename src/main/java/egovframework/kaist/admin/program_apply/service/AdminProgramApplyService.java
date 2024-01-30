package egovframework.kaist.admin.program_apply.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.program.model.AdminProgramVo;
import egovframework.kaist.admin.program_apply.model.AdminProgramApplyVo;

public interface AdminProgramApplyService {

	public int setInsert(AdminProgramApplyVo userProgramApplyDomain);

	public boolean setUpdate(AdminProgramApplyVo userProgramApplyDomain);
	
	public boolean setDelete(AdminProgramApplyVo userProgramApplyDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getProgramApplyIdCheck(String program_applyId);

	public ModelMap getList(AdminProgramVo adminProgramVo);

}
