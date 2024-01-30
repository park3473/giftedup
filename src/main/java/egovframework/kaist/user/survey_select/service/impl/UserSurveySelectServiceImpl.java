package egovframework.kaist.user.survey_select.service.impl;
 

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.kaist.user.survey_select.model.UserSurveySelectVo;
import egovframework.kaist.user.survey_select.service.UserSurveySelectService;

@Service("userSurveySelectService")
@Transactional
public class UserSurveySelectServiceImpl implements UserSurveySelectService {

	
	@Resource(name = "userSurveySelectMapper")
	private UserSurveySelectMapper usersurveySelectMapper;
	
	protected Log log = LogFactory.getLog(UserSurveySelectServiceImpl.class);
	
 
	@Override
	public int setInsert(UserSurveySelectVo domain) {
		return usersurveySelectMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(UserSurveySelectVo domain) {
		return usersurveySelectMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(UserSurveySelectVo domain) {
		return usersurveySelectMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = usersurveySelectMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		UserSurveySelectVo vo = usersurveySelectMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getsurveySelectIdCheck(String survey_selectId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = usersurveySelectMapper.getListAll();
		
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
	public ModelMap getList(UserSurveySelectVo usersurveySelectVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = usersurveySelectMapper.getList(usersurveySelectVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = usersurveySelectMapper.getListCnt(usersurveySelectVo);
		
		int itemCount = usersurveySelectVo.getITEM_COUNT();
		int itempage = usersurveySelectVo.getPAGE();

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
