package egovframework.kaist.admin.activity_allowance.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.activity_allowance.model.AdminActivityAllowanceVo;

public interface AdminActivityAllowanceService {

	public int setInsert(AdminActivityAllowanceVo userActivityAllowanceDomain);

	public boolean setUpdate(AdminActivityAllowanceVo userActivityAllowanceDomain);
	
	public boolean setDelete(AdminActivityAllowanceVo userActivityAllowanceDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getActivityAllowanceIdCheck(String activity_allowanceId);

	public ModelMap getList(AdminActivityAllowanceVo adminActivityAllowanceVo);

	public boolean setUpdateTypeToText(AdminActivityAllowanceVo vo);

	public ModelMap getListMemberIdIn(String mEMBER_ID);

}
