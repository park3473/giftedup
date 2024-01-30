package egovframework.kaist.user.accept_log.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.user.accept_log.model.UserAcceptLogVo;

public interface UserAcceptLogService {

	public int setInsert(UserAcceptLogVo userLogDomain);

	public boolean setUpdate(UserAcceptLogVo userLogDomain);
	
	public boolean setDelete(UserAcceptLogVo userLogDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public ModelMap getList(UserAcceptLogVo userAcceptLogVo);


}
