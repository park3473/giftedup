package egovframework.kaist.admin.matching.service.impl;
 

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

import egovframework.kaist.admin.matching.model.AdminMatchingVo;
import egovframework.kaist.admin.matching.service.AdminMatchingService;
import egovframework.kaist.admin.member.model.AdminMemberVo;

@Service("adminMatchingService")
@Transactional
public class AdminMatchingServiceImpl implements AdminMatchingService {

	
	@Resource(name = "adminMatchingMapper")
	private AdminMatchingMapper adminMatchingMapper;
	
	protected Log log = LogFactory.getLog(AdminMatchingServiceImpl.class);
	
 
	@Override
	public int setInsert(AdminMatchingVo domain) {
		System.out.println(domain.getMEMBER_ID());
		System.out.println(domain.getPROFESSOR_MEMBER_ID());
		System.out.println(domain.getYEAR());
		System.out.println(domain.getSCHOOL_NAME());
		System.out.println(domain.getSCHOOL_YEAR());
		return adminMatchingMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(AdminMatchingVo domain) {
		return adminMatchingMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(AdminMatchingVo domain) {
		return adminMatchingMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminMatchingMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		AdminMatchingVo vo = adminMatchingMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getMatchingIdCheck(String matchingId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminMatchingMapper.getListAll();
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map   = (HashMap) list.get(i);
			System.out.println("matchingId : " + matchingId);
			System.out.println("map.get(\"MEMBER_ID\") : " + map.get("MEMBER_ID"));
			if(map.get("MEMBER_ID").equals(matchingId))
			{
				return true;
			}
		}
		return false;
		
	}


	@Override
	public ModelMap getList(AdminMatchingVo adminMatchingVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminMatchingMapper.getList(adminMatchingVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = adminMatchingMapper.getListCnt(adminMatchingVo);
		
		int itemCount = adminMatchingVo.getITEM_COUNT();
		int itempage = adminMatchingVo.getPAGE();

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
	public ModelMap getListGroupByYear() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminMatchingMapper.getListGroupByYear();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getListGroupBySUPPORT_GROUP() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminMatchingMapper.getListGroupBySUPPORT_GROUP();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getListGroupByENROLLMENT_STATUS() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminMatchingMapper.getListGroupByENROLLMENT_STATUS();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public void setUpdateTypeToText(AdminMatchingVo vo) {
		adminMatchingMapper.setUpdateTypeToText(vo);
	}

	@Override
	public ModelMap getMatchingNotMemberList(AdminMatchingVo adminMatchingVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminMatchingMapper.getMatchingNotMemberList(adminMatchingVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getOneList(AdminMatchingVo vo) {
		ModelMap model = new ModelMap();
		AdminMatchingVo vo2 = adminMatchingMapper.getOneList(vo);
		model.put("pageDomain", vo2);
		return model;
	}

	@Override
	public ModelMap getView(AdminMatchingVo vo2) {
		// TODO Auto-generated method stub
		ModelMap model = new ModelMap();
		AdminMatchingVo vo = adminMatchingMapper.getViewCheck(vo2);
		
		model.put("pageDomain", vo);
		return model;
	}

		
}
