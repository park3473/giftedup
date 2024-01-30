package egovframework.kaist.admin.accept_log.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.accept_log.model.AdminAcceptLogVo;

public interface AdminAcceptLogService {

	public int setInsert(AdminAcceptLogVo userLogDomain);

	public boolean setUpdate(AdminAcceptLogVo userLogDomain);
	
	public boolean setDelete(AdminAcceptLogVo userLogDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public ModelMap getList(AdminAcceptLogVo adminAcceptLogVo);


}
