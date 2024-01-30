package egovframework.kaist.admin.email_send.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.email_send.model.AdminEmailSendVo;

public interface AdminEmailSendService {

	public int setInsert(AdminEmailSendVo userEmailDomain);

	public boolean setUpdate(AdminEmailSendVo userEmailDomain);
	
	public boolean setDelete(AdminEmailSendVo userEmailDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	boolean testEmailSend(String sendEmail, String toEmail, String Subject, String Content);

	public boolean setUpdateApply(AdminEmailSendVo domain);
	
	public boolean setUpdateApplyFail(AdminEmailSendVo domain);

	public ModelMap getListApplyAll(String string);

	public void setCronSend();

	public ModelMap getList(AdminEmailSendVo adminEmailSendVo);

}
