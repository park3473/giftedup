package egovframework.kaist.user.notices_data.service.impl;
 

import java.net.URLDecoder;
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

import egovframework.kaist.user.notices_data.model.UserNoticesDataVo;
import egovframework.kaist.user.notices_data.service.UserNoticesDataService;

@Service("userNoticesDataService")
@Transactional
public class UserNoticesDataServiceImpl implements UserNoticesDataService {

	
	@Resource(name = "userNoticesDataMapper")
	private UserNoticesDataMapper userNoticesDataMapper;
	
	protected Log log = LogFactory.getLog(UserNoticesDataServiceImpl.class);
	
 
	@Override
	public int setInsert(UserNoticesDataVo domain) {
		return userNoticesDataMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(UserNoticesDataVo domain) {
		return userNoticesDataMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(UserNoticesDataVo domain) {
		return userNoticesDataMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = userNoticesDataMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		
		userNoticesDataMapper.setUpdateReadCntAdd(idx);
		
		
		ModelMap model = new ModelMap();
		UserNoticesDataVo vo = userNoticesDataMapper.getView(idx);
		
		ArrayList<HashMap> fileList = new ArrayList<HashMap>();
		
		String[] fileArr = vo.getFILES().split(",");
		
		for(int i = 0; i < fileArr.length; i++)
		{
			if(!fileArr[i].equals(""))
			{
				HashMap map = new HashMap();
				
				String filename = fileArr[i];
				filename = URLDecoder.decode(filename);
				
				map.put("FILE_NAME", filename);
				map.put("FILE_PATH",  fileArr[i]);
				fileList.add(map);	
			}
			
		}
		model.put("fileLIst", fileList);
		
		
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getNoticesDataIdCheck(String notices_dataId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userNoticesDataMapper.getListAll();
		
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
	public ModelMap getList(UserNoticesDataVo userNoticesDataVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userNoticesDataMapper.getList(userNoticesDataVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = userNoticesDataMapper.getListCnt(userNoticesDataVo);
		
		int itemCount = userNoticesDataVo.getITEM_COUNT();
		int itempage = userNoticesDataVo.getPAGE();

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

	@Override
	public ModelMap getBest(String notices) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userNoticesDataMapper.getBest(notices);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public List<UserNoticesDataVo> getHeaderPrList(UserNoticesDataVo userNoticesDataVo) {
		
		List<UserNoticesDataVo> list = userNoticesDataMapper.getHeaderListPr(userNoticesDataVo);
		System.out.println("------------------size : " + list.size());
		
		return list;
	}

	@Override
	public void setUpdateFile(UserNoticesDataVo userNoticesDataVo) {
		// TODO Auto-generated method stub
		userNoticesDataMapper.setUpdateFile(userNoticesDataVo);
		
	}

		
}
