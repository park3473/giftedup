package egovframework.kaist.user.mentoring.service.impl;

import java.util.List;

import egovframework.kaist.user.mentoring.model.UserMentoringVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("userMentoringMapper")
public interface UserMentoringMapper {

	public List<?> getListAll();
	
	public int setInsert(UserMentoringVo userMentoringDomain);

	public boolean setUpdate(UserMentoringVo userMentoringDomain);

	public boolean setDelete(UserMentoringVo userMentoringDomain) ;

	public UserMentoringVo getView(String Id) ;

	public List<?> getList(UserMentoringVo adminMentoringVo);

	public int getListCnt(UserMentoringVo adminMentoringVo);
	
}
