package egovframework.kaist.admin.communicator.service.impl;

import java.util.List;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.communicator.model.AdminCommunicatorVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminCommunicatorMapper")
public interface AdminCommunicatorMapper {

	List<?> getCommAllList(AdminCommunicatorVo adminCommunicatorVo);

	int getCommAllListCnt(AdminCommunicatorVo adminCommunicatorVo);

	AdminCommunicatorVo getCommView(AdminCommunicatorVo adminCommunicatorVo);

	List<?> getStudentList(AdminCommunicatorVo adminCommunicatorVo);

	List<?> getSuppliesList(AdminCommunicatorVo adminCommunicatorVo);

	List<?> getCommExcelAll(AdminCommunicatorVo adminCommunicatorVo);

	List<?> getCommExcelSelect(AdminCommunicatorVo adminCommunicatorVo);

	List<?> getStudentExcelSelect(AdminCommunicatorVo adminCommunicatorVo);

}
