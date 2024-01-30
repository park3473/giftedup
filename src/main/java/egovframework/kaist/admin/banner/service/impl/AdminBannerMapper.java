package egovframework.kaist.admin.banner.service.impl;

import java.util.ArrayList;
import java.util.List;

import egovframework.kaist.admin.banner.model.AdminBannerVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminBannerMapper")
public interface AdminBannerMapper {

	public List<?> getListAll();
	
	public int setInsert(AdminBannerVo userBannerDomain);

	public boolean setUpdate(AdminBannerVo userBannerDomain);

	public boolean setDelete(AdminBannerVo userBannerDomain) ;

	public AdminBannerVo getView(String Id) ;

	public List<?> getList(AdminBannerVo adminBannerVo);

	public int getListCnt(AdminBannerVo adminBannerVo);

	public List<?> getListStartEndTM();
	
}
