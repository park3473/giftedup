package egovframework.kaist.user.activity_allowance.service.impl;
 

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

import egovframework.kaist.user.activity_allowance.model.UserActivityAllowanceVo;
import egovframework.kaist.user.activity_allowance.service.UserActivityAllowanceService;

@Service("userActivityAllowanceService")
@Transactional
public class UserActivityAllowanceServiceImpl implements UserActivityAllowanceService {

	
	@Resource(name = "userActivityAllowanceMapper")
	private UserActivityAllowanceMapper userActivityAllowanceMapper;
	
	protected Log log = LogFactory.getLog(UserActivityAllowanceServiceImpl.class);
	
 
	@Override
	public int setInsert(UserActivityAllowanceVo domain) {
		return userActivityAllowanceMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(UserActivityAllowanceVo domain) {
		return userActivityAllowanceMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(UserActivityAllowanceVo domain) {
		return userActivityAllowanceMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = userActivityAllowanceMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		UserActivityAllowanceVo vo = userActivityAllowanceMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getActivityAllowanceIdCheck(String activity_allowanceId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userActivityAllowanceMapper.getListAll();
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map   = (HashMap) list.get(i);
			System.out.println("activity_allowanceId : " + activity_allowanceId);
			System.out.println("map.get(\"MEMBER_ID\") : " + map.get("MEMBER_ID"));
			if(map.get("MEMBER_ID").equals(activity_allowanceId))
			{
				return true;
			}
		}
		return false;
		
	}


	@Override
	public ModelMap getList(UserActivityAllowanceVo userActivityAllowanceVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userActivityAllowanceMapper.getList(userActivityAllowanceVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = userActivityAllowanceMapper.getListCnt(userActivityAllowanceVo);
		
		int itemCount = userActivityAllowanceVo.getITEM_COUNT();
		int itempage = userActivityAllowanceVo.getPAGE();

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
	public boolean setUpdateTypeToText(UserActivityAllowanceVo vo) {
		return userActivityAllowanceMapper.setUpdateTypeToText(vo);
	}

		
}
