package egovframework.kaist.admin.communicator.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.communicator.model.AdminCommunicatorVo;

public interface AdminCommunicatorService {

	ModelMap getCommAllList(AdminCommunicatorVo adminCommunicatorVo);

	ModelMap getCommView(AdminCommunicatorVo adminCommunicatorVo);

	ModelMap getCommExcelAllList(AdminCommunicatorVo adminCommunicatorVo);

	ModelMap getCommExcelSelectList(AdminCommunicatorVo adminCommunicatorVo);

}
