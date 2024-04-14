package egovframework.kaist.admin.member_re.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.MemberConfigVo;
import egovframework.kaist.admin.dcmnt.model.DcmntVo;
import egovframework.kaist.admin.matching.model.AdminMatchingVo;
import egovframework.kaist.admin.member_re.model.AdminDcmntFileVo;
import egovframework.kaist.admin.member_re.model.AdminDcmntVo;
import egovframework.kaist.admin.member_re.model.AdminMemberReVo;
import egovframework.kaist.user.member_re.model.UserMemberReVo;

public interface AdminMemberReService {

	public ModelMap getList(AdminMemberReVo adminMember_reVo);
	
	ModelMap getView(String id);

	public boolean setUpdate(AdminMemberReVo adminMember_reVo);
	
	public ModelMap getListAll();
	
	public boolean getIdxCheck(String idx);

	public boolean setUpdateTypeToText(AdminMemberReVo adminMember_reDomain);

	public ModelMap getListPass();

	public ModelMap setDcmntUpdate(String dcmnt_check);

	public List<AdminDcmntVo> getDcmnt(AdminMemberReVo adminMember_reVo);

	public void setDcmntCheck(DcmntVo dcmnt_Vo);

	public void setAllComplete();

	public ModelMap getStat();

	public ModelMap getConfig(MemberConfigVo memberConfigVo);

	public void setMemberReConfig(MemberConfigVo memberConfigVo);

	public void setConfigStat(MemberConfigVo memberConfigVo);

	public void setConfigUpdate(MemberConfigVo memberConfigVo);

	public void DelConfig(MemberConfigVo memberConfigVo);

	public ModelMap getMemberReView(AdminMemberReVo adminMember_reVo);

	public void setMemberReUpdate(AdminMemberReVo adminMember_reVo);

	public void setMemberReFileNameChage(AdminDcmntFileVo adminDcmntFileVo);

	public void setMemberRePass(AdminMemberReVo adminMember_reVo);

	public void setMemberRePassDown(AdminMemberReVo adminMember_reVo);

	public void setMemberReDelete(AdminMemberReVo adminMember_reVo);

	public List<?> getAllListPass();

	public void setMemberReNewMemberId(AdminMemberReVo adminMemberReVo);

	public List<?> getMatchingAllList();

	public ModelMap getPassListAll();

	public void setMemberReNewMemberIdDis(AdminMemberReVo adminMemberReVo);

	public void setMatching(AdminMatchingVo adminMatchingVo);

	public String getFileLinkCheck(AdminDcmntFileVo adminDcmntFileVo);

	public AdminMemberReVo getMatchingMentoView(AdminMemberReVo vo2);

	public ModelMap getExcelListAll();






}
