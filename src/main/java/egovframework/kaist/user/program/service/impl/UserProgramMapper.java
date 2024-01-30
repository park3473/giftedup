package egovframework.kaist.user.program.service.impl;

import java.util.ArrayList;
import java.util.List;

import egovframework.kaist.user.program.model.UserProgramVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userProgramMapper")
public interface UserProgramMapper {

	public List<?> getListAll();
	
	public int setInsert(UserProgramVo userProgramDomain);

	public boolean setUpdate(UserProgramVo userProgramDomain);

	public boolean setDelete(UserProgramVo userProgramDomain) ;

	public UserProgramVo getView(String Id) ;

	public List<?> getList(UserProgramVo userProgramVo);

	public int getListCnt(UserProgramVo userProgramVo);

	public List<?> getListGroupByYear();

	public UserProgramVo getView2(String programid);
	
}
