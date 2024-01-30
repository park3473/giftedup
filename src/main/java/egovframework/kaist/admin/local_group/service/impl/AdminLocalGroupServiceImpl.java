package egovframework.kaist.admin.local_group.service.impl;
 

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

import egovframework.kaist.admin.local_group.model.AdminLocalGroupVo;
import egovframework.kaist.admin.local_group.service.AdminLocalGroupService;
import egovframework.kaist.admin.local_group_member.service.impl.AdminLocalGroupMemberMapper;
import egovframework.kaist.admin.member.model.AdminMemberVo;
import egovframework.kaist.admin.member.service.impl.AdminMemberMapper;

@Service("adminLocalGroupService")
@Transactional
public class AdminLocalGroupServiceImpl implements AdminLocalGroupService {
	
	@Resource(name = "adminLocalGroupMapper")
	private AdminLocalGroupMapper adminLocalGroupMapper;

	@Resource(name = "adminLocalGroupMemberMapper")
	private AdminLocalGroupMemberMapper adminLocalGroupMemberMapper;
	
	
	@Resource(name = "adminMemberMapper")
	private AdminMemberMapper adminMemberMapper;
	
	
	
	protected Log log = LogFactory.getLog(AdminLocalGroupServiceImpl.class);
	
	
	
 
	@Override
	public int setInsert(AdminLocalGroupVo domain) {
		return adminLocalGroupMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(AdminLocalGroupVo domain) {
		return adminLocalGroupMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(AdminLocalGroupVo domain) {
		return adminLocalGroupMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminLocalGroupMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		AdminLocalGroupVo vo = adminLocalGroupMapper.getView(idx);
		
		if(vo == null)
		{
			vo = new AdminLocalGroupVo();
		}
		
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getlocalGroupIdCheck(String local_groupId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminLocalGroupMapper.getListAll();
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map   = (HashMap) list.get(i);
			System.out.println("local_groupId : " + local_groupId);
			System.out.println("map.get(\"MEMBER_ID\") : " + map.get("MEMBER_ID"));
			if(map.get("MEMBER_ID").equals(local_groupId))
			{
				return true;
			}
		}
		return false;
		
	}


	@Override
	public ModelMap getList(AdminLocalGroupVo adminlocalGroupVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminLocalGroupMapper.getList(adminlocalGroupVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = adminLocalGroupMapper.getListCnt(adminlocalGroupVo);
		
		int itemCount = adminlocalGroupVo.getITEM_COUNT();
		int itempage = adminlocalGroupVo.getPAGE();

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
	public ModelMap getListGroupMemberId() {
		ModelMap modelMap = new ModelMap();
		
		AdminMemberVo adminMemberVo = new AdminMemberVo();
		adminMemberVo.setLIMIT(999999);
		adminMemberVo.setTYPE("2");
		
		List<HashMap> RtnList = new ArrayList<HashMap>();
		
		
		//교수자를 가져온다.
		List<?> list = adminMemberMapper.getList(adminMemberVo);
		
		//그룹장 리스트를 가져온다.
		//List<?> list2 = adminLocalGroupMapper.getListAll();
		
		//그룹 소속을 가져온다.
		List<?> list3 = adminLocalGroupMemberMapper.getListAll();
		
		
		List<String> list4 = new ArrayList<String>();
		/*for(int i = 0; i < list2.size(); i++)
		{
			HashMap vo = (HashMap) list2.get(i);
			String temp = (String) vo.get("MEMBER_ID");
			list4.add(temp);
		}*/
		
		for(int i = 0; i < list3.size(); i++)
		{
			HashMap vo = (HashMap) list3.get(i);
			String temp = (String) vo.get("MEMBER_ID");
			list4.add(temp);
		}
		
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap temp1 = (HashMap) list.get(i);
			String memberid = (String) temp1.get("MEMBER_ID");
			boolean check = true;
			for(int j = 0; j < list4.size(); j++ )
			{
				if(memberid.equals(list4.get(j)))
				{
					check = false;
					break;
				}
			}
			if(check == true)
			{
				
				RtnList.add(temp1);
			}
		}
		
		
		modelMap.addAttribute("list", RtnList);
		System.out.println("------------------size : " + RtnList.size());
		return modelMap;
		
		
	}

	@Override
	public boolean setDeleteGroupIdx(AdminLocalGroupVo adminlocalGroupVo) {
		// TODO Auto-generated method stub
		return adminLocalGroupMemberMapper.setDeleteGroupIdx(adminlocalGroupVo);
	}

		
}
