package egovframework.kaist.user.program.service.impl;
 

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
import egovframework.kaist.user.program.service.UserProgramService;

@Service("userProgramService")
@Transactional
public class UserProgramServiceImpl implements UserProgramService {

	
	@Resource(name = "userProgramMapper")
	private UserProgramMapper userProgramMapper;
	
	protected Log log = LogFactory.getLog(UserProgramServiceImpl.class);
	
 
	@Override
	public int setInsert(UserProgramVo domain) {
		return userProgramMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(UserProgramVo domain) {
		return userProgramMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(UserProgramVo domain) {
		return userProgramMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = userProgramMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		UserProgramVo vo = userProgramMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getProgramIdCheck(String programId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userProgramMapper.getListAll();
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map   = (HashMap) list.get(i);
			System.out.println("programId : " + programId);
			System.out.println("map.get(\"MEMBER_ID\") : " + map.get("MEMBER_ID"));
			if(map.get("MEMBER_ID").equals(programId))
			{
				return true;
			}
		}
		return false;
		
	}


	@Override
	public ModelMap getList(UserProgramVo userProgramVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userProgramMapper.getList(userProgramVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = userProgramMapper.getListCnt(userProgramVo);
		
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
	public ModelMap getListGroupByYear() {
		ModelMap modelMap = new ModelMap();
		List<?> list = userProgramMapper.getListGroupByYear();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView2(String programid) {
		ModelMap model = new ModelMap();
		UserProgramVo vo = userProgramMapper.getView2(programid);
		model.put("pageDomain", vo);
		return model;
	}

		
}
