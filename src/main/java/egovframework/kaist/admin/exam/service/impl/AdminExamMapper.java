package egovframework.kaist.admin.exam.service.impl;

import java.util.List;

import egovframework.kaist.admin.exam.model.AdminExamVo;
import egovframework.kaist.admin.question.model.AdminQuestionListVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminExamMapper")
public interface AdminExamMapper {

	List<?> getAllList(AdminExamVo adminExamVo);

	int getAllListCnt(AdminExamVo adminExamVo);

	void setAdminExamDataInsert(AdminExamVo adminExamVo);

	void setAdminExamDataUpdate(AdminExamVo adminExamVo);

	void setAdminExamDataDelete(AdminExamVo adminExamVo);

	AdminExamVo getExamView(AdminExamVo adminExamVo);

	List<?> getExamCategoryList(AdminExamVo vo);

	List<?> getQuestionList(AdminQuestionListVo adminQuestionListVo);

	void setAdminExamQuestionListInsert(AdminQuestionListVo adminQuestionListVo);

	void setAdminExamQuestionListUpdate(AdminQuestionListVo adminQuestionListVo);

	void setAdminExamQuestionListDelete(AdminQuestionListVo adminQuestionListVo);

	List<?> getStatusQuestionList(AdminExamVo adminExamVo);

	List<?> getExamResultMemberAll(AdminExamVo adminExamVo);

	List<?> getExamAllList(AdminExamVo adminExamVo);

}
