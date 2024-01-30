package egovframework.kaist.admin.buseo.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.buseo.model.AdminBuseoVo;

public interface AdminBuseoService {

	public int setInsert(AdminBuseoVo userBuseoDomain);

	public boolean setUpdate(AdminBuseoVo userBuseoDomain);
	
	public boolean setDelete(AdminBuseoVo userBuseoDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	ModelMap getListBuseoMemberAll();

	public ModelMap getListBuseoMemberAgentAll();

	public void setInsertToUpdate(AdminBuseoVo vo);

}
