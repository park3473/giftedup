package egovframework.kaist.user.notices_comment.service.impl;

import java.util.List;

import egovframework.kaist.user.notices_comment.model.UserNoticesCommentVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userNoticesCommentMapper")
public interface UserNoticesCommentMapper {

	public List<?> getListAll();
	
	public int setInsert(UserNoticesCommentVo userNoticesCommentDomain);

	public boolean setUpdate(UserNoticesCommentVo userNoticesCommentDomain);

	public boolean setDelete(UserNoticesCommentVo userNoticesCommentDomain) ;

	public UserNoticesCommentVo getView(String Id) ;

	public List<?> getList(UserNoticesCommentVo adminNoticesCommentVo);

	public int getListCnt(UserNoticesCommentVo adminNoticesCommentVo);

	public List<?> getBeforeMonthRank(String noticesIdx);

	public List<?> getMonthRank(String noticesIdx);
	
}
