package egovframework.kaist.user.sms_log.service.impl;
 

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

import egovframework.kaist.user.sms_log.model.UserSmsLogVo;
import egovframework.kaist.user.sms_log.service.UserSmsLogService;

@Service("userSmsLogService")
@Transactional
public class UserSmsLogServiceImpl implements UserSmsLogService {

	
	@Resource(name = "userSmsLogMapper")
	private UserSmsLogMapper userSmsLogMapper;
	
	protected Log log = LogFactory.getLog(UserSmsLogServiceImpl.class);
	
 
	@Override
	public int setInsert(UserSmsLogVo domain) {
		return userSmsLogMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(UserSmsLogVo domain) {
		return userSmsLogMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(UserSmsLogVo domain) {
		return userSmsLogMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = userSmsLogMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		UserSmsLogVo vo = userSmsLogMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getSmsLogIdCheck(String sms_logId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userSmsLogMapper.getListAll();
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map   = (HashMap) list.get(i);
			System.out.println("sms_logId : " + sms_logId);
			System.out.println("map.get(\"MEMBER_ID\") : " + map.get("MEMBER_ID"));
			if(map.get("MEMBER_ID").equals(sms_logId))
			{
				return true;
			}
		}
		return false;
		
	}


	@Override
	public ModelMap getList(UserSmsLogVo userSmsLogVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userSmsLogMapper.getList(userSmsLogVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = userSmsLogMapper.getListCnt(userSmsLogVo);
		
		int itemCount = userSmsLogVo.getPageItemCount();
		int itempage = userSmsLogVo.getPage();

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
	public ModelMap getViewLast(String member_ID) {
		ModelMap model = new ModelMap();
		UserSmsLogVo vo = userSmsLogMapper.getViewLast(member_ID);
		model.put("pageDomain", vo);
		return model;
	}

		
}
