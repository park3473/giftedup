package egovframework.kaist.admin.email.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.email.model.AdminEmailVo;

public interface AdminEmailService {

	public int setInsert(AdminEmailVo userEmailDomain);

	public boolean setUpdate(AdminEmailVo userEmailDomain);
	
	public boolean setDelete(AdminEmailVo userEmailDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean testEmailSend();


}
