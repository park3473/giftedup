package egovframework.kaist.user.notices_comment.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.user.notices_comment.model.UserNoticesCommentVo;

public interface UserNoticesCommentService {

	public int setInsert(UserNoticesCommentVo userNoticesCommentDomain);

	public boolean setUpdate(UserNoticesCommentVo userNoticesCommentDomain);
	
	public boolean setDelete(UserNoticesCommentVo userNoticesCommentDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getNoticesCommentIdCheck(String notices_commentId);

	public ModelMap getList(UserNoticesCommentVo adminNoticesCommentVo);
	
	public ModelMap getRank(String noticesIdx);

}
