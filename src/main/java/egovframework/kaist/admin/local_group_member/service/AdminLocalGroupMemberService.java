package egovframework.kaist.admin.local_group_member.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.local_group.model.AdminLocalGroupVo;
import egovframework.kaist.admin.local_group_member.model.AdminLocalGroupMemberVo;

public interface AdminLocalGroupMemberService {

	public int setInsert(AdminLocalGroupMemberVo userLocalGroupMemberDomain);

	public boolean setUpdate(AdminLocalGroupMemberVo userLocalGroupMemberDomain);
	
	public boolean setDelete(AdminLocalGroupMemberVo userLocalGroupMemberDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getLocalGroupMemberIdCheck(String local_group_memberId);

	public ModelMap getList(AdminLocalGroupMemberVo adminLocalGroupMemberVo);

	public ModelMap getListNotGroupMemberId(AdminLocalGroupVo vo);

}
