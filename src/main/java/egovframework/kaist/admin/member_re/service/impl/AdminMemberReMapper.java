package egovframework.kaist.admin.member_re.service.impl;

import java.util.List;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.MemberConfigVo;
import egovframework.kaist.admin.dcmnt.model.DcmntVo;
import egovframework.kaist.admin.matching.model.AdminMatchingVo;
import egovframework.kaist.admin.member_re.model.AdminDcmntFileVo;
import egovframework.kaist.admin.member_re.model.AdminDcmntVo;
import egovframework.kaist.admin.member_re.model.AdminMemberReVo;
import egovframework.kaist.user.member_re.model.UserMemberReVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminMember_reMapper")
public interface AdminMemberReMapper {

	public List<?> getListAll();
	
	public List<?> getList(AdminMemberReVo adminMember_reVo);
	
	public boolean setUpdate(AdminMemberReVo adminMember_reVo);

	public ModelMap setUpdate(String idx);

	public AdminMemberReVo getView(String Id) ;
	
	public int getListCnt(AdminMemberReVo adminMember_reVo);

	public boolean setUpdateTypeToText(AdminMemberReVo userMember_reDomain);

	public List<?> getListPass();

	public ModelMap setDcmntUpdate(String dcmnt_check);

	public List<AdminDcmntVo> getDcmnt(AdminMemberReVo adminMember_reVo);

	public void setDcmntCheck(DcmntVo dcmnt_Vo);

	public void setAllComplete();

	public List<?> getStat();

	public List<?> getMeStat();


	public int getConfigCount(MemberConfigVo memberConfigVo);

	public MemberConfigVo getConfig(MemberConfigVo memberConfigVo);

	public void setMemberReConfig(MemberConfigVo memberConfigVo);

	public void setConfigStat(MemberConfigVo memberConfigVo);

	public void setConfigUpdate(MemberConfigVo memberConfigVo);

	public void DelConfig(MemberConfigVo memberConfigVo);

	public AdminMemberReVo getMemberReView(AdminMemberReVo adminMember_reVo);

	public AdminMemberReVo getMatchingMemberReView(AdminMemberReVo adminMember_reVo);

	public List<?> getDcmntAllList();

	public List<?> getDcmntFileList(AdminMemberReVo studentView);

	public void setMemberReUpdate(AdminMemberReVo adminMember_reVo);

	public void setMemberReFileNameChange(AdminDcmntFileVo adminDcmntFileVo);

	public void setMemberRePass(AdminMemberReVo adminMember_reVo);

	public void setMemberRePassDown(AdminMemberReVo adminMember_reVo);

	public void setMemberReDeleteMatching(AdminMemberReVo adminMember_reVo);

	public void setMemberReDeleteView(AdminMemberReVo adminMember_reVo);

	public String getMemberReMatchingIdxView(AdminMemberReVo adminMember_reVo);

	public void setMemberReDeleteFileIdx(String mento_IDX);

	public void setMemberReNewMemberId(AdminMemberReVo adminMemberReVo);

	public List<?> getMatchingAllList();

	public List<?> getPassListAll();

	public void setMemberReNewMemberIdDis(AdminMemberReVo adminMemberReVo);

	public void setMatching(AdminMatchingVo adminMatchingVo);

	public String getFileLinkCheck(AdminDcmntFileVo adminDcmntFileVo);

	public List<?> getFileValCheck(AdminMemberReVo adminMember_reVo);

	public AdminMemberReVo getMatchingMentoView(AdminMemberReVo vo2);

	public int getMatchingMentoViewCnt(AdminMemberReVo vo2);

	public List<?> getExcelList(AdminMemberReVo vo);

	public int getALLFILECNT(AdminMemberReVo vo);

	public int getListExistingCnt(AdminMemberReVo adminMemberReVo);

	public void setMemberNewMemberId(AdminMemberReVo adminMemberReVo);

	public void setMemberOldMemberId(AdminMemberReVo adminMemberReVo);


}