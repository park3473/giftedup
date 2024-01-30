package egovframework.kaist.admin.portfolio.service.impl;

import java.util.HashMap;
import java.util.List;

import egovframework.kaist.admin.portfolio.model.AdminPortfolioVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminPortfolioMapper")
public interface AdminPortfolioMapper {

	public List<?> getListAll();
	
	public int setInsert(AdminPortfolioVo userPortfolioDomain);

	public boolean setUpdate(AdminPortfolioVo userPortfolioDomain);

	public boolean setDelete(AdminPortfolioVo userPortfolioDomain) ;

	public AdminPortfolioVo getView(String Id) ;

	public List<?> getList(AdminPortfolioVo adminPortfolioVo);

	public int getListCnt(AdminPortfolioVo adminPortfolioVo);

	public List<?> getListAllMemberIdIn(String memberId);

	public HashMap getListStat(String yEAR);

	public int getEVAL_OPEN_Y_CNT();

	public int getEVAL_OPEN_N_CNT();

	public List<?> getListExcelAll(AdminPortfolioVo adminPortfolioVo);
	
}
