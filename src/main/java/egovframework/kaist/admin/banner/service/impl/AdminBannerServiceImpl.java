package egovframework.kaist.admin.banner.service.impl;
 

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

import egovframework.kaist.admin.banner.model.AdminBannerVo;
import egovframework.kaist.admin.banner.service.AdminBannerService;

@Service("adminBannerService")
@Transactional
public class AdminBannerServiceImpl implements AdminBannerService {

	
	@Resource(name = "adminBannerMapper")
	private AdminBannerMapper adminBannerMapper;
	
	protected Log log = LogFactory.getLog(AdminBannerServiceImpl.class);
	
 
	@Override
	public int setInsert(AdminBannerVo domain) {
		return adminBannerMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(AdminBannerVo domain) {
		return adminBannerMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(AdminBannerVo domain) {
		return adminBannerMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminBannerMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		AdminBannerVo vo = adminBannerMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getBannerIdCheck(String bannerId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminBannerMapper.getListAll();
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map   = (HashMap) list.get(i);
			System.out.println("bannerId : " + bannerId);
			System.out.println("map.get(\"MEMBER_ID\") : " + map.get("MEMBER_ID"));
			if(map.get("MEMBER_ID").equals(bannerId))
			{
				return true;
			}
		}
		return false;
		
	}


	@Override
	public ModelMap getList(AdminBannerVo adminBannerVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminBannerMapper.getList(adminBannerVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = adminBannerMapper.getListCnt(adminBannerVo);
		
		int itemCount = adminBannerVo.getITEM_COUNT();
		int itempage = adminBannerVo.getPAGE();

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
	public ModelMap getListStartEndTM(AdminBannerVo adminBannerVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminBannerMapper.getListStartEndTM();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

		
}
