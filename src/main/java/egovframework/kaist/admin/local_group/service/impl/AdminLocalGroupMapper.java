package egovframework.kaist.admin.local_group.service.impl;

import java.util.ArrayList;
import java.util.List;

import egovframework.kaist.admin.local_group.model.AdminLocalGroupVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminLocalGroupMapper")
public interface AdminLocalGroupMapper {

	public List<?> getListAll();
	
	public int setInsert(AdminLocalGroupVo userlocalGroupDomain);

	public boolean setUpdate(AdminLocalGroupVo userlocalGroupDomain);

	public boolean setDelete(AdminLocalGroupVo userlocalGroupDomain) ;

	public AdminLocalGroupVo getView(String Id) ;

	public List<?> getList(AdminLocalGroupVo adminlocalGroupVo);

	public int getListCnt(AdminLocalGroupVo adminlocalGroupVo);
	
}
