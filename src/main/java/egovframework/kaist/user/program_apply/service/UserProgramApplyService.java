package egovframework.kaist.user.program_apply.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.user.program.model.UserProgramVo;
import egovframework.kaist.user.program_apply.model.UserProgramApplyVo;

public interface UserProgramApplyService {

	public int setInsert(UserProgramApplyVo userProgramApplyDomain);

	public boolean setUpdate(UserProgramApplyVo userProgramApplyDomain);
	
	public boolean setDelete(UserProgramApplyVo userProgramApplyDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getProgramApplyIdCheck(String program_applyId);

	public ModelMap getList(UserProgramVo userProgramVo);

	public ModelMap getApplyView(UserProgramApplyVo userProgramApplyDomain);

}
