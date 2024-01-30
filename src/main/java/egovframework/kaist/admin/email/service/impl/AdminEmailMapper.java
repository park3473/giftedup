package egovframework.kaist.admin.email.service.impl;

import java.util.List;

import egovframework.kaist.admin.email.model.AdminEmailVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("adminEmailMapper")
public interface AdminEmailMapper {

	public List<?> getListAll();
	
	public int setInsert(AdminEmailVo userEemailDomain);

	public boolean setUpdate(AdminEmailVo userEemailDomain);

	public boolean setDelete(AdminEmailVo userEemailDomain) ;

	public AdminEmailVo getView(String Id) ;

	public int getCountEemail(AdminEmailVo adminEemailVo);
	
}
