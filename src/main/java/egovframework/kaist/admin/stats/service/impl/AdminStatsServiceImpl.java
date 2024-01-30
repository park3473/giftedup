package egovframework.kaist.admin.stats.service.impl;
 

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.stats.service.AdminStatsService;

@Service("adminStatsService")
@Transactional
public class AdminStatsServiceImpl implements AdminStatsService {

	@Resource(name = "adminStatsMapper")
	private AdminStatsMapper adminStatsMapper;
	
	
	protected Log log = LogFactory.getLog(AdminStatsServiceImpl.class);
	
 
	@Override
	public ModelMap getListADDRESS_LOCAL(String type) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminStatsMapper.getListADDRESS_LOCAL(type);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}
	

	@Override
	public ModelMap getListSEX(String type) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminStatsMapper.getListSEX(type);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}
	

	@Override
	public ModelMap getListSCHOOL_TYPE(String type) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminStatsMapper.getListSCHOOL_TYPE(type);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}


	@Override
	public ModelMap getListSCHOOL_GROUP(String string) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminStatsMapper.getListSCHOOL_GROUP(string);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}
	
		
}
