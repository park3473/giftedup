package egovframework.kaist.admin.popup.service.impl;

import java.util.ArrayList;
import java.util.List;

import egovframework.kaist.admin.popup.model.AdminPopupVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminPopupMapper")
public interface AdminPopupMapper {

	public List<?> getListAll();
	
	public int setInsert(AdminPopupVo userPopupDomain);

	public boolean setUpdate(AdminPopupVo userPopupDomain);

	public boolean setDelete(AdminPopupVo userPopupDomain) ;

	public AdminPopupVo getView(String Id) ;

	public List<?> getList(AdminPopupVo adminPopupVo);

	public int getListCnt(AdminPopupVo adminPopupVo);

	public List<?> getListStartEndTM(AdminPopupVo adminPopupVo);
	
}
