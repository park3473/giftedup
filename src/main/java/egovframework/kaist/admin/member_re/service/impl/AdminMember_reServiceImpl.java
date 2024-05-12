package egovframework.kaist.admin.member_re.service.impl;
 

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.kaist.admin.MemberConfigVo;
import egovframework.kaist.admin.dcmnt.model.DcmntVo;
import egovframework.kaist.admin.matching.model.AdminMatchingVo;
import egovframework.kaist.admin.member_re.model.AdminDcmntFileVo;
import egovframework.kaist.admin.member_re.model.AdminDcmntVo;
import egovframework.kaist.admin.member_re.model.AdminMemberReVo;
import egovframework.kaist.admin.member_re.service.AdminMemberReService;
import egovframework.kaist.user.member_re.model.UserMemberReVo;

@Service("adminMember_reService")
@Transactional
public class AdminMember_reServiceImpl implements AdminMemberReService {

	
	@Resource(name = "adminMember_reMapper")
	private AdminMemberReMapper adminMember_reMapper;
	
	protected Log log = LogFactory.getLog(AdminMember_reServiceImpl.class);

	@Override
	public boolean setUpdate(AdminMemberReVo adminMember_reVo) {
		return adminMember_reMapper.setUpdate(adminMember_reVo);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminMember_reMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getListPass() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminMember_reMapper.getListPass();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		AdminMemberReVo vo = adminMember_reMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getIdxCheck(String idx) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminMember_reMapper.getListAll();
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map   = (HashMap) list.get(i);
			System.out.println("idx : " + idx);
			System.out.println("map.get(\"IDX\") : " + map.get("IDX"));
			if(map.get("IDX").equals(idx))
			{
				return true;
			}
		}
		return false;
	}


	@Override
	public ModelMap getList(AdminMemberReVo adminMember_reVo) {
		ModelMap modelMap = new ModelMap();
		
		List<?> list = adminMember_reMapper.getList(adminMember_reVo);
		
		modelMap.addAttribute("list", list);
		
		System.out.println("------------------size : " + list.size());
		
		int itemtotalcount = adminMember_reMapper.getListCnt(adminMember_reVo);
		int itemCount = adminMember_reVo.getITEM_COUNT();
		int itempage = adminMember_reVo.getPAGE();
		
		PageVO pageVo = new PageVO(itemCount, itemtotalcount, itempage);
		
		if (pageVo.isItempagenext() == true) {
			modelMap.put("itempagenext", "true");
		} else {
			modelMap.put("itempagenext", "false");
		}
		
		System.out.println(pageVo.getItempage());
		
		modelMap.put("page", pageVo.getItempage());
		modelMap.put("itemCount", pageVo.getItemCount());
		modelMap.put("itempagestart", pageVo.getItempagestart());
		modelMap.put("itempageend", pageVo.getItempageend());
		modelMap.put("itemtotalcount", pageVo.getItemtotalcount());
		modelMap.put("itemtotalpage", pageVo.getItemtotalpage());
		
		return modelMap;
	}

	@Override
	public boolean setUpdateTypeToText(AdminMemberReVo adminMember_reDomain) {
		return adminMember_reMapper.setUpdateTypeToText(adminMember_reDomain);
	}

	@Override
	public ModelMap setDcmntUpdate(String dcmnt_check) {
		return adminMember_reMapper.setDcmntUpdate(dcmnt_check);
	}

	@Override
	public List<AdminDcmntVo> getDcmnt(AdminMemberReVo adminMember_reVo) {
		return adminMember_reMapper.getDcmnt(adminMember_reVo);
	}

	@Override
	public void setDcmntCheck(DcmntVo dcmnt_Vo) {
		
		adminMember_reMapper.setDcmntCheck(dcmnt_Vo);
	}

	@Override
	public void setAllComplete() {
		adminMember_reMapper.setAllComplete();
	}

	@Override
	public ModelMap getStat() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminMember_reMapper.getStat();
		List<?> me_list = adminMember_reMapper.getMeStat();
		
		modelMap.addAttribute("me_list", me_list);
		modelMap.addAttribute("list",list);
		System.out.println("--------size : " + list.size());
		return modelMap;
		
	}



	@Override
	public ModelMap getConfig(MemberConfigVo memberConfigVo) {
		// TODO Auto-generated method stub
		
		ModelMap model = new ModelMap();
		
		int count  = adminMember_reMapper.getConfigCount(memberConfigVo);
		
		if(count > 0) {
			memberConfigVo.setTYPE("1");
			MemberConfigVo view1 = adminMember_reMapper.getConfig(memberConfigVo);
			memberConfigVo.setTYPE("2");
			MemberConfigVo view2 = adminMember_reMapper.getConfig(memberConfigVo);
			model.put("view1", view1);
			model.put("view2", view2);
		}
		
		model.put("count", count);
		
		return model;
	}

	@Override
	public void setMemberReConfig(MemberConfigVo memberConfigVo) {
		
		adminMember_reMapper.setMemberReConfig(memberConfigVo);
		
	}

	@Override
	public void setConfigStat(MemberConfigVo memberConfigVo) {
		
		adminMember_reMapper.setConfigStat(memberConfigVo);
		
	}

	@Override
	public void setConfigUpdate(MemberConfigVo memberConfigVo) {
		
		adminMember_reMapper.setConfigUpdate(memberConfigVo);
		
	}

	@Override
	public void DelConfig(MemberConfigVo memberConfigVo) {
		
		adminMember_reMapper.DelConfig(memberConfigVo);
		
	}

	@Override
	public ModelMap getMemberReView(AdminMemberReVo adminMember_reVo) {
		// TODO Auto-generated method stub
		
		ModelMap model = new ModelMap();
		
		List<?> DcmntAllList = adminMember_reMapper.getDcmntAllList();
		
		model.put("DcmntAllList", DcmntAllList);
		
		if(adminMember_reVo.getTYPE().equals("1")) {
			
			if(adminMember_reVo.getLEVEL().equals("8")) {
				
				AdminMemberReVo MentoView = adminMember_reMapper.getMemberReView(adminMember_reVo);
				
				adminMember_reVo.setMATCHING(MentoView.getMATCHING());
				adminMember_reVo.setLEVEL("11");
				
				AdminMemberReVo StudentView = adminMember_reMapper.getMatchingMemberReView(adminMember_reVo);
				
				List<?> UploadFileList = adminMember_reMapper.getDcmntFileList(MentoView);
				List<?> DcmntList = adminMember_reMapper.getDcmnt(StudentView);
				
				model.put("DcmntList", DcmntList);
				model.put("UploadFileList", UploadFileList);
				model.put("MentoView", MentoView);
				model.put("StudentView", StudentView);
				
			}else if(adminMember_reVo.getLEVEL().equals("11")) {
				
				AdminMemberReVo StudentView = adminMember_reMapper.getMemberReView(adminMember_reVo);
				
				adminMember_reVo.setMATCHING(StudentView.getMATCHING());
				adminMember_reVo.setLEVEL("8");
				
				AdminMemberReVo MentoView = adminMember_reMapper.getMatchingMemberReView(adminMember_reVo);
				
				List<?> UploadFileList = adminMember_reMapper.getDcmntFileList(MentoView);
				List<?> DcmntList = adminMember_reMapper.getDcmnt(StudentView);
				
				model.put("DcmntList", DcmntList);
				model.put("UploadFileList", UploadFileList);
				model.put("MentoView", MentoView);
				model.put("StudentView", StudentView);
				
			}
			
		}else {
			
			AdminMemberReVo View = adminMember_reMapper.getMemberReView(adminMember_reVo);
			
			List<?> UploadFileList = adminMember_reMapper.getDcmntFileList(View);
			List<?> DcmntList = adminMember_reMapper.getDcmnt(View);
			
			model.put("DcmntList", DcmntList);
			model.put("UploadFileList", UploadFileList);
			model.put("View", View);
			
		}
		
		return model;
	}
	

	@Override
	public void setMemberReUpdate(AdminMemberReVo adminMember_reVo) {
		
		adminMember_reMapper.setMemberReUpdate(adminMember_reVo);
		
	}

	@Override
	public void setMemberReFileNameChage(AdminDcmntFileVo adminDcmntFileVo) {
		
		adminMember_reMapper.setMemberReFileNameChange(adminDcmntFileVo);
		
	}

	@Override
	public void setMemberRePass(AdminMemberReVo adminMember_reVo) {
		
		adminMember_reMapper.setMemberRePass(adminMember_reVo);
		
	}

	@Override
	public void setMemberRePassDown(AdminMemberReVo adminMember_reVo) {
		
		adminMember_reMapper.setMemberRePassDown(adminMember_reVo);
		
	}

	@Override
	public void setMemberReDelete(AdminMemberReVo adminMember_reVo) {
		
		if(adminMember_reVo.getTYPE().equals("1")) {
			
			adminMember_reVo.setLEVEL("8");
			
			String Mento_IDX = adminMember_reMapper.getMemberReMatchingIdxView(adminMember_reVo);
			
			adminMember_reMapper.setMemberReDeleteMatching(adminMember_reVo);
			
			adminMember_reMapper.setMemberReDeleteFileIdx(Mento_IDX);
			
			
			
		}else if(adminMember_reVo.getTYPE().equals("2") || adminMember_reVo.getTYPE().equals("3")) {
			
			adminMember_reMapper.setMemberReDeleteView(adminMember_reVo);
			
			String value = adminMember_reVo.getIDX();
			
			System.out.println(value);
			
			adminMember_reMapper.setMemberReDeleteFileIdx(value);
			
		}
		
	}

	@Override
	public List<?> getAllListPass() {
		
		List<?> list = adminMember_reMapper.getListPass();
		
		return list;
	}

	@Override
	public void setMemberReNewMemberId(AdminMemberReVo adminMemberReVo) {
		
		adminMember_reMapper.setMemberReNewMemberId(adminMemberReVo);
		
	}

	@Override
	public List<?> getMatchingAllList() {
		
		List<?> list = adminMember_reMapper.getMatchingAllList();
		
		return list;
	}

	@Override
	public ModelMap getPassListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminMember_reMapper.getPassListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public void setMemberReNewMemberIdDis(AdminMemberReVo adminMemberReVo) {
		// TODO Auto-generated method stub
		adminMember_reMapper.setMemberReNewMemberIdDis(adminMemberReVo);
	}

	@Override
	public void setMatching(AdminMatchingVo adminMatchingVo) {
		// TODO Auto-generated method stub
		adminMember_reMapper.setMatching(adminMatchingVo);
	}

	@Override
	public String getFileLinkCheck(AdminDcmntFileVo adminDcmntFileVo) {
		
		String result = "";
		
		result = adminMember_reMapper.getFileLinkCheck(adminDcmntFileVo);
		
		return result;
	}

	@Override
	public AdminMemberReVo getMatchingMentoView(AdminMemberReVo vo2) {
		
		AdminMemberReVo Vo = new AdminMemberReVo();
		int count = adminMember_reMapper.getMatchingMentoViewCnt(vo2);
		
		if(count > 0) {
			Vo = adminMember_reMapper.getMatchingMentoView(vo2);
		}
		
		return Vo;
	}

	
	@Override
	public ModelMap getExcelListAll(AdminMemberReVo AdminMemberReVo) {
		
		ModelMap model = new ModelMap();
		
		AdminMemberReVo Vo = new AdminMemberReVo();
		//유형 1리스트
		AdminMemberReVo.setTYPE("1");
		List<?> Type1List = adminMember_reMapper.getExcelList(AdminMemberReVo);
		//유형 2리스트
		AdminMemberReVo.setTYPE("2");
		List<?> Type2List = adminMember_reMapper.getExcelList(AdminMemberReVo);
		//유형 3리스트
		AdminMemberReVo.setTYPE("3");
		List<?> Type3List = adminMember_reMapper.getExcelList(AdminMemberReVo);
		
		//기존 참여자 현황 수
		AdminMemberReVo.setTYPE("1");
		int existing1 = adminMember_reMapper.getListExistingCnt(AdminMemberReVo);
		AdminMemberReVo.setTYPE("2");
		int existing2 = adminMember_reMapper.getListExistingCnt(AdminMemberReVo);
		AdminMemberReVo.setTYPE("3");
		int existing3 = adminMember_reMapper.getListExistingCnt(AdminMemberReVo);
		//파일 완료 수
		AdminMemberReVo.setTYPE("1");
		AdminMemberReVo.setFILE_TYPE("2");
		int FILE1 = adminMember_reMapper.getALLFILECNT(AdminMemberReVo);
		FILE1 = FILE1/2;
		AdminMemberReVo.setTYPE("2");
		AdminMemberReVo.setFILE_TYPE("2");
		int FILE2 = adminMember_reMapper.getALLFILECNT(AdminMemberReVo);
		
		//전체 수
		int[] data = {Type1List.size() , Type2List.size() , Type3List.size() , FILE1 , FILE2 , 0 , existing1 , existing2 , existing3};
		
		model.put("Type1List", Type1List);
		model.put("Type2List", Type2List);
		model.put("Type3List", Type3List);
		model.put("Data", data);
		
		return model;
	}

	

}
