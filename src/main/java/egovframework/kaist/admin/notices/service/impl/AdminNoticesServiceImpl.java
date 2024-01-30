package egovframework.kaist.admin.notices.service.impl;
 

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

import egovframework.kaist.admin.notices.model.AdminNoticesVo;
import egovframework.kaist.admin.notices.service.AdminNoticesService;

@Service("adminNoticesService")
@Transactional
public class AdminNoticesServiceImpl implements AdminNoticesService {

	
	@Resource(name = "adminNoticesMapper")
	private AdminNoticesMapper adminNoticesMapper;
	
	protected Log log = LogFactory.getLog(AdminNoticesServiceImpl.class);
	
 
	@Override
	public int setInsert(AdminNoticesVo domain) {
		return adminNoticesMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(AdminNoticesVo domain) {
		return adminNoticesMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(AdminNoticesVo domain) {
		return adminNoticesMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminNoticesMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		AdminNoticesVo vo = adminNoticesMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getNoticesIdCheck(String noticesId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminNoticesMapper.getListAll();
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map   = (HashMap) list.get(i);
			System.out.println("noticesId : " + noticesId);
			System.out.println("map.get(\"MEMBER_ID\") : " + map.get("MEMBER_ID"));
			if(map.get("MEMBER_ID").equals(noticesId))
			{
				return true;
			}
		}
		return false;
		
	}


	@Override
	public ModelMap getList(AdminNoticesVo adminNoticesVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminNoticesMapper.getList(adminNoticesVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = adminNoticesMapper.getListCnt(adminNoticesVo);
		
		int itemCount = adminNoticesVo.getITEM_COUNT();
		int itempage = adminNoticesVo.getPAGE();

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

		
}
