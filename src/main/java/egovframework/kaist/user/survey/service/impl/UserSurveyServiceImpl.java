package egovframework.kaist.user.survey.service.impl;
 

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


import egovframework.kaist.user.survey.model.UserSurveyVo;
import egovframework.kaist.user.survey.service.UserSurveyService;

@Service("userSurveyService")
@Transactional
public class UserSurveyServiceImpl implements UserSurveyService {

	
	@Resource(name = "userSurveyMapper")
	private UserSurveyMapper userSurveyMapper;
	
	protected Log log = LogFactory.getLog(UserSurveyServiceImpl.class);
	
 
	@Override
	public int setInsert(UserSurveyVo domain) {
		return userSurveyMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(UserSurveyVo domain) {
		return userSurveyMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(UserSurveyVo domain) {
		return userSurveyMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = userSurveyMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		UserSurveyVo vo = userSurveyMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getSurveyIdCheck(String surveyId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userSurveyMapper.getListAll();
		
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
	public ModelMap getList(UserSurveyVo userSurveyVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userSurveyMapper.getList(userSurveyVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = userSurveyMapper.getListCnt(userSurveyVo);
		
		int itemCount = userSurveyVo.getITEM_COUNT();
		int itempage = userSurveyVo.getPAGE();

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
