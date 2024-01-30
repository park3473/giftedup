package egovframework.kaist.admin.dcmnt.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.dcmnt.model.DcmntVo;
import egovframework.kaist.admin.member_re.model.AdminDcmntVo;
import egovframework.kaist.admin.member_re.model.AdminMemberReVo;

public interface AdminDcmntService {

	ModelMap getListView(int member_idx);



	List<?> getIdxCheck(AdminMemberReVo adminMember_reVo);



	void setUpdate(DcmntVo dcmnt_Vo);



	void setInsert(DcmntVo dcmnt_Vo);



	ModelMap getDcmntList(DcmntVo dcmnt_Vo);



	void setDcmntUpdate(DcmntVo dcmnt_Vo);



	void setDcmntDelete(DcmntVo dcmnt_Vo);



	void setDcmntInsert(DcmntVo dcmnt_Vo);



}
