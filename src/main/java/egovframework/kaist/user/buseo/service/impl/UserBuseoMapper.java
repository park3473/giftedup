package egovframework.kaist.user.buseo.service.impl;

import java.util.List;

import egovframework.kaist.user.buseo.model.UserBuseoVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userBuseoMapper")
public interface UserBuseoMapper {

	public List<?> getListAll();
	
	public int setInsert(UserBuseoVo userBuseoDomain);

	public boolean setUpdate(UserBuseoVo userBuseoDomain);

	public boolean setDelete(UserBuseoVo userBuseoDomain) ;

	public UserBuseoVo getView(String Id) ;

	public boolean setInsertToUpdate(UserBuseoVo vo);

	
}
