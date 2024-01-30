package egovframework.kaist.admin.notices_data.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.notices_data.model.AdminNoticesDataVo;

public interface AdminNoticesDataService {

	public int setInsert(AdminNoticesDataVo userNoticesDataDomain);

	public boolean setUpdate(AdminNoticesDataVo userNoticesDataDomain);
	
	public boolean setDelete(AdminNoticesDataVo userNoticesDataDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getNoticesDataIdCheck(String notices_dataId);

	public ModelMap getList(AdminNoticesDataVo adminNoticesDataVo);

}
