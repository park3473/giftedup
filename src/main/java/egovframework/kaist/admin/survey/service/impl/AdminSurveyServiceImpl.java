package egovframework.kaist.admin.survey.service.impl;
 

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.kaist.admin.survey.model.AdminSurveyVo;
import egovframework.kaist.admin.survey.service.AdminSurveyService;
import egovframework.kaist.admin.survey_answer.service.impl.AdminSurveyAnswerMapper;

@Service("adminSurveyService")
@Transactional
public class AdminSurveyServiceImpl implements AdminSurveyService {

	
	@Resource(name = "adminSurveyMapper")
	private AdminSurveyMapper adminSurveyMapper;
	
	
	@Resource(name = "adminSurveyAnswerMapper")
	AdminSurveyAnswerMapper adminSurveyAnswerMapper;
	
	protected Log log = LogFactory.getLog(AdminSurveyServiceImpl.class);
	
 
	@Override
	public int setInsert(AdminSurveyVo domain) {
		return adminSurveyMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(AdminSurveyVo domain) {
		return adminSurveyMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(AdminSurveyVo domain) {
		return adminSurveyMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminSurveyMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		AdminSurveyVo vo = adminSurveyMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getSurveyIdCheck(String surveyId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminSurveyMapper.getListAll();
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map   = (HashMap) list.get(i);
			System.out.println("surveyId : " + surveyId);
			System.out.println("map.get(\"MEMBER_ID\") : " + map.get("MEMBER_ID"));
			if(map.get("MEMBER_ID").equals(surveyId))
			{
				return true;
			}
		}
		return false;
		
	}


	@Override
	public ModelMap getList(AdminSurveyVo adminSurveyVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminSurveyMapper.getList(adminSurveyVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		
		int itemtotalcount = adminSurveyMapper.getListCnt(adminSurveyVo);
		
		int itemCount = adminSurveyVo.getITEM_COUNT();
		int itempage = adminSurveyVo.getPAGE();

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
