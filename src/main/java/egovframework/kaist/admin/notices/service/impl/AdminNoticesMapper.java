package egovframework.kaist.admin.notices.service.impl;

import java.util.ArrayList;
import java.util.List;

import egovframework.kaist.admin.notices.model.AdminNoticesVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminNoticesMapper")
public interface AdminNoticesMapper {

	public List<?> getListAll();
	
	public int setInsert(AdminNoticesVo userNoticesDomain);

	public boolean setUpdate(AdminNoticesVo userNoticesDomain);

	public boolean setDelete(AdminNoticesVo userNoticesDomain) ;

	public AdminNoticesVo getView(String Id) ;

	public List<?> getList(AdminNoticesVo adminNoticesVo);

	public int getListCnt(AdminNoticesVo adminNoticesVo);
	
}
