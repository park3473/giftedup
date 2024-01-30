package egovframework.kaist.user.communicator.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.kaist.user.communicator.model.UserCommStudentVo;
import egovframework.kaist.user.communicator.model.UserCommunicatorVo;
import egovframework.kaist.user.communicator.model.UserSuppliesVo;
import egovframework.kaist.user.communicator.model.UserZoomVo;
import egovframework.kaist.user.communicator.service.UserCommunicatorService;
import egovframework.kaist.user.member.model.UserMemberVo;


@Service("userCommunicatorService")
public class UserCommunicatorServiceImpl implements UserCommunicatorService {

	
	@Resource(name = "userCommunicatorMapper")
	private UserCommunicatorMapper userCommunicatorMapper;

	

	@Override
	public ModelMap getList(UserCommunicatorVo userCommunicatorVo) {
		
		ModelMap model = new ModelMap();
		
		List<?> List = userCommunicatorMapper.getCommList(userCommunicatorVo);
		
		int itemtotalcount = userCommunicatorMapper.getCommListCnt(userCommunicatorVo);
		
		int itemcount =  userCommunicatorVo.getITEM_COUNT();
		int itempage = userCommunicatorVo.getPAGE();
		
		PageVO pageVo = new PageVO(itemcount , itemtotalcount , itempage);
		
		if(pageVo.isItempagenext() == true) {
			model.put("itempagenext", "true");
		}else {
			model.put("itempagenext", "false");
		}
		
		model.put("page", pageVo.getItempage());
		model.put("itemcount", pageVo.getItemCount());
		model.put("itempagestart", pageVo.getItempagestart());
		model.put("itempageend", pageVo.getItempageend());
		model.put("itemtotalcount", pageVo.getItemtotalcount());
		model.put("itemtotalpage", pageVo.getItemtotalpage());
		
		model.put("List", List);
		
		return model;
	}

	@Override
	public ModelMap getStudentList(UserCommunicatorVo userCommunicatorVo) {
		
		ModelMap model = new ModelMap();
		
		List<?> List = userCommunicatorMapper.getStudentList(userCommunicatorVo);
		
		System.out.println("List_Size : "+List.size() );
		
		
		int itemtotalcount = userCommunicatorMapper.getStudentListCnt(userCommunicatorVo);
		
		int itemCount =  userCommunicatorVo.getITEM_COUNT();
		int itempage = userCommunicatorVo.getITEM_PAGE();
		
		PageVO pageVo = new PageVO(itemCount , itemtotalcount , itempage);
		
		if(pageVo.isItempagenext() == true) {
			model.put("itempagenext", "true");
		}else {
			model.put("itempagenext", "false");
		}
		
		model.put("page", pageVo.getItempage());
		model.put("itemcount", pageVo.getItemCount());
		model.put("itempagestart", pageVo.getItempagestart());
		model.put("itempageend", pageVo.getItempageend());
		model.put("itemtotalcount", pageVo.getItemtotalcount());
		model.put("itemtotalpage", pageVo.getItemtotalpage());
		
		List<?> NowList = userCommunicatorMapper.getStudentNowList(userCommunicatorVo);
		
		
		model.put("List", List);
		
		model.put("NowList", NowList);
		
		
		return model;
	}

	@Override
	public ModelMap getMentoList(UserCommunicatorVo userCommunicatorVo) {
		
		ModelMap model = new ModelMap();
		
		List<?> List = userCommunicatorMapper.getMentoList(userCommunicatorVo);
		
		model.put("List", List);
		
		System.out.println("List_Size : "+List.size() );
		
		
		int itemtotalcount = userCommunicatorMapper.getMentoListCnt(userCommunicatorVo);
		
		int itemCount =  userCommunicatorVo.getITEM_COUNT();
		int itempage = userCommunicatorVo.getITEM_PAGE();
		
		PageVO pageVo = new PageVO(itemCount , itemtotalcount , itempage);
		
		if(pageVo.isItempagenext() == true) {
			model.put("itempagenext", "true");
		}else {
			model.put("itempagenext", "false");
		}
		
		model.put("page", pageVo.getItempage());
		model.put("itemcount", pageVo.getItemCount());
		model.put("itempagestart", pageVo.getItempagestart());
		model.put("itempageend", pageVo.getItempageend());
		model.put("itemtotalcount", pageVo.getItemtotalcount());
		model.put("itemtotalpage", pageVo.getItemtotalpage());
		
		List<?> NowList = userCommunicatorMapper.getMentoNowList(userCommunicatorVo);
		
		model.put("NowList", NowList);
		
		
		return model;
	}

	@Override
	public List<?> getStudentPersonnelList(UserCommStudentVo userCommStudentVo) {
		
		List<?> list = userCommunicatorMapper.getStudentPersonnelList(userCommStudentVo);
		
		return list;
	}

	@Override
	public ModelMap getMentoStat(UserMemberVo userMemberVo) {
		// TODO Auto-generated method stub
		
		ModelMap model = new ModelMap();
		
		UserMemberVo userMemberVo2 = userCommunicatorMapper.getMentoStat(userMemberVo);
		
		model.put("Mento", userMemberVo2);
		
		return model;
	}

	@Override
	public void setSupplies(UserSuppliesVo userSuppliesVo) {
		// TODO Auto-generated method stub
		userCommunicatorMapper.setSupplies(userSuppliesVo);
	}

	@Override
	public String setComm(UserCommunicatorVo userCommunicatorVo) {
		// TODO Auto-generated method stub
		int PKey = userCommunicatorMapper.setComm(userCommunicatorVo);
		
		String PKEY = String.valueOf(PKey);
		
		System.out.println(userCommunicatorVo.getCOMM_IDX());
		
		String result = userCommunicatorVo.getCOMM_IDX();
		
		return result;
	}

	@Override
	public ModelMap getView(UserCommunicatorVo userCommunicatorVo) {
		
		ModelMap model = new ModelMap();
		
		UserCommunicatorVo View = userCommunicatorMapper.getView(userCommunicatorVo);
		
		List<?> Suplist = userCommunicatorMapper.getSupList(userCommunicatorVo);
		
		int PERSONNELCnt = userCommunicatorMapper.getPersonnelCnt(userCommunicatorVo);
		
		model.put("PERSONNELCnt", PERSONNELCnt);
		
		model.put("View", View);
		
		model.put("Suplist", Suplist);
		
		return model;
	}

	@Override
	public void DelComm(UserCommunicatorVo userCommunicatorVo) {
		// TODO Auto-generated method stub
		
		userCommunicatorMapper.DelComm(userCommunicatorVo);
		
	}

	@Override
	public void UpCOMM(UserCommunicatorVo userCommunicatorVo) {
		// TODO Auto-generated method stub
		userCommunicatorMapper.UpCOMM(userCommunicatorVo);
	}

	@Override
	public void UpSupplies(UserSuppliesVo userSuppliesVo) {
		
		userCommunicatorMapper.UpSupplies(userSuppliesVo);
		
	}

	@Override
	public void setStudentParticipate(UserCommStudentVo userCommStudentVo) {
		
		userCommunicatorMapper.setStudentParticipate(userCommStudentVo);
	}

	@Override
	public int getCommTimeCnt(UserCommunicatorVo userCommunicatorVo) {
		// TODO Auto-generated method stub
		
		int CommTimeCnt = userCommunicatorMapper.getCommTimeCnt(userCommunicatorVo);
		
		return CommTimeCnt;
	}

	@Override
	public void setCommStat(UserCommunicatorVo userCommunicatorVo) {
		// TODO Auto-generated method stub
		
		userCommunicatorMapper.setCommStat(userCommunicatorVo);
		
	}

	@Override
	public ModelMap getStudentAndSupList(UserCommunicatorVo userCommunicatorVo) {
		// TODO Auto-generated method stub
		ModelMap modelMap = new ModelMap();
		
		UserCommStudentVo userCommStudentVo = null;
		
		System.out.println("??");
		
		String idx = String.valueOf(userCommunicatorVo.getCOMM_IDX());
		
		List<?> StudentList = userCommunicatorMapper.getStudentPersonnelListIdx(idx);
		
		List<?> SupList = userCommunicatorMapper.getSupList(userCommunicatorVo);
		
		UserCommunicatorVo CommView = userCommunicatorMapper.getView(userCommunicatorVo);
		
		modelMap.addAttribute("StudentList", StudentList);
		
		modelMap.put("SupList", SupList);
		
		modelMap.put("CommView", CommView);
		
		return modelMap;
	}

	@Override
	public List<?> getZoomList(UserZoomVo userZoomVo) {
		// TODO Auto-generated method stub
		List<?> list = userCommunicatorMapper.getZoomList(userZoomVo);
		
		return list;
	}

	@Override
	public void setZoomMember(UserZoomVo userZoomVo) {
		// TODO Auto-generated method stub
		userCommunicatorMapper.setZoomMember(userZoomVo);
	}

	@Override
	public UserZoomVo getZoom(UserZoomVo userZoomVo) {
		// TODO Auto-generated method stub
		return userCommunicatorMapper.getZoom(userZoomVo);
		
	}

	@Override
	public void setStudentEval(UserCommStudentVo userCommStudentVo) {
		// TODO Auto-generated method stub
		userCommunicatorMapper.setStudentEval(userCommStudentVo);
	}

	@Override
	public void setStudentDelete(UserCommStudentVo userCommStudentVo) {
		// TODO Auto-generated method stub
		userCommunicatorMapper.setStudentDelete(userCommStudentVo);
	}

	@Override
	public List<?> getZoomView(UserZoomVo userZoomVo) {
		
		List<?> list = userCommunicatorMapper.getZoomView(userZoomVo);
		return list;
	}

	@Override
	public void setZoomLog(UserZoomVo userZoomVo) {
		// TODO Auto-generated method stub
		userCommunicatorMapper.setZoomLog(userZoomVo);
	}

	@Override
	public int getStudentListCnt(UserCommunicatorVo userCommunicatorVo) {
		
		int Cnt = userCommunicatorMapper.getStudentListCnt(userCommunicatorVo);
		
		return Cnt;
	}
	
	
}
