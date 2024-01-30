package egovframework.kaist.admin.notices.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.notices.model.AdminNoticesVo;

public interface AdminNoticesService {

	public int setInsert(AdminNoticesVo userNoticesDomain);

	public boolean setUpdate(AdminNoticesVo userNoticesDomain);
	
	public boolean setDelete(AdminNoticesVo userNoticesDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getNoticesIdCheck(String noticesId);

	public ModelMap getList(AdminNoticesVo adminNoticesVo);

}
