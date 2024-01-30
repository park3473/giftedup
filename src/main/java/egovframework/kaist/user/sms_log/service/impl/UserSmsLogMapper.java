package egovframework.kaist.user.sms_log.service.impl;

import java.util.ArrayList;
import java.util.List;

import egovframework.kaist.user.sms_log.model.UserSmsLogVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userSmsLogMapper")
public interface UserSmsLogMapper {

	public List<?> getListAll();
	
	public int setInsert(UserSmsLogVo userSmsLogDomain);

	public boolean setUpdate(UserSmsLogVo userSmsLogDomain);

	public boolean setDelete(UserSmsLogVo userSmsLogDomain) ;

	public UserSmsLogVo getView(String Id) ;

	public List<?> getList(UserSmsLogVo userSmsLogVo);

	public int getListCnt(UserSmsLogVo userSmsLogVo);

	public UserSmsLogVo getViewLast(String member_ID);
	
}
