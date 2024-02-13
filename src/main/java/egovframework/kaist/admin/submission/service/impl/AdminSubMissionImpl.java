package egovframework.kaist.admin.submission.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.kaist.admin.submission.model.AdminSubMissionDetailVo;
import egovframework.kaist.admin.submission.model.AdminSubMissionFileVo;
import egovframework.kaist.admin.submission.model.AdminSubMissionVo;
import egovframework.kaist.admin.submission.service.AdminSubMissionService;

@Service("adminSubMissionService")
@Transactional
public class AdminSubMissionImpl implements AdminSubMissionService {

	@Resource(name="adminSubMissionMapper")
	AdminSubMissionMapper adminSubMissionMapper;

	@Override
	public ModelMap getAllList(AdminSubMissionVo adminSubMissionVo) {
		
		ModelMap modelMap = new ModelMap();
		
		List<?> list = adminSubMissionMapper.getSubMissionAllList(adminSubMissionVo);
		
		System.out.println("size : " + list.size());
		
		int itemtotalcount = adminSubMissionMapper.getSubMissionAllListCnt(adminSubMissionVo);
		int itemCount = adminSubMissionVo.getITEM_COUNT();
		int itempage = adminSubMissionVo.getPAGE();
		
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
	public void setAdminSubMissionData(AdminSubMissionVo adminSubMissionVo, String type) {
		
		switch (type) {
		case "insert":
			adminSubMissionMapper.setAdminSubMissionDataInsert(adminSubMissionVo);
			break;
		case "update":
			adminSubMissionMapper.setAdminSubMissionDataUpdate(adminSubMissionVo);
			break;
		case "delete":
			adminSubMissionMapper.setAdminSubMissionDataDelete(adminSubMissionVo);
			break;
		}
		
	}

	@Override
	public ModelMap getSubMissionDataView(AdminSubMissionVo adminSubMissionVo) {
		
		ModelMap model = new ModelMap();
		
		//제출물 정보
		AdminSubMissionVo view = adminSubMissionMapper.getSubMissionDataView(adminSubMissionVo);
		
		model.put("view", view);
		
		//제출물 필수정보 가져오기
		List<?> detailList = adminSubMissionMapper.getSubMissionDetailList(adminSubMissionVo);
		model.put("detailList", detailList);
		
		//제출물 파일리스트 가져오기
		List<?> fileList = adminSubMissionMapper.getSubMissionFileList(adminSubMissionVo);
		
		model.put("fileList", fileList);
		
		return model;
	}

	@Override
	public String setAdminSubMissionDataAjaxInsert(AdminSubMissionVo adminSubMissionVo) {
		
		adminSubMissionMapper.setAdminSubMissionDataAjaxInsert(adminSubMissionVo);
		
		String result = adminSubMissionVo.getIdx();
		
		return result;
	}

	@Override
	public void setAdminSubMissionFileData(AdminSubMissionFileVo adminSubMissionFileVo, String type) {
		
		switch (type) {
		case "insert":
			adminSubMissionMapper.setAdminSubMissionFileInsert(adminSubMissionFileVo);
			break;
		case "delete":
			adminSubMissionMapper.setAdminSubMissionFileDelete(adminSubMissionFileVo);
			break;
		}
		
	}

	@Override
	public void setAdminSubMissionDetailData(AdminSubMissionDetailVo adminSubMissionDetailVo, String type) {
		
		switch (type) {
		case "insert":
			adminSubMissionMapper.setAdminSubMissionDetailInsert(adminSubMissionDetailVo);
			break;
		case "update":
			adminSubMissionMapper.setAdminSubMissionDetailUpdate(adminSubMissionDetailVo);
			break;
		case "delete":
			adminSubMissionMapper.setAdminSubMissionDetailDelete(adminSubMissionDetailVo);
			break;
		case "deleteAll":
			adminSubMissionMapper.setAdminSubMissionDetailDeleteAll(adminSubMissionDetailVo);
			break;
		}
		
	}
	
}
