package egovframework.kaist.user.communicator.service.impl;

import java.util.List;

import egovframework.kaist.user.communicator.model.UserCommStudentVo;
import egovframework.kaist.user.communicator.model.UserCommunicatorVo;
import egovframework.kaist.user.communicator.model.UserSuppliesVo;
import egovframework.kaist.user.communicator.model.UserZoomVo;
import egovframework.kaist.user.member.model.UserMemberVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;


@Mapper("userCommunicatorMapper")
public interface UserCommunicatorMapper {

	List<?> getCommList(UserCommunicatorVo userCommunicatorVo);

	List<?> getStudentList(UserCommunicatorVo userCommunicatorVo);

	List<?> getStudentNowList(UserCommunicatorVo userCommunicatorVo);

	int getStudentListCnt(UserCommunicatorVo userCommunicatorVo);

	List<?> getMentoList(UserCommunicatorVo userCommunicatorVo);

	int getMentoListCnt(UserCommunicatorVo userCommunicatorVo);

	List<?> getMentoNowList(UserCommunicatorVo userCommunicatorVo);

	int getPersonnelCnt(UserCommunicatorVo userCommunicatorVo);

	List<?> getStudentPersonnelList(UserCommStudentVo userCommStudentVo);

	UserMemberVo getMentoStat(UserMemberVo userMemberVo);

	void setSupplies(UserSuppliesVo userSuppliesVo);

	int setComm(UserCommunicatorVo userCommunicatorVo);

	UserCommunicatorVo getView(UserCommunicatorVo userCommunicatorVo);

	List<?> getSupList(UserCommunicatorVo userCommunicatorVo);

	void DelComm(UserCommunicatorVo userCommunicatorVo);

	void UpCOMM(UserCommunicatorVo userCommunicatorVo);

	void UpSupplies(UserSuppliesVo userSuppliesVo);

	int getCommListCnt(UserCommunicatorVo userCommunicatorVo);

	void setStudentParticipate(UserCommStudentVo userCommStudentVo);

	int getCommTimeCnt(UserCommunicatorVo userCommunicatorVo);

	void setCommStat(UserCommunicatorVo userCommunicatorVo);

	List<?> getStudentPersonnelListIdx(String idx);

	List<?> getZoomList(UserZoomVo userZoomVo);

	void setZoomMember(UserZoomVo userZoomVo);

	UserZoomVo getZoom(UserZoomVo userZoomVo);

	void setStudentEval(UserCommStudentVo userCommStudentVo);

	void setStudentDelete(UserCommStudentVo userCommStudentVo);

	List<?> getZoomView(UserZoomVo userZoomVo);

	void setZoomLog(UserZoomVo userZoomVo);

}
