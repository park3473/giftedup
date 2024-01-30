package egovframework.kaist.admin.survey_select.service.impl;
 

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

import egovframework.kaist.admin.survey_select.model.AdminSurveySelectVo;
import egovframework.kaist.admin.survey_select.service.AdminSurveySelectService;

@Service("adminSurveySelectService")
@Transactional
public class AdminSurveySelectServiceImpl implements AdminSurveySelectService {

	
	@Resource(name = "adminSurveySelectMapper")
	private AdminSurveySelectMapper adminsurveySelectMapper;
	
	protected Log log = LogFactory.getLog(AdminSurveySelectServiceImpl.class);
	
 
	@Override
	public int setInsert(AdminSurveySelectVo domain) {
		return adminsurveySelectMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(AdminSurveySelectVo domain) {
		return adminsurveySelectMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(AdminSurveySelectVo domain) {
		return adminsurveySelectMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminsurveySelectMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		AdminSurveySelectVo vo = adminsurveySelectMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getsurveySelectIdCheck(String survey_selectId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminsurveySelectMapper.getListAll();
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map   = (HashMap) list.get(i);
			System.out.println("survey_selectId : " + survey_selectId);
			System.out.println("map.get(\"MEMBER_ID\") : " + map.get("MEMBER_ID"));
			if(map.get("MEMBER_ID").equals(survey_selectId))
			{
				return true;
			}
		}
		return false;
		
	}


	@Override
	public ModelMap getList(AdminSurveySelectVo adminsurveySelectVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminsurveySelectMapper.getList(adminsurveySelectVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = adminsurveySelectMapper.getListCnt(adminsurveySelectVo);
		
		int itemCount = adminsurveySelectVo.getITEM_COUNT();
		int itempage = adminsurveySelectVo.getPAGE();

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
