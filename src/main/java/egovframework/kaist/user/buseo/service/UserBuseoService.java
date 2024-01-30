package egovframework.kaist.user.buseo.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.user.buseo.model.UserBuseoVo;

public interface UserBuseoService {

	public int setInsert(UserBuseoVo userBuseoDomain);

	public boolean setUpdate(UserBuseoVo userBuseoDomain);
	
	public boolean setDelete(UserBuseoVo userBuseoDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	ModelMap getListBuseoMemberAll();

	public ModelMap getListBuseoMemberAgentAll();

	public void setInsertToUpdate(UserBuseoVo vo);

}
