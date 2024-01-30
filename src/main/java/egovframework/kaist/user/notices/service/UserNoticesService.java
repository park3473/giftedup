package egovframework.kaist.user.notices.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.user.notices.model.UserNoticesVo;

public interface UserNoticesService {

	public int setInsert(UserNoticesVo userNoticesDomain);

	public boolean setUpdate(UserNoticesVo userNoticesDomain);
	
	public boolean setDelete(UserNoticesVo userNoticesDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getNoticesIdCheck(String noticesId);

	public ModelMap getList(UserNoticesVo userNoticesVo);

}
