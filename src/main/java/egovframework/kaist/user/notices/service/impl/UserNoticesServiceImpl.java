package egovframework.kaist.user.notices.service.impl;
 

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.kaist.user.notices.model.UserNoticesVo;
import egovframework.kaist.user.notices.service.UserNoticesService;

@Service("userNoticesService")
@Transactional
public class UserNoticesServiceImpl implements UserNoticesService {

	
	@Resource(name = "userNoticesMapper")
	private UserNoticesMapper userNoticesMapper;
	
	protected Log log = LogFactory.getLog(UserNoticesServiceImpl.class);
	
 
	@Override
	public int setInsert(UserNoticesVo domain) {
		return userNoticesMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(UserNoticesVo domain) {
		return userNoticesMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(UserNoticesVo domain) {
		return userNoticesMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = userNoticesMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		UserNoticesVo vo = userNoticesMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getNoticesIdCheck(String noticesId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userNoticesMapper.getListAll();
		
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
	public ModelMap getList(UserNoticesVo userNoticesVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userNoticesMapper.getList(userNoticesVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = userNoticesMapper.getListCnt(userNoticesVo);
		
		int itemCount = userNoticesVo.getITEM_COUNT();
		int itempage = userNoticesVo.getPAGE();

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
