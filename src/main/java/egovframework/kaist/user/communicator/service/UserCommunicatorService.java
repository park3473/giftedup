package egovframework.kaist.user.communicator.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import egovframework.kaist.user.communicator.model.UserCommStudentVo;
import egovframework.kaist.user.communicator.model.UserCommunicatorVo;
import egovframework.kaist.user.communicator.model.UserSuppliesVo;
import egovframework.kaist.user.communicator.model.UserZoomVo;
import egovframework.kaist.user.member.model.UserMemberVo;

public interface UserCommunicatorService {

	ModelMap getList(UserCommunicatorVo userCommunicatorVo);

	ModelMap getStudentList(UserCommunicatorVo userCommunicatorVo);

	ModelMap getMentoList(UserCommunicatorVo userCommunicatorVo);

	List<?> getStudentPersonnelList(UserCommStudentVo userCommStudentVo);

	ModelMap getMentoStat(UserMemberVo userMemberVo);

	void setSupplies(UserSuppliesVo userSuppliesVo);

	String setComm(UserCommunicatorVo userCommunicatorVo);

	ModelMap getView(UserCommunicatorVo userCommunicatorVo);

	void DelComm(UserCommunicatorVo userCommunicatorVo);

	void UpCOMM(UserCommunicatorVo userCommunicatorVo);

	void UpSupplies(UserSuppliesVo userSuppliesVo);

	void setStudentParticipate(UserCommStudentVo userCommStudentVo);

	int getCommTimeCnt(UserCommunicatorVo userCommunicatorVo);

	void setCommStat(UserCommunicatorVo userCommunicatorVo);

	public ModelMap getStudentAndSupList(UserCommunicatorVo userCommunicatorVo);

	List<?> getZoomList(UserZoomVo userZoomVo);

	void setZoomMember(UserZoomVo userZoomVo);

	UserZoomVo getZoom(UserZoomVo userZoomVo);

	void setStudentEval(UserCommStudentVo userCommStudentVo);

	void setStudentDelete(UserCommStudentVo userCommStudentVo);

	List<?> getZoomView(UserZoomVo userZoomVo);

	void setZoomLog(UserZoomVo userZoomVo);

	int getStudentListCnt(UserCommunicatorVo userCommunicatorVo);



}
