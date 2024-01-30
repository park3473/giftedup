package egovframework.kaist.admin.popup.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.banner.model.AdminBannerVo;
import egovframework.kaist.admin.popup.model.AdminPopupVo;

public interface AdminPopupService {

	public int setInsert(AdminPopupVo userPopupDomain);

	public boolean setUpdate(AdminPopupVo userPopupDomain);
	
	public boolean setDelete(AdminPopupVo userPopupDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getPopupIdCheck(String popupId);

	public ModelMap getList(AdminPopupVo adminPopupVo);

	public ModelMap getListStartEndTM(AdminPopupVo adminPopupVo);

}
