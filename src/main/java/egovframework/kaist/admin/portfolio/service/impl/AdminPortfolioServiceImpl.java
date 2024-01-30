package egovframework.kaist.admin.portfolio.service.impl;
 

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

import egovframework.kaist.admin.portfolio.model.AdminPortfolioVo;
import egovframework.kaist.admin.portfolio.service.AdminPortfolioService;

@Service("adminPortfolioService")
@Transactional
public class AdminPortfolioServiceImpl implements AdminPortfolioService {

	
	@Resource(name = "adminPortfolioMapper")
	private AdminPortfolioMapper adminPortfolioMapper;
	
	protected Log log = LogFactory.getLog(AdminPortfolioServiceImpl.class);
	
 
	@Override
	public int setInsert(AdminPortfolioVo domain) {
		return adminPortfolioMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(AdminPortfolioVo domain) {
		return adminPortfolioMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(AdminPortfolioVo domain) {
		return adminPortfolioMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminPortfolioMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		AdminPortfolioVo vo = adminPortfolioMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getPortfolioIdCheck(String portfolioId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminPortfolioMapper.getListAll();
		
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
	public ModelMap getList(AdminPortfolioVo adminPortfolioVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminPortfolioMapper.getList(adminPortfolioVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = adminPortfolioMapper.getListCnt(adminPortfolioVo);
		
		int itemCount = adminPortfolioVo.getITEM_COUNT();
		int itempage = adminPortfolioVo.getPAGE();

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
	public ModelMap getListAllMemberIdIn(String memberId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminPortfolioMapper.getListAllMemberIdIn(memberId);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getListStat(String yEAR) {
		ModelMap modelMap = new ModelMap();
		HashMap list = adminPortfolioMapper.getListStat(yEAR);
		modelMap.addAttribute("pageDomain", list);
		
		return modelMap;
	}

	@Override
	public int getEVAL_OPEN_Y_CNT() {
		return adminPortfolioMapper.getEVAL_OPEN_Y_CNT();
	}

	@Override
	public int getEVAL_OPEN_N_CNT() {
		
		return adminPortfolioMapper.getEVAL_OPEN_N_CNT();
	}

	@Override
	public ModelMap getListExcelAll(AdminPortfolioVo adminPortfolioVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminPortfolioMapper.getListExcelAll(adminPortfolioVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

		
}
