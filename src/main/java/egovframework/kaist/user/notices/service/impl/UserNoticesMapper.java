package egovframework.kaist.user.notices.service.impl;

import java.util.List;

import egovframework.kaist.user.notices.model.UserNoticesVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userNoticesMapper")
public interface UserNoticesMapper {

	public List<?> getListAll();
	
	public int setInsert(UserNoticesVo userNoticesDomain);

	public boolean setUpdate(UserNoticesVo userNoticesDomain);

	public boolean setDelete(UserNoticesVo userNoticesDomain) ;

	public UserNoticesVo getView(String Id) ;

	public List<?> getList(UserNoticesVo userNoticesVo);

	public int getListCnt(UserNoticesVo userNoticesVo);
	
}
