package egovframework.kaist.user.member.service.impl;

import java.util.ArrayList;
import java.util.List;

import egovframework.kaist.user.member.model.UserMemberVo;
import egovframework.kaist.user.program_apply.model.UserProgramApplyVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userMemberMapper")
public interface UserMemberMapper {

	public List<?> getListAll();
	
	public int setInsert(UserMemberVo userMemberDomain);

	public boolean setUpdate(UserMemberVo userMemberDomain);

	public boolean setDelete(UserMemberVo userMemberDomain) ;

	public UserMemberVo getView(String Id) ;

	public List<?> getList(UserMemberVo userMemberVo);

	public int getListCnt(UserMemberVo userMemberVo);

	public List<?> getAdviserALL();

	public boolean setUpdateTypeToText(UserMemberVo userMemberDomain);

	public List<?> getListGroupBySchoolName();

	public UserMemberVo getView2(UserMemberVo userMemberDomain);

	public List<?> getProfessorList(UserMemberVo userMemberVo);

	public int getProfessorListCnt(UserMemberVo userMemberVo);

	public int getMemberTypeCnt(String string);

	public int getMemberSchoolCnt();

	public void setUpdateLoginTm(String member_ID);

	public List<?> getMatchingList(UserProgramApplyVo userProgramApplyDomain);

	public String getID(UserMemberVo userMemberVo);

	public UserMemberVo getPortfolioUserView(UserMemberVo usermembervo);

	public UserMemberVo getPortfolioYearView(UserMemberVo userMemberVo);

	public void setPassWordReset(UserMemberVo userMemberVo);
	
}
