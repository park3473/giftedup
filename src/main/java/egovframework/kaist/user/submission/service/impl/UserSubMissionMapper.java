package egovframework.kaist.user.submission.service.impl;

import java.util.List;

import egovframework.kaist.admin.submission.model.AdminSubMissionVo;
import egovframework.kaist.user.submission.model.UserSubMissionDetailVo;
import egovframework.kaist.user.submission.model.UserSubMissionFileVo;
import egovframework.kaist.user.submission.model.UserSubMissionVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userSubMissionMapper")
public interface UserSubMissionMapper {

	public List<?> getSubMissionAllList(UserSubMissionVo userSubMissionVo);

	public int getSubMissionAllListCnt(UserSubMissionVo userSubMissionVo);

	public void setUserSubMissionDataAjaxInsert(UserSubMissionVo userSubMissionVo);

	public UserSubMissionVo getSubMissionDataView(UserSubMissionVo userSubMissionVo);

	public List<?> getSubMissionDetailList(UserSubMissionVo userSubMissionVo);

	public List<?> getSubMissionFileList(UserSubMissionVo userSubMissionVo);

	public void setUserSubMissionDataInsert(UserSubMissionVo userSubMissionVo);

	public void setUserSubMissionDataUpdate(UserSubMissionVo userSubMissionVo);

	public void setUserSubMissionDataDelete(UserSubMissionVo userSubMissionVo);

	public void setUserSubMissionDetailInsert(UserSubMissionDetailVo userSubMissionDetailVo);

	public void setUserSubMissionDetailUpdate(UserSubMissionDetailVo userSubMissionDetailVo);

	public void setUserSubMissionDetailDelete(UserSubMissionDetailVo userSubMissionDetailVo);

	public void setUserSubMissionDetailDeleteAll(UserSubMissionDetailVo userSubMissionDetailVo);

	public void setUserSubMissionFileInsert(UserSubMissionFileVo userSubMissionFileVo);

	public void setUserSubMissionFileDelete(UserSubMissionFileVo userSubMissionFileVo);

}
