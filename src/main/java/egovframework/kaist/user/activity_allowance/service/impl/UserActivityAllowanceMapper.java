package egovframework.kaist.user.activity_allowance.service.impl;

import java.util.ArrayList;
import java.util.List;

import egovframework.kaist.user.activity_allowance.model.UserActivityAllowanceVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userActivityAllowanceMapper")
public interface UserActivityAllowanceMapper {

	public List<?> getListAll();
	
	public int setInsert(UserActivityAllowanceVo userActivityAllowanceDomain);

	public boolean setUpdate(UserActivityAllowanceVo userActivityAllowanceDomain);

	public boolean setDelete(UserActivityAllowanceVo userActivityAllowanceDomain) ;

	public UserActivityAllowanceVo getView(String Id) ;

	public List<?> getList(UserActivityAllowanceVo userActivityAllowanceVo);

	public int getListCnt(UserActivityAllowanceVo userActivityAllowanceVo);

	public boolean setUpdateTypeToText(UserActivityAllowanceVo vo);
	
}
