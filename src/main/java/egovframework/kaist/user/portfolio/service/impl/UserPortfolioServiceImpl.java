package egovframework.kaist.user.portfolio.service.impl;
 

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

import egovframework.kaist.user.portfolio.model.UserPortfolioVo;
import egovframework.kaist.user.portfolio.service.UserPortfolioService;

@Service("userPortfolioService")
@Transactional
public class UserPortfolioServiceImpl implements UserPortfolioService {

	
	@Resource(name = "userPortfolioMapper")
	private UserPortfolioMapper userPortfolioMapper;
	
	protected Log log = LogFactory.getLog(UserPortfolioServiceImpl.class);
	
 
	@Override
	public int setInsert(UserPortfolioVo domain) {
		return userPortfolioMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(UserPortfolioVo domain) {
		return userPortfolioMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(UserPortfolioVo domain) {
		return userPortfolioMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = userPortfolioMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(UserPortfolioVo userPortfolioVo) {
		ModelMap model = new ModelMap();
		UserPortfolioVo vo = userPortfolioMapper.getView(userPortfolioVo);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getPortfolioIdCheck(String portfolioId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userPortfolioMapper.getListAll();
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map   = (HashMap) list.get(i);
			System.out.println("portfolioId : " + portfolioId);
			System.out.println("map.get(\"MEMBER_ID\") : " + map.get("MEMBER_ID"));
			if(map.get("MEMBER_ID").equals(portfolioId))
			{
				return true;
			}
		}
		return false;
		
	}


	@Override
	public ModelMap getList(UserPortfolioVo userPortfolioVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userPortfolioMapper.getList(userPortfolioVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = userPortfolioMapper.getListCnt(userPortfolioVo);
		
		int itemCount = userPortfolioVo.getITEM_COUNT();
		int itempage = userPortfolioVo.getPAGE();

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
		System.out.println("fdsdsf");
		return modelMap;
		
	}

	@Override
	public Object getView2(String idx) {
		ModelMap model = new ModelMap();
		UserPortfolioVo vo = userPortfolioMapper.getView2(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public HashMap<String,String> getSummary(UserPortfolioVo userPortfolioVo) {
		return userPortfolioMapper.getSummary(userPortfolioVo);
	}
	
	@Override
	public HashMap<String,String> getSummary2021(UserPortfolioVo userPortfolioVo) {
		return userPortfolioMapper.getSummary2021(userPortfolioVo);
	}

	@Override
	public List<?> getMatchingList(UserPortfolioVo userPortfolioVo) {
		// TODO Auto-generated method stub
		List<?> MatchingList = userPortfolioMapper.getMatchingList(userPortfolioVo);
		
		return MatchingList;
	}

	@Override
	public String getMatchingLastYear(UserPortfolioVo userPortfolioVo) {
		// TODO Auto-generated method stub
		
		String MatchingLastYear = userPortfolioMapper.getMatchingLastYear(userPortfolioVo);
		
		return MatchingLastYear;
	}

		
}
