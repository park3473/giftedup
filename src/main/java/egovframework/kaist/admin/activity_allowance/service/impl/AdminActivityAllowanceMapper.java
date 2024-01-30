package egovframework.kaist.admin.activity_allowance.service.impl;

import java.util.ArrayList;
import java.util.List;

import egovframework.kaist.admin.activity_allowance.model.AdminActivityAllowanceVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminActivityAllowanceMapper")
public interface AdminActivityAllowanceMapper {

	public List<?> getListAll();
	
	public int setInsert(AdminActivityAllowanceVo userActivityAllowanceDomain);

	public boolean setUpdate(AdminActivityAllowanceVo userActivityAllowanceDomain);

	public boolean setDelete(AdminActivityAllowanceVo userActivityAllowanceDomain) ;

	public AdminActivityAllowanceVo getView(String Id) ;

	public List<?> getList(AdminActivityAllowanceVo adminActivityAllowanceVo);

	public int getListCnt(AdminActivityAllowanceVo adminActivityAllowanceVo);

	public boolean setUpdateTypeToText(AdminActivityAllowanceVo vo);

	public List<?> getListMemberIdIn(String mEMBER_ID);
	
}
