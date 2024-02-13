package egovframework.kaist.user.submission.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.submission.model.AdminSubMissionVo;
import egovframework.kaist.user.submission.model.UserSubMissionDetailVo;
import egovframework.kaist.user.submission.model.UserSubMissionFileVo;
import egovframework.kaist.user.submission.model.UserSubMissionVo;

public interface UserSubMissionService {

	ModelMap getAllList(UserSubMissionVo userSubMissionVo);

	String setUserSubMissionDataAjaxInsert(UserSubMissionVo userSubMissionVo);

	ModelMap getSubMissionDataView(UserSubMissionVo userSubMissionVo);

	void setUserSubMissionData(UserSubMissionVo userSubMissionVo, String string);

	void setUserSubMissionDetailData(UserSubMissionDetailVo userSubMissionDetailVo, String string);

	void setUserSubMissionFileData(UserSubMissionFileVo userSubMissionFileVo, String string);

}
