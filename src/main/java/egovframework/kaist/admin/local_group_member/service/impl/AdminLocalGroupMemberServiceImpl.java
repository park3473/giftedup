package egovframework.kaist.admin.local_group_member.service.impl;
 

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
import egovframework.kaist.admin.local_group.service.impl.AdminLocalGroupMapper;
import egovframework.kaist.admin.local_group_member.model.AdminLocalGroupMemberVo;
import egovframework.kaist.admin.local_group_member.service.AdminLocalGroupMemberService;
import egovframework.kaist.admin.member.model.AdminMemberVo;
import egovframework.kaist.admin.member.service.impl.AdminMemberMapper;

@Service("adminLocalGroupMemberService")
@Transactional
public class AdminLocalGroupMemberServiceImpl implements AdminLocalGroupMemberService {

	
	@Resource(name = "adminLocalGroupMemberMapper")
	private AdminLocalGroupMemberMapper adminLocalGroupMemberMapper;
	
	@Resource(name = "adminMemberMapper")
	private AdminMemberMapper adminMemberMapper;
	
	@Resource(name = "adminLocalGroupMapper")
	private AdminLocalGroupMapper adminLocalGroupMapper;
	
	
	
	protected Log log = LogFactory.getLog(AdminLocalGroupMemberServiceImpl.class);
	
 
	@Override
	public int setInsert(AdminLocalGroupMemberVo domain) {
		return adminLocalGroupMemberMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(AdminLocalGroupMemberVo domain) {
		return adminLocalGroupMemberMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(AdminLocalGroupMemberVo domain) {
		return adminLocalGroupMemberMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminLocalGroupMemberMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		AdminLocalGroupMemberVo vo = adminLocalGroupMemberMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getLocalGroupMemberIdCheck(String local_group_memberId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminLocalGroupMemberMapper.getListAll();
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map   = (HashMap) list.get(i);
			System.out.println("local_group_memberId : " + local_group_memberId);
			System.out.println("map.get(\"MEMBER_ID\") : " + map.get("MEMBER_ID"));
			if(map.get("MEMBER_ID").equals(local_group_memberId))
			{
				return true;
			}
		}
		return false;
		
	}


	@Override
	public ModelMap getList(AdminLocalGroupMemberVo adminLocalGroupMemberVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminLocalGroupMemberMapper.getList(adminLocalGroupMemberVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		/*List<HashMap> rtnList = new ArrayList(); 
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap tempMap = (HashMap) list.get(i);
			String MemberId = (String) tempMap.get("MEMBER_ID");
			//String PORTFOLIO_CNT = "";
			int PORTFOLIO_CNT = adminLocalGroupMemberMapper.getPortfolioCnt(MemberId);
			tempMap.put("PORTFOLIO_CNT",PORTFOLIO_CNT+"" );
			rtnList.add(tempMap);
		}*/
		
		
		
		int itemtotalcount = adminLocalGroupMemberMapper.getListCnt(adminLocalGroupMemberVo);
		
		int itemCount = adminLocalGroupMemberVo.getITEM_COUNT();
		int itempage = adminLocalGroupMemberVo.getPAGE();

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
	public ModelMap getListNotGroupMemberId(AdminLocalGroupVo pageDomain) {
		
		ModelMap modelMap = new ModelMap();
		
		AdminMemberVo adminMemberVo = new AdminMemberVo();
		adminMemberVo.setLIMIT(999999);
		adminMemberVo.setTYPE("2");
		
		List<HashMap> RtnList = new ArrayList<HashMap>();
		
		
		//교수자를 가져온다.
		List<?> list = adminMemberMapper.getList(adminMemberVo);
		
		//그룹장 리스트를 가져온다.
		List<?> list2 = adminLocalGroupMapper.getListAll();
		
		//그룹 소속을 가져온다.
		List<?> list3 = adminLocalGroupMemberMapper.getListAll();
		
		
		List<String> list4 = new ArrayList<String>();
		
		//현재 그룹장 만들려고 하는 아이디
		list4.add(pageDomain.getMEMBER_ID());
		/*for(int i = 0; i < list2.size(); i++)
		{
			HashMap vo = (HashMap) list2.get(i);
			String temp = (String) vo.get("MEMBER_ID");
			list4.add(temp);
		}*/
		
		for(int i = 0; i < list3.size(); i++)
		{
			HashMap vo = (HashMap) list3.get(i);
			
			String ADDRESS_LOCAL = (String) vo.get("ADDRESS_LOCAL");
			
			String memberId = (String) vo.get("MEMBER_ID");
			list4.add(memberId);
		}
		
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap temp1 = (HashMap) list.get(i);
			String memberid = (String) temp1.get("MEMBER_ID");
			
			String ADDRESS_LOCAL = (String) temp1.get("ADDRESS_LOCAL");
			
			
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
				String location = pageDomain.getLOCATION();
				
				if(location.equals(ADDRESS_LOCAL))
				{
					RtnList.add(temp1);	
				}
				
			}
		}
		
		
		modelMap.addAttribute("list", RtnList);
		System.out.println("------------------size : " + RtnList.size());
		return modelMap;
		
	
	
	}

		
}
