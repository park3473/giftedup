package egovframework.kaist.user.notices_data.service.impl;

import java.util.List;

import egovframework.kaist.user.notices_data.model.UserNoticesDataVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userNoticesDataMapper")
public interface UserNoticesDataMapper {

	public List<?> getListAll();
	
	public int setInsert(UserNoticesDataVo userNoticesDataDomain);

	public boolean setUpdate(UserNoticesDataVo userNoticesDataDomain);

	public boolean setDelete(UserNoticesDataVo userNoticesDataDomain) ;

	public UserNoticesDataVo getView(String Id) ;

	public List<?> getList(UserNoticesDataVo adminNoticesDataVo);

	public int getListCnt(UserNoticesDataVo adminNoticesDataVo);

	public void setUpdateReadCntAdd(String idx);

	public List<?> getBest(String notices);

	public List<UserNoticesDataVo> getHeaderListPr(UserNoticesDataVo userNoticesDataVo);

	public void setUpdateFile(UserNoticesDataVo userNoticesDataVo);
	
}
