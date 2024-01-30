package egovframework.kaist.admin.sms_log.service;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.sms_log.model.AdminSmsLogVo;
import egovframework.kaist.user.sms_log.model.UserSmsLogVo;

public interface AdminSmsLogService {

	public int setInsert(AdminSmsLogVo userSmsLogDomain);

	public boolean setUpdate(AdminSmsLogVo userSmsLogDomain);
	
	public boolean setDelete(AdminSmsLogVo userSmsLogDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getSmsLogIdCheck(String sms_logId);

	public ModelMap getList(AdminSmsLogVo adminSmsLogVo);

	public void setSendSms();

	public String smsSend(AdminSmsLogVo userSmsLogDomain) throws IOException, NoSuchAlgorithmException;



}
