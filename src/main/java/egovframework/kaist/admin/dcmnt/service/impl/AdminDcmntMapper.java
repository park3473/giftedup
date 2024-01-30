package egovframework.kaist.admin.dcmnt.service.impl;

import java.util.List;

import egovframework.kaist.admin.dcmnt.model.DcmntVo;
import egovframework.kaist.admin.member_re.model.AdminMemberReVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminDcmntMapper")
public interface AdminDcmntMapper {

	List<?> getListView(int member_idx);

	void setUpdate(DcmntVo dcmntVo);

	List<?> getIdxCheck(AdminMemberReVo adminMember_reVo);

	void setInsert(DcmntVo dcmnt_Vo);


	List<?> getDcmntTypeList();

	List<?> getDcmntList(DcmntVo dcmnt_Vo);

	void setDcmntUpdate(DcmntVo dcmnt_Vo);

	void setDcmntDelete(DcmntVo dcmnt_Vo);

	void setDcmntInsert(DcmntVo dcmnt_Vo);

	List<?> getDcmntName();

	List<?> getDcmntName(String eligibility);

}
