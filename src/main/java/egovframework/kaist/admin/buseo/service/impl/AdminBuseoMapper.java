package egovframework.kaist.admin.buseo.service.impl;

import java.util.List;

import egovframework.kaist.admin.buseo.model.AdminBuseoVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminBuseoMapper")
public interface AdminBuseoMapper {

	public List<?> getListAll();
	
	public int setInsert(AdminBuseoVo userBuseoDomain);

	public boolean setUpdate(AdminBuseoVo userBuseoDomain);

	public boolean setDelete(AdminBuseoVo userBuseoDomain) ;

	public AdminBuseoVo getView(String Id) ;

	public boolean setInsertToUpdate(AdminBuseoVo vo);

	
}
