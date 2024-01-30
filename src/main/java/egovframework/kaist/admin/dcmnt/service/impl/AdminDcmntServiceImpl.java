package egovframework.kaist.admin.dcmnt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.dcmnt.model.DcmntVo;
import egovframework.kaist.admin.dcmnt.service.AdminDcmntService;
import egovframework.kaist.admin.member_re.model.AdminDcmntVo;
import egovframework.kaist.admin.member_re.model.AdminMemberReVo;
import egovframework.kaist.admin.member_re.service.impl.AdminMemberReMapper;
import egovframework.kaist.admin.member_re.service.impl.AdminMember_reServiceImpl;

@Service("adminDcmntService")
@Transactional
public class AdminDcmntServiceImpl implements AdminDcmntService {

	@Resource(name = "adminDcmntMapper")
	private AdminDcmntMapper adminDcmntMapper;
	
	protected Log log = LogFactory.getLog(AdminDcmntServiceImpl.class);

	@Override
	public ModelMap getListView(int member_idx) {
		System.out.println(member_idx);
		
		ModelMap modelMap = new ModelMap();
		List<?> list = adminDcmntMapper.getListView(member_idx);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public void setUpdate(DcmntVo dcmntVo) {
		adminDcmntMapper.setUpdate(dcmntVo);
	}

	@Override
	public List<?> getIdxCheck(AdminMemberReVo adminMember_reVo) {
		// TODO Auto-generated method stub
		return adminDcmntMapper.getIdxCheck(adminMember_reVo);
	}

	@Override
	public void setInsert(DcmntVo dcmnt_Vo) {
		// TODO Auto-generated method stub
		adminDcmntMapper.setInsert(dcmnt_Vo);
	}

	@Override
	public ModelMap getDcmntList(DcmntVo dcmnt_Vo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminDcmntMapper.getDcmntList(dcmnt_Vo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		List<?> types = adminDcmntMapper.getDcmntTypeList();
		modelMap.addAttribute("types", types);
		System.out.println("---types : " + types.size());
		return modelMap;
	}

	@Override
	public void setDcmntUpdate(DcmntVo dcmnt_Vo) {
		// TODO Auto-generated method stub
		adminDcmntMapper.setDcmntUpdate(dcmnt_Vo);
	}

	@Override
	public void setDcmntDelete(DcmntVo dcmnt_Vo) {
		// TODO Auto-generated method stub
		adminDcmntMapper.setDcmntDelete(dcmnt_Vo);
	}

	@Override
	public void setDcmntInsert(DcmntVo dcmnt_Vo) {
		// TODO Auto-generated method stub
		adminDcmntMapper.setDcmntInsert(dcmnt_Vo);
	}

}
