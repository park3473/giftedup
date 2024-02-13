package egovframework.kaist.admin.submission.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.submission.model.AdminSubMissionDetailVo;
import egovframework.kaist.admin.submission.model.AdminSubMissionFileVo;
import egovframework.kaist.admin.submission.model.AdminSubMissionVo;

public interface AdminSubMissionService {

	public ModelMap getAllList(AdminSubMissionVo adminSubMissionVo);

	public void setAdminSubMissionData(AdminSubMissionVo adminSubMissionVo, String string);

	public ModelMap getSubMissionDataView(AdminSubMissionVo adminSubMissionVo);

	public String setAdminSubMissionDataAjaxInsert(AdminSubMissionVo adminSubMissionVo);

	public void setAdminSubMissionFileData(AdminSubMissionFileVo adminSubMissionFileVo, String string);

	public void setAdminSubMissionDetailData(AdminSubMissionDetailVo adminSubMissionDetailVo, String string);

}
