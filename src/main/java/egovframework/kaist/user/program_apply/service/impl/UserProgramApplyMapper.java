package egovframework.kaist.user.program_apply.service.impl;

import java.util.ArrayList;
import java.util.List;

import egovframework.kaist.user.program.model.UserProgramVo;
import egovframework.kaist.user.program_apply.model.UserProgramApplyVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userProgramApplyMapper")
public interface UserProgramApplyMapper {

	public List<?> getListAll();
	
	public int setInsert(UserProgramApplyVo userProgramApplyDomain);

	public boolean setUpdate(UserProgramApplyVo userProgramApplyDomain);

	public boolean setDelete(UserProgramApplyVo userProgramApplyDomain) ;

	public UserProgramApplyVo getView(String Id) ;

	public List<?> getList(UserProgramVo userProgramVo);

	public int getListCnt(UserProgramVo userProgramVo);

	public UserProgramApplyVo getApplyView(UserProgramApplyVo userProgramApplyDomain);
	
}
