package egovframework.kaist.admin.notices_data.service.impl;
 

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.kaist.admin.notices_data.model.AdminNoticesDataVo;
import egovframework.kaist.admin.notices_data.service.AdminNoticesDataService;

@Service("adminNoticesDataService")
@Transactional
public class AdminNoticesDataServiceImpl implements AdminNoticesDataService {

	
	@Resource(name = "adminNoticesDataMapper")
	private AdminNoticesDataMapper adminNoticesDataMapper;
	
	protected Log log = LogFactory.getLog(AdminNoticesDataServiceImpl.class);
	
 
	@Override
	public int setInsert(AdminNoticesDataVo domain) {
		return adminNoticesDataMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(AdminNoticesDataVo domain) {
		return adminNoticesDataMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(AdminNoticesDataVo domain) {
		return adminNoticesDataMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminNoticesDataMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		AdminNoticesDataVo vo = adminNoticesDataMapper.getView(idx);
		
		ArrayList<String> fileList = new ArrayList<String>();
		
		String[] fileArr = vo.getFILES().split(",");
		
		for(int i = 0; i < fileArr.length; i++)
		{
			if(!fileArr[i].equals(""))
			{
				fileList.add(fileArr[i]);	
			}
			
		}
		model.put("fileLIst", fileList);
		
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getNoticesDataIdCheck(String notices_dataId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminNoticesDataMapper.getListAll();
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map   = (HashMap) list.get(i);
			System.out.println("notices_dataId : " + notices_dataId);
			System.out.println("map.get(\"MEMBER_ID\") : " + map.get("MEMBER_ID"));
			if(map.get("MEMBER_ID").equals(notices_dataId))
			{
				return true;
			}
		}
		return false;
		
	}


	@Override
	public ModelMap getList(AdminNoticesDataVo adminNoticesDataVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminNoticesDataMapper.getList(adminNoticesDataVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = adminNoticesDataMapper.getListCnt(adminNoticesDataVo);
		
		int itemCount = adminNoticesDataVo.getITEM_COUNT();
		int itempage = adminNoticesDataVo.getPAGE();

		PageVO pageVo = new PageVO(itemCount, itemtotalcount, itempage);

		if (pageVo.isItempagenext() == true) {
			modelMap.put("itempagenext", "true");
		} else {
			modelMap.put("itempagenext", "false");
		}

		modelMap.put("page", pageVo.getItempage());
		modelMap.put("itemCount", pageVo.getItemCount());
		modelMap.put("itempagestart", pageVo.getItempagestart());
		modelMap.put("itempageend", pageVo.getItempageend());
		modelMap.put("itemtotalcount", pageVo.getItemtotalcount());
		modelMap.put("itemtotalpage", pageVo.getItemtotalpage());


		
		return modelMap;
		
	}

		
}
