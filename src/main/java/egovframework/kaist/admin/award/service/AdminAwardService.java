package egovframework.kaist.admin.award.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.award.model.AdminAwardRequireVo;
import egovframework.kaist.admin.award.model.AdminAwardVo;

public interface AdminAwardService {

	public ModelMap getAllList(AdminAwardVo adminAwardVo);

	public void setAdminAwardData(AdminAwardVo adminAwardVo, String string);

	public ModelMap getAwardDataView(AdminAwardVo adminAwardVo);
	
	public List<?> getRequireAllList(AdminAwardRequireVo adminAwardRequireVo);

	public void setAdminAwardRequireData(AdminAwardRequireVo adminAwardRequireVo, String string);
	
	public String setAdminAwardDataAjaxInsert(AdminAwardVo adminAwardVo);

}
