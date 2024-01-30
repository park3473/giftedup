package egovframework.kaist.admin.banner.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.banner.model.AdminBannerVo;

public interface AdminBannerService {

	public int setInsert(AdminBannerVo userBannerDomain);

	public boolean setUpdate(AdminBannerVo userBannerDomain);
	
	public boolean setDelete(AdminBannerVo userBannerDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getBannerIdCheck(String bannerId);

	public ModelMap getList(AdminBannerVo adminBannerVo);

	public ModelMap getListStartEndTM(AdminBannerVo adminBannerVo);

}
