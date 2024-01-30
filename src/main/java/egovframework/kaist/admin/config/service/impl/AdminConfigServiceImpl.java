package egovframework.kaist.admin.config.service.impl;
 


import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.config.model.AdminConfigVo;
import egovframework.kaist.admin.config.service.AdminConfigService;


@Service("adminConfigService")
@Transactional
public class AdminConfigServiceImpl implements AdminConfigService {

	
	@Resource(name = "adminConfigMapper")
	private AdminConfigMapper adminConfigMapper;
	
	protected Log log = LogFactory.getLog(AdminConfigServiceImpl.class);
	 
	@Override
	public int setInsert(AdminConfigVo domain) {
		return adminConfigMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(AdminConfigVo domain) {
		return adminConfigMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(AdminConfigVo domain) {
		return adminConfigMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminConfigMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		AdminConfigVo vo = adminConfigMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public ModelMap getList(AdminConfigVo adminConfigVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminConfigMapper.getList(adminConfigVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

		
}
