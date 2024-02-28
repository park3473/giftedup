package egovframework.kaist.admin.member.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.member.model.AdminMemberVo;

public interface AdminMemberService {

	public int setInsert(AdminMemberVo userMemberDomain);

	public boolean setUpdate(AdminMemberVo userMemberDomain);
	
	public boolean setDelete(AdminMemberVo userMemberDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getMemberIdCheck(String memberId);

	public ModelMap getList(AdminMemberVo adminMemberVo);

	public ModelMap getAdviserALL();

	public boolean setUpdateTypeToText(AdminMemberVo userMemberDomain);

	public ModelMap getListGroupBySchoolName();

	public void setDORMANCY();

	public ModelMap getListMemberIdIn(String mEMBER_ID);

	public ModelMap getListAllHuman();

	public void setUpdateShoolNumber();

	public void setInfo_AgreementUpdate();

	public ModelMap getListPortfolio(AdminMemberVo adminMemberVo);

	public ModelMap getListPortfolioMemberIdIn(String mEMBER_ID);

	public ModelMap getCheckView(AdminMemberVo vo);

	public void setInsert2021(AdminMemberVo vo);

	public Object getListNameOrder(AdminMemberVo adminMemberVo2);

	public Object getMatchingList(AdminMemberVo adminMemberVo);

	public ModelMap getListAll(AdminMemberVo adminMemberVo);

	public void setStudentSchoolAllYearUp(String school);

	public void setUpdateAjaxTest(AdminMemberVo adminMemberVo);


	
	

}
