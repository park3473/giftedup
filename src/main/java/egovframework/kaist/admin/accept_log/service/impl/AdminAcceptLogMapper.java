package egovframework.kaist.admin.accept_log.service.impl;

import java.util.List;

import egovframework.kaist.admin.accept_log.model.AdminAcceptLogVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminAcceptLogMapper")
public interface AdminAcceptLogMapper {

	public List<?> getListAll();
	
	public int setInsert(AdminAcceptLogVo userAcceptLogDomain);

	public boolean setUpdate(AdminAcceptLogVo userAcceptLogDomain);

	public boolean setDelete(AdminAcceptLogVo userAcceptLogDomain) ;

	public AdminAcceptLogVo getView(String Id) ;

	public List<?> getList(AdminAcceptLogVo adminAcceptLogVo);
	
}
