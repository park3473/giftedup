package egovframework.kaist.admin.survey_questionnaire.service.impl;
 

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

import egovframework.kaist.admin.survey_question.model.AdminSurveyQuestionVo;
import egovframework.kaist.admin.survey_question.service.impl.AdminSurveyQuestionMapper;
import egovframework.kaist.admin.survey_questionnaire.model.AdminSurveyQuestionnaireVo;
import egovframework.kaist.admin.survey_questionnaire.service.AdminSurveyQuestionnaireService;
import egovframework.kaist.admin.survey_select.model.AdminSurveySelectVo;
import egovframework.kaist.admin.survey_select.service.impl.AdminSurveySelectMapper;

@Service("adminSurveyQuestionnaireService")
@Transactional
public class AdminSurveyQuestionnaireServiceImpl implements AdminSurveyQuestionnaireService {

	

	@Resource(name = "adminSurveyQuestionnaireMapper")
	private AdminSurveyQuestionnaireMapper adminSurveyQuestionnaireMapper;
	
	@Resource(name = "adminSurveyQuestionMapper")
	private AdminSurveyQuestionMapper adminsurveyQuestionMapper;
	
	
	@Resource(name = "adminSurveySelectMapper")
	private AdminSurveySelectMapper adminSurveySeleteMapper;
	
	protected Log log = LogFactory.getLog(AdminSurveyQuestionnaireServiceImpl.class);
	
 
	@Override
	public int setInsert(AdminSurveyQuestionnaireVo domain) {
		return adminSurveyQuestionnaireMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(AdminSurveyQuestionnaireVo domain) {
		return adminSurveyQuestionnaireMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(AdminSurveyQuestionnaireVo domain) {
		return adminSurveyQuestionnaireMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminSurveyQuestionnaireMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		AdminSurveyQuestionnaireVo vo = adminSurveyQuestionnaireMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getSurveyQuestionnaireIdCheck(String survey_questionnaireId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminSurveyQuestionnaireMapper.getListAll();
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map   = (HashMap) list.get(i);
			System.out.println("survey_questionnaireId : " + survey_questionnaireId);
			System.out.println("map.get(\"MEMBER_ID\") : " + map.get("MEMBER_ID"));
			if(map.get("MEMBER_ID").equals(survey_questionnaireId))
			{
				return true;
			}
		}
		return false;
		
	}


	@Override
	public ModelMap getList(AdminSurveyQuestionnaireVo adminSurveyQuestionnaireVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminSurveyQuestionnaireMapper.getList(adminSurveyQuestionnaireVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = adminSurveyQuestionnaireMapper.getListCnt(adminSurveyQuestionnaireVo);
		
		int itemCount = adminSurveyQuestionnaireVo.getITEM_COUNT();
		int itempage = adminSurveyQuestionnaireVo.getPAGE();

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
	public ModelMap getListZtreeAll(AdminSurveyQuestionnaireVo adminSurveyQuestionnaireVo) {
		AdminSurveyQuestionnaireVo vo = adminSurveyQuestionnaireMapper.getView(adminSurveyQuestionnaireVo.getIDX()); 
		String BUSEOROOT = vo.getTITLE();
		
		ModelMap modelMap = new ModelMap();
		
		
		AdminSurveyQuestionVo adminSurveyQuestionVo = new AdminSurveyQuestionVo();
		adminSurveyQuestionVo.setSURVEY_IDX(adminSurveyQuestionnaireVo.getSURVEY_IDX());
		adminSurveyQuestionVo.setSURVEY_QUESLIONNAIRE_IDX(adminSurveyQuestionnaireVo.getIDX());
		adminSurveyQuestionVo.setOFFSET(0);
		adminSurveyQuestionVo.setLIMIT(999999999);
		
		
		AdminSurveySelectVo adminsurveySelectVo = new AdminSurveySelectVo();
		adminsurveySelectVo.setSURVEY_QUESLIONNAIRE_IDX(adminSurveyQuestionnaireVo.getIDX());
		adminsurveySelectVo.setOFFSET(0);
		adminsurveySelectVo.setLIMIT(999999);
		
		
		List<?> list = adminsurveyQuestionMapper.getList(adminSurveyQuestionVo);
				
		List<?> list2 = adminSurveySeleteMapper.getList(adminsurveySelectVo);
		
		String json = "[{IDX:"+vo.getIDX()+",id:0, pId:0, name: \""+BUSEOROOT+"\", open:true, add:1, del:0, update:1,type:3},";

		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map = (HashMap) list.get(i);
			String IDX = (String) map.get("IDX").toString();

			String QUESTION = (String) map.get("QUESTION").toString();
			
			json += "{IDX:"+IDX+", id:"+IDX+", pId:0, name:\""+QUESTION+"\", open:true, isParent :true, add:1, del:1, update:1,type:1},";

			
			 
			for(int j = 0; j < list2.size(); j++)
			{
				 HashMap map2 = (HashMap) list2.get(j);
				 String SELECT_ITEM = (String) map2.get("SELECT_ITEM").toString();
				 String IDX2 = (String) map2.get("IDX").toString();
				 String SURVEY_QUESTION_IDX = (String) map2.get("SURVEY_QUESTION_IDX").toString();
				 String SURVEY_IDX = (String) map2.get("SURVEY_IDX").toString();
				 if(SURVEY_QUESTION_IDX.equals(IDX))
				 {
					 json += "{IDX:"+IDX2+", id:1"+i+j+", pId:"+IDX+",SURVEY_SELECT_IDX:\""+IDX2 + "\", name:\""+SELECT_ITEM+"\", open:true,isParent:false, add:0, del:1, update:1, type:2},";	 

				 }
			 }
		}
		json = json.substring(0, json.length()-1);
		json += "]";
		log.debug("json : " + json);
		modelMap.addAttribute("json", json);
		modelMap.addAttribute("list", list);
		modelMap.addAttribute("listSelect", list2);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}
		
}
