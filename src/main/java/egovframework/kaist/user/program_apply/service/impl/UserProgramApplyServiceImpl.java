package egovframework.kaist.user.program_apply.service.impl;
 

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.kaist.user.program.model.UserProgramVo;
import egovframework.kaist.user.program_apply.model.UserProgramApplyVo;
import egovframework.kaist.user.program_apply.service.UserProgramApplyService;

@Service("userProgramApplyService")
@Transactional
public class UserProgramApplyServiceImpl implements UserProgramApplyService {

	
	@Resource(name = "userProgramApplyMapper")
	private UserProgramApplyMapper userProgramApplyMapper;
	
	protected Log log = LogFactory.getLog(UserProgramApplyServiceImpl.class);
	
 
	@Override
	public int setInsert(UserProgramApplyVo domain) {
		return userProgramApplyMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(UserProgramApplyVo domain) {
		return userProgramApplyMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(UserProgramApplyVo domain) {
		return userProgramApplyMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = userProgramApplyMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		UserProgramApplyVo vo = userProgramApplyMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getProgramApplyIdCheck(String program_applyId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userProgramApplyMapper.getListAll();
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map   = (HashMap) list.get(i);
			System.out.println("program_applyId : " + program_applyId);
			System.out.println("map.get(\"MEMBER_ID\") : " + map.get("MEMBER_ID"));
			if(map.get("MEMBER_ID").equals(program_applyId))
			{
				return true;
			}
		}
		return false;
		
	}


	@Override
	public ModelMap getList(UserProgramVo userProgramVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userProgramApplyMapper.getList(userProgramVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = userProgramApplyMapper.getListCnt(userProgramVo);
		
		int itemCount = userProgramVo.getITEM_COUNT();
		int itempage = userProgramVo.getPAGE();

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
	public ModelMap getApplyView(UserProgramApplyVo userProgramApplyDomain) {
		ModelMap model = new ModelMap();
		UserProgramApplyVo vo = userProgramApplyMapper.getApplyView(userProgramApplyDomain);
		if(vo == null)
		{
			UserProgramApplyVo vo2 = new UserProgramApplyVo();
			model.put("pageDomain", vo2);
		}else
		{
			model.put("pageDomain", vo);
		}
		
		return model;
	}

		
}
