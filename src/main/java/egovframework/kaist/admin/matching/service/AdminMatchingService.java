package egovframework.kaist.admin.matching.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.matching.model.AdminMatchingVo;
import egovframework.kaist.admin.member.model.AdminMemberVo;

public interface AdminMatchingService {

	public int setInsert(AdminMatchingVo userMatchingDomain);

	public boolean setUpdate(AdminMatchingVo userMatchingDomain);
	
	public boolean setDelete(AdminMatchingVo userMatchingDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getMatchingIdCheck(String matchingId);

	public ModelMap getList(AdminMatchingVo adminMatchingVo);

	public ModelMap getListGroupByYear();

	public ModelMap getListGroupBySUPPORT_GROUP();

	public ModelMap getListGroupByENROLLMENT_STATUS();

	public void setUpdateTypeToText(AdminMatchingVo vo);

	public ModelMap getMatchingNotMemberList(AdminMatchingVo adminMatchingVo);

	public ModelMap getOneList(AdminMatchingVo vo);

	public ModelMap getView(AdminMatchingVo vo);

}
