package egovframework.kaist.user.sms_log.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.user.sms_log.model.UserSmsLogVo;

public interface UserSmsLogService {

	public int setInsert(UserSmsLogVo userSmsLogDomain);

	public boolean setUpdate(UserSmsLogVo userSmsLogDomain);
	
	public boolean setDelete(UserSmsLogVo userSmsLogDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getSmsLogIdCheck(String sms_logId);

	public ModelMap getList(UserSmsLogVo userSmsLogVo);

	public ModelMap getViewLast(String member_ID);

}
