package egovframework.kaist.user.program.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.user.program.model.UserProgramVo;

public interface UserProgramService {

	public int setInsert(UserProgramVo userProgramDomain);

	public boolean setUpdate(UserProgramVo userProgramDomain);
	
	public boolean setDelete(UserProgramVo userProgramDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getProgramIdCheck(String programId);

	public ModelMap getList(UserProgramVo userProgramVo);

	public ModelMap getListGroupByYear();

	public ModelMap getView2(String programid);

}
