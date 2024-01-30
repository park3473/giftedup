package egovframework.kaist.user.activity_allowance.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.user.activity_allowance.model.UserActivityAllowanceVo;

public interface UserActivityAllowanceService {

	public int setInsert(UserActivityAllowanceVo userActivityAllowanceDomain);

	public boolean setUpdate(UserActivityAllowanceVo userActivityAllowanceDomain);
	
	public boolean setDelete(UserActivityAllowanceVo userActivityAllowanceDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getActivityAllowanceIdCheck(String activity_allowanceId);

	public ModelMap getList(UserActivityAllowanceVo userActivityAllowanceVo);

	public boolean setUpdateTypeToText(UserActivityAllowanceVo vo);

}
