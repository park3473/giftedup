package egovframework.kaist.user.mentoring.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.user.mentoring.model.UserMentoringVo;

public interface UserMentoringService {

	public int setInsert(UserMentoringVo userMentoringDomain);

	public boolean setUpdate(UserMentoringVo userMentoringDomain);
	
	public boolean setDelete(UserMentoringVo userMentoringDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getMentoringIdCheck(String mentoringId);

	public ModelMap getList(UserMentoringVo adminMentoringVo);

}
