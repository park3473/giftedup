package egovframework.kaist.user.accept_log.service.impl;

import java.util.List;

import egovframework.kaist.user.accept_log.model.UserAcceptLogVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userAcceptLogMapper")
public interface UserAcceptLogMapper {

	public List<?> getListAll();
	
	public int setInsert(UserAcceptLogVo userAcceptLogDomain);

	public boolean setUpdate(UserAcceptLogVo userAcceptLogDomain);

	public boolean setDelete(UserAcceptLogVo userAcceptLogDomain) ;

	public UserAcceptLogVo getView(String Id) ;

	public List<?> getList(UserAcceptLogVo userAcceptLogVo);
	
}
