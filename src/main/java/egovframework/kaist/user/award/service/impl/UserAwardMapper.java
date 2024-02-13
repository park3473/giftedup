package egovframework.kaist.user.award.service.impl;

import java.util.List;

import egovframework.kaist.user.award.model.UserAwardRequireVo;
import egovframework.kaist.user.award.model.UserAwardVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userAwardMapper")
public interface UserAwardMapper {

	public List<?> getAwardAllList(UserAwardVo userAwardVo);

	public int getAwardAllListCnt(UserAwardVo userAwardVo);

	public UserAwardVo getAwardViewData(UserAwardVo userAwardVo);

	public List<?> getAwardRequireList(UserAwardRequireVo userAwardRequireVo);

}
