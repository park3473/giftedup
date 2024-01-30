package egovframework.kaist.user.notices_data.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import egovframework.kaist.user.notices_data.model.UserNoticesDataVo;

public interface UserNoticesDataService {

	public int setInsert(UserNoticesDataVo userNoticesDataDomain);

	public boolean setUpdate(UserNoticesDataVo userNoticesDataDomain);
	
	public boolean setDelete(UserNoticesDataVo userNoticesDataDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getNoticesDataIdCheck(String notices_dataId);

	public ModelMap getList(UserNoticesDataVo adminNoticesDataVo);

	public ModelMap getBest(String notices);

	public List<UserNoticesDataVo> getHeaderPrList(UserNoticesDataVo userNoticesDataVo);

	public void setUpdateFile(UserNoticesDataVo userNoticesDataVo);

}
