package egovframework.kaist.admin.popup.service.impl;
 

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
import egovframework.kaist.admin.popup.model.AdminPopupVo;
import egovframework.kaist.admin.popup.service.AdminPopupService;

@Service("adminPopupService")
@Transactional
public class AdminPopupServiceImpl implements AdminPopupService {

	
	@Resource(name = "adminPopupMapper")
	private AdminPopupMapper adminPopupMapper;
	
	protected Log log = LogFactory.getLog(AdminPopupServiceImpl.class);
	
 
	@Override
	public int setInsert(AdminPopupVo domain) {
		return adminPopupMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(AdminPopupVo domain) {
		return adminPopupMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(AdminPopupVo domain) {
		return adminPopupMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminPopupMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		AdminPopupVo vo = adminPopupMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getPopupIdCheck(String popupId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminPopupMapper.getListAll();
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map   = (HashMap) list.get(i);
			System.out.println("popupId : " + popupId);
			System.out.println("map.get(\"MEMBER_ID\") : " + map.get("MEMBER_ID"));
			if(map.get("MEMBER_ID").equals(popupId))
			{
				return true;
			}
		}
		return false;
		
	}


	@Override
	public ModelMap getList(AdminPopupVo adminPopupVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminPopupMapper.getList(adminPopupVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = adminPopupMapper.getListCnt(adminPopupVo);
		
		int itemCount = adminPopupVo.getITEM_COUNT();
		int itempage = adminPopupVo.getPAGE();

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
	public ModelMap getListStartEndTM(AdminPopupVo adminPopupVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminPopupMapper.getListStartEndTM(adminPopupVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

		
}
