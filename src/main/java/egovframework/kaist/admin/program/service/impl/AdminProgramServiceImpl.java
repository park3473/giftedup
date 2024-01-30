package egovframework.kaist.admin.program.service.impl;
 

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
import egovframework.kaist.admin.program.service.AdminProgramService;

@Service("adminProgramService")
@Transactional
public class AdminProgramServiceImpl implements AdminProgramService {

	
	@Resource(name = "adminProgramMapper")
	private AdminProgramMapper adminProgramMapper;
	
	protected Log log = LogFactory.getLog(AdminProgramServiceImpl.class);
	
 
	@Override
	public int setInsert(AdminProgramVo domain) {
		return adminProgramMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(AdminProgramVo domain) {
		return adminProgramMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(AdminProgramVo domain) {
		return adminProgramMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminProgramMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		AdminProgramVo vo = adminProgramMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getProgramIdCheck(String programId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminProgramMapper.getListAll();
		
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
	public ModelMap getList(AdminProgramVo adminProgramVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminProgramMapper.getList(adminProgramVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = adminProgramMapper.getListCnt(adminProgramVo);
		
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

	@Override
	public ModelMap getListGroupByYear() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminProgramMapper.getListGroupByYear();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

		
}
