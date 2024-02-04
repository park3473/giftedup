package egovframework.kaist.admin.select.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.select.model.AdminSelectVo;

public interface AdminSelectService {

	public ModelMap getSelectAllList(AdminSelectVo adminSelectVo);

	public void setSelectData(AdminSelectVo adminSelectVo, String string);

	public ModelMap getSelectView(AdminSelectVo adminSelectVo);

}
