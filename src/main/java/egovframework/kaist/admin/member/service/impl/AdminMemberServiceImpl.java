package egovframework.kaist.admin.member.service.impl;
 

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;
import com.system.util.SUtil;

import egovframework.kaist.admin.member.model.AdminMemberVo;
import egovframework.kaist.admin.member.service.AdminMemberService;

@Service("adminMemberService")
@Transactional
public class AdminMemberServiceImpl implements AdminMemberService {

	
	@Resource(name = "adminMemberMapper")
	private AdminMemberMapper adminMemberMapper;
	
	protected Log log = LogFactory.getLog(AdminMemberServiceImpl.class);
	
 
	@Override
	public int setInsert(AdminMemberVo domain) {
		return adminMemberMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(AdminMemberVo domain) {
		return adminMemberMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(AdminMemberVo domain) {
		return adminMemberMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminMemberMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		AdminMemberVo vo = adminMemberMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getMemberIdCheck(String memberId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminMemberMapper.getListAll();
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map   = (HashMap) list.get(i);
			System.out.println("memberId : " + memberId);
			System.out.println("map.get(\"MEMBER_ID\") : " + map.get("MEMBER_ID"));
			if(map.get("MEMBER_ID").equals(memberId))
			{
				return true;
			}
		}
		return false;
		
	}


	@Override
	public ModelMap getList(AdminMemberVo adminMemberVo) {
		ModelMap modelMap = new ModelMap();
		
		List<?> list = adminMemberMapper.getList(adminMemberVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		System.out.println("======test3====");
		
		int itemtotalcount = adminMemberMapper.getListCnt(adminMemberVo);
		
		int itemCount = adminMemberVo.getITEM_COUNT();
		int itempage = adminMemberVo.getPAGE();

		PageVO pageVo = new PageVO(itemCount, itemtotalcount, itempage);

		if (pageVo.isItempagenext() == true) {
			modelMap.put("itempagenext", "true");
		} else {
			modelMap.put("itempagenext", "false");
		}

		modelMap.put("page", pageVo.getItempage());
		modelMap.put("itemCount", pageVo.getItemCount());
		modelMap.put("itempagestart", pageVo.getItempagestart());
		modelMap.put("itempageend", pageVo.getItempageend());
		modelMap.put("itemtotalcount", pageVo.getItemtotalcount());
		modelMap.put("itemtotalpage", pageVo.getItemtotalpage());
		
		return modelMap;
		
	}

	@Override
	public ModelMap getAdviserALL() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminMemberMapper.getAdviserALL();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}



	@Override
	public boolean setUpdateTypeToText(AdminMemberVo userMemberDomain) {
		return adminMemberMapper.setUpdateTypeToText(userMemberDomain);
	}

	@Override
	public ModelMap getListGroupBySchoolName() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminMemberMapper.getListGroupBySchoolName();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public void setDORMANCY() {
		adminMemberMapper.setDORMANCY();
	}

	@Override
	public ModelMap getListMemberIdIn(String mEMBER_ID) {
		
		ModelMap modelMap = new ModelMap();
		List<?> list = adminMemberMapper.getListMemberIdIn(mEMBER_ID);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
		
		
	}

	@Override
	public ModelMap getListAllHuman() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminMemberMapper.getListAllHuman();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public void setUpdateShoolNumber() {
		adminMemberMapper.setUpdateShoolNumber();
	}

	@Override
	public void setInfo_AgreementUpdate() {
		adminMemberMapper.setInfo_AgreementUpdate();
	}

	@Override
	public ModelMap getListPortfolio(AdminMemberVo adminMemberVo) {
		ModelMap modelMap = new ModelMap();
		List<HashMap> list = adminMemberMapper.getListPortfolio(adminMemberVo);
		modelMap.addAttribute("list", list);
		int itemtotalcount = adminMemberMapper.getListPortfolioCnt(adminMemberVo);
		
		int itemCount = adminMemberVo.getITEM_COUNT();
		int itempage = adminMemberVo.getPAGE();

		PageVO pageVo = new PageVO(itemCount, itemtotalcount, itempage);

		if (pageVo.isItempagenext() == true) {
			modelMap.put("itempagenext", "true");
		} else {
			modelMap.put("itempagenext", "false");
		}

		modelMap.put("page", pageVo.getItempage());
		modelMap.put("itemCount", pageVo.getItemCount());
		modelMap.put("itempagestart", pageVo.getItempagestart());
		modelMap.put("itempageend", pageVo.getItempageend());
		modelMap.put("itemtotalcount", pageVo.getItemtotalcount());
		modelMap.put("itemtotalpage", pageVo.getItemtotalpage());
		
		return modelMap;
	}

	@Override
	public ModelMap getListPortfolioMemberIdIn(String mEMBER_ID) {
		ModelMap modelMap = new ModelMap();
		List<HashMap> list = adminMemberMapper.getListPortfolioMemberIdIn(mEMBER_ID);
		modelMap.addAttribute("list", list);

		return modelMap;
	}

	@Override
	public ModelMap getCheckView(AdminMemberVo vo) {
		ModelMap model = new ModelMap();
		AdminMemberVo vo2 = adminMemberMapper.getCheckView(vo);
		model.put("pageDomain", vo2);
		return model;
	}

	@Override
	public void setInsert2021(AdminMemberVo vo) {
		// TODO Auto-generated method stub
		adminMemberMapper.setInsert2021(vo);
	}

	@Override
	public Object getListNameOrder(AdminMemberVo adminMemberVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminMemberMapper.getListNameOrder(adminMemberVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		int itemtotalcount = adminMemberMapper.getListCnt(adminMemberVo);
		
		int itemCount = adminMemberVo.getITEM_COUNT();
		int itempage = adminMemberVo.getPAGE();

		PageVO pageVo = new PageVO(itemCount, itemtotalcount, itempage);

		if (pageVo.isItempagenext() == true) {
			modelMap.put("itempagenext", "true");
		} else {
			modelMap.put("itempagenext", "false");
		}

		modelMap.put("page", pageVo.getItempage());
		modelMap.put("itemCount", pageVo.getItemCount());
		modelMap.put("itempagestart", pageVo.getItempagestart());
		modelMap.put("itempageend", pageVo.getItempageend());
		modelMap.put("itemtotalcount", pageVo.getItemtotalcount());
		modelMap.put("itemtotalpage", pageVo.getItemtotalpage());
		
		return modelMap;
	}

	@Override
	public Object getMatchingList(AdminMemberVo adminMemberVo) {
		// TODO Auto-generated method stub
		ModelMap modelMap = new ModelMap();
		List<?> list = adminMemberMapper.getMatchingList(adminMemberVo);
		modelMap.addAttribute("list", list);
		
		return modelMap;
	}

	@Override
	public ModelMap getListAll(AdminMemberVo adminMemberVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminMemberMapper.getAllList(adminMemberVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public void setStudentSchoolAllYearUp(String school) {
		// TODO Auto-generated method stub
		//학년 증가
		adminMemberMapper.setStudentSchoolAllYearUp(school);
		
	}

	@Override
	public void setUpdateAjaxTest(AdminMemberVo adminMemberVo) {
		// TODO Auto-generated method stub
		
		adminMemberMapper.setUpdateAjaxTest(adminMemberVo);
		
	}

	@Override
	public List<?> getGroupMemberList(AdminMemberVo adminMemberVo) {
		
		List<?> list = adminMemberMapper.getGroupMemberList(adminMemberVo);
		
		return list;
	}


		
}
