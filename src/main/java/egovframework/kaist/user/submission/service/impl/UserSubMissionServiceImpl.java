package egovframework.kaist.user.submission.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.kaist.admin.submission.model.AdminSubMissionVo;
import egovframework.kaist.user.award.model.UserAwardVo;
import egovframework.kaist.user.award.service.impl.UserAwardMapper;
import egovframework.kaist.user.submission.model.UserSubMissionDetailVo;
import egovframework.kaist.user.submission.model.UserSubMissionFileVo;
import egovframework.kaist.user.submission.model.UserSubMissionVo;
import egovframework.kaist.user.submission.service.UserSubMissionService;

@Service("userSubMissionService")
@Transactional
public class UserSubMissionServiceImpl implements UserSubMissionService {

	@Resource(name="userSubMissionMapper")
	UserSubMissionMapper userSubMissionMapper;

	@Resource(name="userAwardMapper")
	UserAwardMapper userAwardMapper;
	
	@Override
	public ModelMap getAllList(UserSubMissionVo userSubMissionVo) {
		
		ModelMap modelMap = new ModelMap();
		
		List<?> list = userSubMissionMapper.getSubMissionAllList(userSubMissionVo);
		
		System.out.println("size : " + list.size());
		
		int itemtotalcount = userSubMissionMapper.getSubMissionAllListCnt(userSubMissionVo);
		int itemCount = userSubMissionVo.getITEM_COUNT();
		int itempage = userSubMissionVo.getPAGE();
		
		PageVO pageVo = new PageVO(itemCount, itemtotalcount, itempage);
		
		if(pageVo.isItempagenext() == true){
			modelMap.put("itempagenext", "true");
		}else {
			modelMap.put("itempagenext", "false");
		}
		
		System.out.println(pageVo.getItempage());
		
		modelMap.put("page", pageVo.getItempage());
		System.out.println("itemCount" + pageVo.getItemCount());
		modelMap.put("itemCount", pageVo.getItemCount());
		modelMap.put("itempagestart", pageVo.getItempagestart());
		modelMap.put("itempageend", pageVo.getItempageend());
		modelMap.put("itemtotalcount", pageVo.getItemtotalcount());
		modelMap.put("itemtotalpage", pageVo.getItemtotalpage());
		
		modelMap.put("list", list);
		
		return modelMap;
	}

	@Override
	public String setUserSubMissionDataAjaxInsert(UserSubMissionVo userSubMissionVo) {
		
		userSubMissionMapper.setUserSubMissionDataAjaxInsert(userSubMissionVo);
		
		String result = userSubMissionVo.getIdx();
		
		return result;
		
	}

	@Override
	public ModelMap getSubMissionDataView(UserSubMissionVo userSubMissionVo) {
		
		ModelMap model = new ModelMap();
		
		//제출물 정보
		UserSubMissionVo view = userSubMissionMapper.getSubMissionDataView(userSubMissionVo);
		
		model.put("view", view);
		
		UserAwardVo UserAwardVo = new UserAwardVo();
		
		//참여 게시판 정보
		UserAwardVo.setIdx(userSubMissionVo.getAward_idx());
		UserAwardVo = userAwardMapper.getAwardViewData(UserAwardVo);
		
		model.put("award", UserAwardVo);
		
		//제출물 필수정보 가져오기
		List<?> detailList = userSubMissionMapper.getSubMissionDetailList(userSubMissionVo);
		model.put("detailList", detailList);
		
		//제출물 파일리스트 가져오기
		List<?> fileList = userSubMissionMapper.getSubMissionFileList(userSubMissionVo);
		
		model.put("fileList", fileList);
		
		model.put("fileListSize", fileList.size());
		
		return model;
		
	}

	@Override
	public void setUserSubMissionData(UserSubMissionVo userSubMissionVo, String type) {
		
		switch (type) {
		case "insert":
			userSubMissionMapper.setUserSubMissionDataInsert(userSubMissionVo);
			break;
		case "update":
			userSubMissionMapper.setUserSubMissionDataUpdate(userSubMissionVo);
			break;
		case "delete":
			userSubMissionMapper.setUserSubMissionDataDelete(userSubMissionVo);
			break;
		}
		
	}

	@Override
	public void setUserSubMissionDetailData(UserSubMissionDetailVo userSubMissionDetailVo, String type) {
		
		switch (type) {
		case "insert":
			userSubMissionMapper.setUserSubMissionDetailInsert(userSubMissionDetailVo);
			break;
		case "update":
			userSubMissionMapper.setUserSubMissionDetailUpdate(userSubMissionDetailVo);
			break;
		case "delete":
			userSubMissionMapper.setUserSubMissionDetailDelete(userSubMissionDetailVo);
			break;
		case "deleteAll":
			userSubMissionMapper.setUserSubMissionDetailDeleteAll(userSubMissionDetailVo);
			break;
		}
		
	}

	@Override
	public void setUserSubMissionFileData(UserSubMissionFileVo userSubMissionFileVo, String type) {
		
		switch (type) {
		case "insert":
			userSubMissionMapper.setUserSubMissionFileInsert(userSubMissionFileVo);
			break;
		case "delete":
			userSubMissionMapper.setUserSubMissionFileDelete(userSubMissionFileVo);
			break;
		}
		
	}
	
	
	
}
