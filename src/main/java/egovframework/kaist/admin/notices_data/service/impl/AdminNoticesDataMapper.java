package egovframework.kaist.admin.notices_data.service.impl;

import java.util.ArrayList;
import java.util.List;

import egovframework.kaist.admin.notices_data.model.AdminNoticesDataVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminNoticesDataMapper")
public interface AdminNoticesDataMapper {

	public List<?> getListAll();
	
	public int setInsert(AdminNoticesDataVo userNoticesDataDomain);

	public boolean setUpdate(AdminNoticesDataVo userNoticesDataDomain);

	public boolean setDelete(AdminNoticesDataVo userNoticesDataDomain) ;

	public AdminNoticesDataVo getView(String Id) ;

	public List<?> getList(AdminNoticesDataVo adminNoticesDataVo);

	public int getListCnt(AdminNoticesDataVo adminNoticesDataVo);
	
}
