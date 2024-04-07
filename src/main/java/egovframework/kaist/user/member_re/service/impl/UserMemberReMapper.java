package egovframework.kaist.user.member_re.service.impl;

import java.util.ArrayList;
import java.util.List;

import egovframework.kaist.admin.MemberConfigVo;
import egovframework.kaist.user.member.model.UserMemberVo;
import egovframework.kaist.user.member_re.model.UserMemberReDocumentVo;
import egovframework.kaist.user.member_re.model.UserMemberReVo;
import egovframework.kaist.user.school.model.UserSchoolVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userMember_reMapper")
public interface UserMemberReMapper {

	MemberConfigVo getConfig(MemberConfigVo memberConfigVo);

	void setMemberReInsert(UserMemberReVo userMemberReVo);

	String getMatchingCnt();

	void setMemberReUpdate(UserMemberReVo userMemberReVo);

	UserMemberReVo getMemberReView(UserMemberReVo userMemberReVo);

	void setMemberReDelete(UserMemberReVo userMemberReVo);

	List<?> getDcmntList();

	List<?> getSchoolList(UserSchoolVo userSchoolVo);

	UserMemberVo getMemberView(UserMemberReVo userMemberReVo);

	int getMemberReCheck(UserMemberReVo userMemberReVo);

	List<?> getMemberReDocumentList(UserMemberReDocumentVo userMemberReDocumentVo);

	List<?> getDocumentList(UserMemberReDocumentVo userMemberReDocumentVo);

	void setMemberReFile(UserMemberReDocumentVo userMemberReDocumentVo);

	void setMemberReFileNameChange(UserMemberReDocumentVo userMemberReDocumentVo);

	UserMemberReDocumentVo getMemberReDocumentView(UserMemberReDocumentVo userMemberReDocumentVo);

	void setMemberReDocumentDelete(UserMemberReDocumentVo user);

	UserMemberReVo getMemberReMentoView(UserMemberReVo userMemberReVo);

	int getMemberReFileListCnt(UserMemberReDocumentVo userMemberReDocumentVo);

	String getMemberReELIGIBILITY(String iDX);

	int getMemberReFileFullCnt(String eL);

	void setMemberReFileTypeTwo(String iDX);

	void setMemberReFileTypeOne(String iDX);

	UserMemberReVo getMemberPassView(UserMemberReVo userMemberReVo);

	String getFileLinkCheck(UserMemberReDocumentVo userMemberReDocumentVo);

	UserMemberReVo getMemberReMatchingView(UserMemberReVo memberReVo);

	String getMatchingView(UserMemberReVo memberReVo);
	
	public int getMemberReIdCheck(UserMemberReVo userMemberReVo);

	public String getMemberReIdCheckGet(UserMemberReVo userMemberReVo);


	
}
