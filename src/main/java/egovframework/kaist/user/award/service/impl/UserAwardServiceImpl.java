package egovframework.kaist.user.award.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.kaist.user.award.model.UserAwardRequireVo;
import egovframework.kaist.user.award.model.UserAwardVo;
import egovframework.kaist.user.award.service.UserAwardService;

@Service("userAwardService")
@Transactional
public class UserAwardServiceImpl implements UserAwardService {

	@Resource(name="userAwardMapper")
	UserAwardMapper userAwardMapper;

	@Override
	public ModelMap getAllList(UserAwardVo userAwardVo) {
		ModelMap modelMap = new ModelMap();
		
		List<?> list = userAwardMapper.getAwardAllList(userAwardVo);
		
		System.out.println("size : " + list.size());
		
		int itemtotalcount = userAwardMapper.getAwardAllListCnt(userAwardVo);
		int itemCount = userAwardVo.getITEM_COUNT();
		int itempage = userAwardVo.getPAGE();
		
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
	public ModelMap getAwardDataView(UserAwardVo userAwardVo) {
		
		ModelMap model = new ModelMap();
		
		UserAwardVo view = userAwardMapper.getAwardViewData(userAwardVo);
		
		model.put("view", view);
		
		return model;
	}

	@Override
	public List<?> getRequireAllList(UserAwardRequireVo userAwardRequireVo) {
		
		List<?> require = userAwardMapper.getAwardRequireList(userAwardRequireVo);
		
		return require;
	}
	
}
