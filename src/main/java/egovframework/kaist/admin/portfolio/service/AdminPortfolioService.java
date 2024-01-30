package egovframework.kaist.admin.portfolio.service;

import org.springframework.ui.ModelMap;

import egovframework.kaist.admin.portfolio.model.AdminPortfolioVo;

public interface AdminPortfolioService {

	public int setInsert(AdminPortfolioVo userPortfolioDomain);

	public boolean setUpdate(AdminPortfolioVo userPortfolioDomain);
	
	public boolean setDelete(AdminPortfolioVo userPortfolioDomain);
	
	public ModelMap getListAll();
	
	ModelMap getView(String id);

	public boolean getPortfolioIdCheck(String portfolioId);

	public ModelMap getList(AdminPortfolioVo adminPortfolioVo);

	public ModelMap getListAllMemberIdIn(String memberId);

	public ModelMap getListStat(String yEAR);

	public int getEVAL_OPEN_Y_CNT();

	public int getEVAL_OPEN_N_CNT();

	public ModelMap getListExcelAll(AdminPortfolioVo adminPortfolioVo);

}
