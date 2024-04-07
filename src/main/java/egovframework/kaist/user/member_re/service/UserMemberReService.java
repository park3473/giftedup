package egovframework.kaist.user.member_re.service;

import java.text.ParseException;
import java.util.List;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.MemberConfigVo;
import egovframework.kaist.user.member_re.model.UserMemberReDocumentVo;
import egovframework.kaist.user.member_re.model.UserMemberReVo;
import egovframework.kaist.user.school.model.UserSchoolVo;

public interface UserMemberReService {


	String getMemberReConfigCheck(MemberConfigVo memberConfigVo) throws ParseException;

	void setMemberReInsert(UserMemberReVo userMemberReVo);

	String getMatchingCnt();

	void setMemberReUpdate(UserMemberReVo userMemberReVo);

	ModelMap getMemberReView(UserMemberReVo userMemberReVo);

	void setMemberReDelete(UserMemberReVo userMemberReVo);

	List<?> getDcmntList();

	ModelMap getSchoolList(UserSchoolVo userSchoolVo);

	ModelMap getMemberView(UserMemberReVo userMemberReVo);

	String getMemberReCheck(UserMemberReVo userMemberReVo);

	ModelMap getMemberReDocumentList(UserMemberReDocumentVo userMemberReDocumentVo);

	void setMemberReFile(UserMemberReDocumentVo userMemberReDocumentVo);

	void setMemberReFileNameChange(UserMemberReDocumentVo userMemberReDocumentVo);

	UserMemberReDocumentVo getMemberReDocumentView(UserMemberReDocumentVo userMemberReDocumentVo);

	void setMemberReDocumentDelete(UserMemberReDocumentVo user);

	UserMemberReVo getMentoView(UserMemberReVo userMemberReVo);

	ModelMap getMemberRePassView(UserMemberReVo userMemberReVo);

	String getFileLinkCheck(UserMemberReDocumentVo userMemberReDocumentVo);

	String getMemberReIdCheck(UserMemberReVo userMemberReVo);


}
