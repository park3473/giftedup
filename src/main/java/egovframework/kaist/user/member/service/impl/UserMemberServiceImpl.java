package egovframework.kaist.user.member.service.impl;
 

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.PageVO;
import com.system.util.SUtil;

import egovframework.kaist.user.member.model.UserMemberVo;
import egovframework.kaist.user.member.service.UserMemberService;
import egovframework.kaist.user.program_apply.model.UserProgramApplyVo;

@Service("userMemberService")
@Transactional
public class UserMemberServiceImpl implements UserMemberService {

	
	@Resource(name = "userMemberMapper")
	private UserMemberMapper userMemberMapper;
	
	protected Log log = LogFactory.getLog(UserMemberServiceImpl.class);
	
 
	@Override
	public int setInsert(UserMemberVo domain) {
		return userMemberMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(UserMemberVo domain) {
		return userMemberMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(UserMemberVo domain) {
		return userMemberMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = userMemberMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {

		ModelMap model = new ModelMap();
		UserMemberVo vo = userMemberMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getMemberIdCheck(String memberId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userMemberMapper.getListAll();
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map   = (HashMap) list.get(i);
			System.out.println("memberId : " + memberId);
			System.out.println("map.get(\"MEMBER_ID\") : " + map.get("MEMBER_ID"));
			if(map.get("MEMBER_ID").equals(memberId))
			{
				return true;
			}
		}
		return false;
		
	}


	@Override
	public ModelMap getList(UserMemberVo userMemberVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userMemberMapper.getList(userMemberVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = userMemberMapper.getListCnt(userMemberVo);
		
		int itemCount = userMemberVo.getITEM_COUNT();
		int itempage = userMemberVo.getPAGE();

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
	public ModelMap getAdviserALL() {
		ModelMap modelMap = new ModelMap();
		List<?> list = userMemberMapper.getAdviserALL();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}



	@Override
	public boolean setUpdateTypeToText(UserMemberVo userMemberDomain) {
		return userMemberMapper.setUpdateTypeToText(userMemberDomain);
	}

	@Override
	public ModelMap getListGroupBySchoolName() {
		ModelMap modelMap = new ModelMap();
		List<?> list = userMemberMapper.getListGroupBySchoolName();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(UserMemberVo userMemberDomain) {
		ModelMap model = new ModelMap();
		System.out.println("DSADSA");
		
		UserMemberVo vo = userMemberMapper.getView2(userMemberDomain);
		
		System.out.println("??");
		
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public ModelMap getProfessorList(UserMemberVo userMemberVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userMemberMapper.getProfessorList(userMemberVo);
		modelMap.addAttribute("list", list);		
		
		int itemtotalcount = userMemberMapper.getProfessorListCnt(userMemberVo);
		
		int itemCount = userMemberVo.getITEM_COUNT();
		int itempage = userMemberVo.getPAGE();

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
	public int getMemberTypeCnt(String string) {
		// TODO Auto-generated method stub
		return userMemberMapper.getMemberTypeCnt(string);
	}

	@Override
	public int getMemberSchoolCnt() {
		// TODO Auto-generated method stub
		return userMemberMapper.getMemberSchoolCnt();
	}

	@Override
	public void setUpdateLoginTm(String member_ID) {
		userMemberMapper.setUpdateLoginTm(member_ID);
	}

	@Override
	public ModelMap getMatchingList(UserProgramApplyVo userProgramApplyDomain) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userMemberMapper.getMatchingList(userProgramApplyDomain);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public String getID(UserMemberVo userMemberVo) {
		// TODO Auto-generated method stub
		
		String search_id = userMemberMapper.getID(userMemberVo);
		
		return search_id;
	}

	@Override
	public ModelMap getPortfolioUserView(UserMemberVo usermembervo) {
		ModelMap model = new ModelMap();
		UserMemberVo vo = userMemberMapper.getPortfolioUserView(usermembervo);
		model.put("pageDomain", vo);
		System.out.println("ddd");
		return model;
	}

	@Override
	public ModelMap getPortfolioYearView(UserMemberVo userMemberVo) {
		ModelMap model = new ModelMap();
		UserMemberVo vo = userMemberMapper.getPortfolioYearView(userMemberVo);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public void PassWordReSet(UserMemberVo userMemberVo) {
		// TODO Auto-generated method stub
	
		userMemberMapper.setPassWordReset(userMemberVo);
		
	}
	
	

		
}
