package egovframework.kaist.admin.communicator.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;

import egovframework.kaist.admin.communicator.model.AdminCommunicatorVo;
import egovframework.kaist.admin.communicator.service.AdminCommunicatorService;


@Service("adminCommunicatorService")
@Transactional
public class AdminCommunicatorServiceImpl implements AdminCommunicatorService {

	@Resource(name = "adminCommunicatorMapper")
	private AdminCommunicatorMapper adminCommunicatorMapper;

	@Override
	public ModelMap getCommAllList(AdminCommunicatorVo adminCommunicatorVo) {
		ModelMap model = new ModelMap();
		
		List<?> list = adminCommunicatorMapper.getCommAllList(adminCommunicatorVo);
		
		model.put("list", list);
		
		System.out.println("list_size : " + list.size());
		
		int itemtotalcount = adminCommunicatorMapper.getCommAllListCnt(adminCommunicatorVo);
		
		int itemcount = adminCommunicatorVo.getITEM_COUNT();
		int itempage = adminCommunicatorVo.getPAGE();
		
		PageVO pageVo = new PageVO(itemcount , itemtotalcount,itempage);
		
		if(pageVo.isItempagenext() == true) {
			model.put("itempagenext", "true");
		}else {
			model.put("itempagenext", "false");
		}
		System.out.println("===page=="+pageVo.getItempage());
		model.put("page", pageVo.getItempage());
		model.put("itemcount", pageVo.getItemCount());
		model.put("itempagestart", pageVo.getItempagestart());
		model.put("itempageend", pageVo.getItempageend());
		model.put("itemtotalcount", pageVo.getItemtotalcount());
		model.put("itemtotalpage", pageVo.getItemtotalpage());
		
		return model;
	}

	@Override
	public ModelMap getCommView(AdminCommunicatorVo adminCommunicatorVo) {
		
		ModelMap model = new ModelMap();
		
		AdminCommunicatorVo View = adminCommunicatorMapper.getCommView(adminCommunicatorVo);
		
		List<?> StudentList = adminCommunicatorMapper.getStudentList(adminCommunicatorVo);
		
		List<?> SuppliesList = adminCommunicatorMapper.getSuppliesList(adminCommunicatorVo);
		
		model.put("SuppliesList", SuppliesList);
		model.put("View", View);
		model.put("StudentList", StudentList);
		return model;
	}

	@Override
	public ModelMap getCommExcelAllList(AdminCommunicatorVo adminCommunicatorVo) {
		// TODO Auto-generated method stub
		
		ModelMap map = new ModelMap();
		
		List<?> CommList = adminCommunicatorMapper.getCommExcelAll(adminCommunicatorVo);
		
		map.put("CommList", CommList);
		
		return map;
	}

	@Override
	public ModelMap getCommExcelSelectList(AdminCommunicatorVo adminCommunicatorVo) {
		// TODO Auto-generated method stub
		
		ModelMap map = new ModelMap();
		
		System.out.println("===1===");
		
		List<?> CommList = adminCommunicatorMapper.getCommExcelSelect(adminCommunicatorVo);
		
		System.out.println("====2===");
		List<?> StudentList = adminCommunicatorMapper.getStudentExcelSelect(adminCommunicatorVo);
	
		
		map.put("CommList", CommList);
		
		map.put("StudentList", StudentList);
		
		return map;
	}
	
}
