package egovframework.kaist.admin.config.service.impl;

import java.util.List;

import egovframework.kaist.admin.config.model.AdminConfigVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminConfigMapper")
public interface AdminConfigMapper {

	public List<?> getListAll();
	
	public int setInsert(AdminConfigVo userConfigDomain);

	public boolean setUpdate(AdminConfigVo userConfigDomain);

	public boolean setDelete(AdminConfigVo userConfigDomain) ;

	public AdminConfigVo getView(String Id) ;

	public List<?> getList(AdminConfigVo adminConfigVo);
	
}
