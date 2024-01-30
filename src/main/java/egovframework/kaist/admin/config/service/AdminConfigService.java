package egovframework.kaist.admin.config.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.config.model.AdminConfigVo;

public interface AdminConfigService {

	public int setInsert(AdminConfigVo userLogDomain);

	public boolean setUpdate(AdminConfigVo userLogDomain);
	
	public boolean setDelete(AdminConfigVo userLogDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public ModelMap getList(AdminConfigVo adminConfigVo);


}
