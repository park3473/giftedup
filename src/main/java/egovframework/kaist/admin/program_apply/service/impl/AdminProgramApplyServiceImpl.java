package egovframework.kaist.admin.program_apply.service.impl;
 

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.kaist.admin.program.model.AdminProgramVo;
import egovframework.kaist.admin.program_apply.model.AdminProgramApplyVo;
import egovframework.kaist.admin.program_apply.service.AdminProgramApplyService;

@Service("adminProgramApplyService")
@Transactional
public class AdminProgramApplyServiceImpl implements AdminProgramApplyService {

	
	@Resource(name = "adminProgramApplyMapper")
	private AdminProgramApplyMapper adminProgramApplyMapper;
	
	protected Log log = LogFactory.getLog(AdminProgramApplyServiceImpl.class);
	
 
	@Override
	public int setInsert(AdminProgramApplyVo domain) {
		return adminProgramApplyMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(AdminProgramApplyVo domain) {
		return adminProgramApplyMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(AdminProgramApplyVo domain) {
		return adminProgramApplyMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminProgramApplyMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		AdminProgramApplyVo vo = adminProgramApplyMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getProgramApplyIdCheck(String program_applyId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminProgramApplyMapper.getListAll();
		
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
	public ModelMap getList(AdminProgramVo adminProgramVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminProgramApplyMapper.getList(adminProgramVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = adminProgramApplyMapper.getListCnt(adminProgramVo);
		
		int itemCount = adminProgramVo.getITEM_COUNT();
		int itempage = adminProgramVo.getPAGE();

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
