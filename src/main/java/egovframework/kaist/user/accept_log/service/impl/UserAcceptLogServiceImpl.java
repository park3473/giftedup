package egovframework.kaist.user.accept_log.service.impl;
 


import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import egovframework.kaist.user.accept_log.model.UserAcceptLogVo;
import egovframework.kaist.user.accept_log.service.UserAcceptLogService;


@Service("userAcceptLogService")
@Transactional
public class UserAcceptLogServiceImpl implements UserAcceptLogService {

	
	@Resource(name = "userAcceptLogMapper")
	private UserAcceptLogMapper userAcceptLogMapper;
	
	protected Log log = LogFactory.getLog(UserAcceptLogServiceImpl.class);
	 
	@Override
	public int setInsert(UserAcceptLogVo domain) {
		return userAcceptLogMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(UserAcceptLogVo domain) {
		return userAcceptLogMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(UserAcceptLogVo domain) {
		return userAcceptLogMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = userAcceptLogMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		UserAcceptLogVo vo = userAcceptLogMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public ModelMap getList(UserAcceptLogVo userAcceptLogVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userAcceptLogMapper.getList(userAcceptLogVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

		
}
