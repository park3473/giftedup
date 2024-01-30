package egovframework.kaist.admin.accept_log.service.impl;
 


import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.accept_log.model.AdminAcceptLogVo;
import egovframework.kaist.admin.accept_log.service.AdminAcceptLogService;


@Service("adminAcceptLogService")
@Transactional
public class AdminAcceptLogServiceImpl implements AdminAcceptLogService {

	
	@Resource(name = "adminAcceptLogMapper")
	private AdminAcceptLogMapper adminAcceptLogMapper;
	
	protected Log log = LogFactory.getLog(AdminAcceptLogServiceImpl.class);
	 
	@Override
	public int setInsert(AdminAcceptLogVo domain) {
		return adminAcceptLogMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(AdminAcceptLogVo domain) {
		return adminAcceptLogMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(AdminAcceptLogVo domain) {
		return adminAcceptLogMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminAcceptLogMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		AdminAcceptLogVo vo = adminAcceptLogMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public ModelMap getList(AdminAcceptLogVo adminAcceptLogVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminAcceptLogMapper.getList(adminAcceptLogVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

		
}
