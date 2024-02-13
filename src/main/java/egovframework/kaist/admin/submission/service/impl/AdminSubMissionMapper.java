package egovframework.kaist.admin.submission.service.impl;

import java.util.List;

import egovframework.kaist.admin.submission.model.AdminSubMissionDetailVo;
import egovframework.kaist.admin.submission.model.AdminSubMissionFileVo;
import egovframework.kaist.admin.submission.model.AdminSubMissionVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminSubMissionMapper")
public interface AdminSubMissionMapper {

	public List<?> getSubMissionAllList(AdminSubMissionVo adminSubMissionVo);

	public int getSubMissionAllListCnt(AdminSubMissionVo adminSubMissionVo);

	public void setAdminSubMissionDataDelete(AdminSubMissionVo adminSubMissionVo);

	public void setAdminSubMissionDataUpdate(AdminSubMissionVo adminSubMissionVo);

	public void setAdminSubMissionDataInsert(AdminSubMissionVo adminSubMissionVo);

	public AdminSubMissionVo getSubMissionDataView(AdminSubMissionVo adminSubMissionVo);

	public void setAdminSubMissionDataAjaxInsert(AdminSubMissionVo adminSubMissionVo);

	public void setAdminSubMissionFileInsert(AdminSubMissionFileVo adminSubMissionFileVo);

	public void setAdminSubMissionFileDelete(AdminSubMissionFileVo adminSubMissionFileVo);

	public List<?> getSubMissionFileList(AdminSubMissionVo adminSubMissionVo);

	public List<?> getSubMissionDetailList(AdminSubMissionVo adminSubMissionVo);

	public void setAdminSubMissionDetailInsert(AdminSubMissionDetailVo adminSubMissionDetailVo);

	public void setAdminSubMissionDetailUpdate(AdminSubMissionDetailVo adminSubMissionDetailVo);

	public void setAdminSubMissionDetailDelete(AdminSubMissionDetailVo adminSubMissionDetailVo);

	public void setAdminSubMissionDetailDeleteAll(AdminSubMissionDetailVo adminSubMissionDetailVo);

}
