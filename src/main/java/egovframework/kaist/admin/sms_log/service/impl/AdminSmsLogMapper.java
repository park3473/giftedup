package egovframework.kaist.admin.sms_log.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import egovframework.kaist.admin.sms_log.model.AdminSmsLogVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminSmsLogMapper")
public interface AdminSmsLogMapper {

	public List<?> getListAll();
	
	public int setInsert(AdminSmsLogVo userSmsLogDomain);

	public boolean setUpdate(AdminSmsLogVo userSmsLogDomain);

	public boolean setDelete(AdminSmsLogVo userSmsLogDomain) ;

	public AdminSmsLogVo getView(String Id) ;

	public List<?> getList(AdminSmsLogVo adminSmsLogVo);

	public int getListCnt(AdminSmsLogVo adminSmsLogVo);

	public List<?> getListSmsSend();

	public void setUpdateSend(HashMap smsMap);
	
}
