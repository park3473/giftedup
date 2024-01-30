package egovframework.kaist.user.member.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.user.member.model.UserMemberVo;
import egovframework.kaist.user.program_apply.model.UserProgramApplyVo;



public interface UserMemberService {

	public int setInsert(UserMemberVo userMemberDomain);

	public boolean setUpdate(UserMemberVo userMemberDomain);
	
	public boolean setDelete(UserMemberVo userMemberDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getMemberIdCheck(String memberId);

	public ModelMap getList(UserMemberVo adminMemberVo);

	public ModelMap getAdviserALL();

	public boolean setUpdateTypeToText(UserMemberVo userMemberDomain);

	public ModelMap getListGroupBySchoolName();
	
	ModelMap getView(UserMemberVo userMemberDomain);

	public ModelMap getProfessorList(UserMemberVo userMemberVo);

	public int getMemberTypeCnt(String string);

	public int getMemberSchoolCnt();

	public void setUpdateLoginTm(String member_ID);

	public ModelMap getMatchingList(UserProgramApplyVo userProgramApplyDomain);

	public String getID(UserMemberVo userMemberVo);

	ModelMap getPortfolioUserView(UserMemberVo usermembervo);

	public ModelMap getPortfolioYearView(UserMemberVo userMemberVo);

	public void PassWordReSet(UserMemberVo userMemberVo);
	
	

}
