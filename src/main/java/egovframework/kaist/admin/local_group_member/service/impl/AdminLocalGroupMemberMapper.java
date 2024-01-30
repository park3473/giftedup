package egovframework.kaist.admin.local_group_member.service.impl;

import java.util.ArrayList;
import java.util.List;

import egovframework.kaist.admin.local_group.model.AdminLocalGroupVo;
import egovframework.kaist.admin.local_group_member.model.AdminLocalGroupMemberVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminLocalGroupMemberMapper")
public interface AdminLocalGroupMemberMapper {

	public List<?> getListAll();
	
	public int setInsert(AdminLocalGroupMemberVo userLocalGroupMemberDomain);

	public boolean setUpdate(AdminLocalGroupMemberVo userLocalGroupMemberDomain);

	public boolean setDelete(AdminLocalGroupMemberVo userLocalGroupMemberDomain) ;

	public AdminLocalGroupMemberVo getView(String Id) ;

	public List<?> getList(AdminLocalGroupMemberVo adminLocalGroupMemberVo);

	public int getListCnt(AdminLocalGroupMemberVo adminLocalGroupMemberVo);

	public boolean setDeleteGroupIdx(AdminLocalGroupVo adminlocalGroupVo);

	public int getPortfolioCnt(String memberId);
	
}
