package egovframework.kaist.user.survey_answer.service.impl;
 

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.kaist.user.survey_answer.model.UserSurveyAnswerVo;
import egovframework.kaist.user.survey_answer.service.UserSurveyAnswerService;

@Service("userSurveyAnswerService")
@Transactional
public class UserSurveyAnswerServiceImpl implements UserSurveyAnswerService {

	
	@Resource(name = "userSurveyAnswerMapper")
	private UserSurveyAnswerMapper userSurveyAnswerMapper;
	
	protected Log log = LogFactory.getLog(UserSurveyAnswerServiceImpl.class);
	
 
	@Override
	public int setInsert(UserSurveyAnswerVo domain) {
		return userSurveyAnswerMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(UserSurveyAnswerVo domain) {
		return userSurveyAnswerMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(UserSurveyAnswerVo domain) {
		return userSurveyAnswerMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = userSurveyAnswerMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		UserSurveyAnswerVo vo = userSurveyAnswerMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getSurveyAnswerIdCheck(String survey_answerId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userSurveyAnswerMapper.getListAll();
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map   = (HashMap) list.get(i);
			System.out.println("survey_answerId : " + survey_answerId);
			System.out.println("map.get(\"MEMBER_ID\") : " + map.get("MEMBER_ID"));
			if(map.get("MEMBER_ID").equals(survey_answerId))
			{
				return true;
			}
		}
		return false;
		
	}


	@Override
	public ModelMap getList(UserSurveyAnswerVo userSurveyAnswerVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userSurveyAnswerMapper.getList(userSurveyAnswerVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = userSurveyAnswerMapper.getListCnt(userSurveyAnswerVo);
		
		int itemCount = userSurveyAnswerVo.getITEM_COUNT();
		int itempage = userSurveyAnswerVo.getPAGE();

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
