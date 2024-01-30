package egovframework.kaist.admin.email_send.service.impl;

import java.util.List;

import egovframework.kaist.admin.email_send.model.AdminEmailSendVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminEmailSendMapper")
public interface AdminEmailSendMapper {

	public List<?> getListAll();
	
	public List<?> getListApplyAll(String apply);
	
	public int setInsert(AdminEmailSendVo domain);

	public boolean setUpdate(AdminEmailSendVo domain);

	public boolean setDelete(AdminEmailSendVo domain);

	public AdminEmailSendVo getView(String Id);

	public boolean setUpdateApply(AdminEmailSendVo domain);
	
	public boolean setUpdateApplyFail(AdminEmailSendVo domain);

	public List<?> getList(AdminEmailSendVo adminEmailSendVo);


}
