package egovframework.kaist.admin.award.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.kaist.admin.award.model.AdminAwardRequireVo;
import egovframework.kaist.admin.award.model.AdminAwardVo;
import egovframework.kaist.admin.award.service.AdminAwardService;

@Service("adminAwardService")
@Transactional
public class AdminAwardServiceImpl implements AdminAwardService {

	@Resource(name="adminAwardMapper")
	AdminAwardMapper adminAwardMapper;

	@Override
	public ModelMap getAllList(AdminAwardVo adminAwardVo) {
		
		ModelMap modelMap = new ModelMap();
		
		List<?> list = adminAwardMapper.getAwardAllList(adminAwardVo);
		
		System.out.println("size : " + list.size());
		
		int itemtotalcount = adminAwardMapper.getAwardAllListCnt(adminAwardVo);
		int itemCount = adminAwardVo.getITEM_COUNT();
		int itempage = adminAwardVo.getPAGE();
		
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
	public void setAdminAwardData(AdminAwardVo adminAwardVo, String type) {
		
		switch (type) {
		case "insert":
			adminAwardMapper.setAdminAwardDataInsert(adminAwardVo);
			break;
		case "update":
			adminAwardMapper.setAdminAwardDataUpdate(adminAwardVo);
			break;
		case "delete":
			adminAwardMapper.setAdminAwardDataDelete(adminAwardVo);
			break;
		}
		
	}

	@Override
	public ModelMap getAwardDataView(AdminAwardVo adminAwardVo) {
		
		ModelMap model = new ModelMap();
		
		AdminAwardVo view = adminAwardMapper.getAwardViewData(adminAwardVo);
		
		model.put("view", view);
		
		return model;
	}

	@Override
	public List<?> getRequireAllList(AdminAwardRequireVo adminAwardRequireVo) {
		
		List<?> require = adminAwardMapper.getAwardRequireList(adminAwardRequireVo);
		
		return require;
	}

	@Override
	public void setAdminAwardRequireData(AdminAwardRequireVo adminAwardRequireVo, String type) {
		
		switch (type) {
		case "insert":
			adminAwardMapper.setAdminAwardRequireDataInsert(adminAwardRequireVo);
			break;
		case "update":
			adminAwardMapper.setAdminAwardRequireDataUpdate(adminAwardRequireVo);
			break;
		case "delete":
			adminAwardMapper.setAdminAwardRequireDataDelete(adminAwardRequireVo);
			break;
		}
		
	}

	@Override
	public String setAdminAwardDataAjaxInsert(AdminAwardVo adminAwardVo) {
		
		adminAwardMapper.setAdminAwardDataAjaxInsert(adminAwardVo);
		
		String result = adminAwardVo.getIdx();
		
		return result;
	}
	
	
	
}
