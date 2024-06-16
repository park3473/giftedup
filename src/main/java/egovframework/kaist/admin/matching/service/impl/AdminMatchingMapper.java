package egovframework.kaist.admin.matching.service.impl;

import java.util.ArrayList;
import java.util.List;

import egovframework.kaist.admin.matching.model.AdminMatchingVo;
import egovframework.kaist.admin.member.model.AdminMemberVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminMatchingMapper")
public interface AdminMatchingMapper {

	public List<?> getListAll();
	
	public int setInsert(AdminMatchingVo userMatchingDomain);

	public boolean setUpdate(AdminMatchingVo userMatchingDomain);

	public boolean setDelete(AdminMatchingVo userMatchingDomain) ;

	public AdminMatchingVo getView(String Id) ;

	public List<?> getList(AdminMatchingVo adminMatchingVo);

	public int getListCnt(AdminMatchingVo adminMatchingVo);

	public List<?> getListGroupByYear();

	public List<?> getListGroupBySUPPORT_GROUP();

	public List<?> getListGroupByENROLLMENT_STATUS();

	public void setUpdateTypeToText(AdminMatchingVo vo);

	public List<?> getMatchingNotMemberList(AdminMatchingVo adminMatchingVo);

	public AdminMatchingVo getOneList(AdminMatchingVo vo);

	public AdminMatchingVo getViewCheck(AdminMatchingVo vo2);

	public List<?> getMatchingMemberList(AdminMemberVo adminMemberVo);

	public List<?> getListOneMemberId(AdminMatchingVo adminMatchingVo);

	
}
