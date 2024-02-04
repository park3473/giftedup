package egovframework.kaist.admin.exam.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.exam.model.AdminExamVo;
import egovframework.kaist.admin.question.model.AdminQuestionListVo;

public interface AdminExamService {

	public ModelMap getAllList(AdminExamVo adminExamVo);

	public void setAdminExamData(AdminExamVo adminExamVo, String string);

	public ModelMap getExamView(AdminExamVo adminExamVo);

	public ModelMap getQuestionList(AdminQuestionListVo adminQuestionListVo);

	public void setAdminExamQuestionList(AdminQuestionListVo adminQuestionListVo, String string);

	public ModelMap getExamCategoryAllList();

	public ModelMap getStatusData(AdminExamVo adminExamVo);


}
