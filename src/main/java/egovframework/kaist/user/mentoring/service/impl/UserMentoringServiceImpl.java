package egovframework.kaist.user.mentoring.service.impl;
 

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.kaist.user.mentoring.model.UserMentoringVo;
import egovframework.kaist.user.mentoring.service.UserMentoringService;

@Service("userMentoringService")
@Transactional
public class UserMentoringServiceImpl implements UserMentoringService {

	
	@Resource(name = "userMentoringMapper")
	private UserMentoringMapper userMentoringMapper;
	
	protected Log log = LogFactory.getLog(UserMentoringServiceImpl.class);
	
 
	@Override
	public int setInsert(UserMentoringVo domain) {
		return userMentoringMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(UserMentoringVo domain) {
		return userMentoringMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(UserMentoringVo domain) {
		return userMentoringMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = userMentoringMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		UserMentoringVo vo = userMentoringMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getMentoringIdCheck(String mentoringId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userMentoringMapper.getListAll();
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map   = (HashMap) list.get(i);
			System.out.println("mentoringId : " + mentoringId);
			System.out.println("map.get(\"MEMBER_ID\") : " + map.get("MEMBER_ID"));
			if(map.get("MEMBER_ID").equals(mentoringId))
			{
				return true;
			}
		}
		return false;
		
	}


	@Override
	public ModelMap getList(UserMentoringVo userMentoringVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userMentoringMapper.getList(userMentoringVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = userMentoringMapper.getListCnt(userMentoringVo);
		
		int itemCount = userMentoringVo.getITEM_COUNT();
		int itempage = userMentoringVo.getPAGE();

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
