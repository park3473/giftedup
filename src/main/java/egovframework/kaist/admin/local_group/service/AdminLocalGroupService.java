package egovframework.kaist.admin.local_group.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.local_group.model.AdminLocalGroupVo;

public interface AdminLocalGroupService {

	public int setInsert(AdminLocalGroupVo userlocalGroupDomain);

	public boolean setUpdate(AdminLocalGroupVo userlocalGroupDomain);
	
	public boolean setDelete(AdminLocalGroupVo userlocalGroupDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getlocalGroupIdCheck(String local_groupId);

	public ModelMap getList(AdminLocalGroupVo adminlocalGroupVo);

	public ModelMap getListGroupMemberId();

	public boolean setDeleteGroupIdx(AdminLocalGroupVo adminlocalGroupVo);

}
