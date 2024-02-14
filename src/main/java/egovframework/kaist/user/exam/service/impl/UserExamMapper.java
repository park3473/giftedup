package egovframework.kaist.user.exam.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.kaist.user.exam.model.UserExamResultVo;
import egovframework.kaist.user.exam.model.UserExamVo;
import egovframework.kaist.user.member.model.UserMemberVo;

@Mapper("userExamMapper")
public interface UserExamMapper {

	List<?> getAllList(UserExamVo userExamVo);

	int getAllListCnt(UserExamVo userExamVo);
	
	UserExamVo getExamView(UserExamVo userExamVo);

	List<?> getQuestionList(UserExamVo userExamVo);

	void setExamResultData(UserExamResultVo userExamResultVo);

	List<?> getResultListView(UserMemberVo userMemberVo);

	UserExamResultVo getExamResultView(UserExamResultVo userExamResultVo);

	List<?> getExamResultMemberAll(UserExamResultVo userExamResultVo);

	List<?> getIndexList();

	void setExamRespondents(UserExamResultVo userExamResultVo);

	List<?> getResultAllList(UserExamResultVo userExamResultVo);

	int getResultAllListCnt(UserExamResultVo userExamResultVo);

	
}
