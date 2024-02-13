package egovframework.kaist.admin.award.service.impl;

import java.util.List;

import egovframework.kaist.admin.award.model.AdminAwardRequireVo;
import egovframework.kaist.admin.award.model.AdminAwardVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminAwardMapper")
public interface AdminAwardMapper {

	public List<?> getAwardAllList(AdminAwardVo adminAwardVo);

	public int getAwardAllListCnt(AdminAwardVo adminAwardVo);

	public void setAdminAwardDataInsert(AdminAwardVo adminAwardVo);

	public void setAdminAwardDataUpdate(AdminAwardVo adminAwardVo);

	public void setAdminAwardDataDelete(AdminAwardVo adminAwardVo);

	public AdminAwardVo getAwardViewData(AdminAwardVo adminAwardVo);

	public List<?> getAwardRequireList(AdminAwardRequireVo adminAwardRequireVo);

	public void setAdminAwardRequireDataInsert(AdminAwardRequireVo adminAwardRequireVo);

	public void setAdminAwardRequireDataUpdate(AdminAwardRequireVo adminAwardRequireVo);

	public void setAdminAwardRequireDataDelete(AdminAwardRequireVo adminAwardRequireVo);

	public void setAdminAwardDataAjaxInsert(AdminAwardVo adminAwardVo);

}
