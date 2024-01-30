package egovframework.kaist.admin.survey_answer.service.impl;
 

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.kaist.admin.survey_answer.model.AdminSurveyAnswerVo;
import egovframework.kaist.admin.survey_answer.service.AdminSurveyAnswerService;


@Service("adminSurveyAnswerService")
@Transactional
public class AdminSurveyAnswerServiceImpl implements AdminSurveyAnswerService {

	
	@Resource(name = "adminSurveyAnswerMapper")
	private AdminSurveyAnswerMapper adminSurveyAnswerMapper;
	
	protected Log log = LogFactory.getLog(AdminSurveyAnswerServiceImpl.class);
	
 
	@Override
	public int setInsert(AdminSurveyAnswerVo domain) {
		return adminSurveyAnswerMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(AdminSurveyAnswerVo domain) {
		return adminSurveyAnswerMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(AdminSurveyAnswerVo domain) {
		return adminSurveyAnswerMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminSurveyAnswerMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		AdminSurveyAnswerVo vo = adminSurveyAnswerMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getSurveyAnswerIdCheck(String survey_answerId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminSurveyAnswerMapper.getListAll();
		
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
	public ModelMap getList(AdminSurveyAnswerVo adminSurveyAnswerVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminSurveyAnswerMapper.getList(adminSurveyAnswerVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = adminSurveyAnswerMapper.getListCnt(adminSurveyAnswerVo);
		
		int itemCount = adminSurveyAnswerVo.getITEM_COUNT();
		int itempage = adminSurveyAnswerVo.getPAGE();

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
	public List<HashMap> getListMemberAll(String surveyid) {
		ModelMap modelMap = new ModelMap();
		List<HashMap> list = adminSurveyAnswerMapper.getListMemberAll(surveyid);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return list;
	}

	@Override
	public List<HashMap> getListStat(AdminSurveyAnswerVo adminSurveyAnswerVo) {
		ModelMap modelMap = new ModelMap();
		List<HashMap> list = adminSurveyAnswerMapper.getListStat(adminSurveyAnswerVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return list;
	}

		
}
