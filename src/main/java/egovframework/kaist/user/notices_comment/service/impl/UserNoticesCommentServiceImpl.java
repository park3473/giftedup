package egovframework.kaist.user.notices_comment.service.impl;
 

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

import egovframework.kaist.user.notices_comment.model.UserNoticesCommentVo;
import egovframework.kaist.user.notices_comment.service.UserNoticesCommentService;

@Service("userNoticesCommentService")
@Transactional
public class UserNoticesCommentServiceImpl implements UserNoticesCommentService {

	
	@Resource(name = "userNoticesCommentMapper")
	private UserNoticesCommentMapper userNoticesCommentMapper;
	
	protected Log log = LogFactory.getLog(UserNoticesCommentServiceImpl.class);
	
 
	@Override
	public int setInsert(UserNoticesCommentVo domain) {
		return userNoticesCommentMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(UserNoticesCommentVo domain) {
		return userNoticesCommentMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(UserNoticesCommentVo domain) {
		return userNoticesCommentMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = userNoticesCommentMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		
		UserNoticesCommentVo vo = userNoticesCommentMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getNoticesCommentIdCheck(String notices_commentId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userNoticesCommentMapper.getListAll();
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map   = (HashMap) list.get(i);
			System.out.println("notices_commentId : " + notices_commentId);
			System.out.println("map.get(\"MEMBER_ID\") : " + map.get("MEMBER_ID"));
			if(map.get("MEMBER_ID").equals(notices_commentId))
			{
				return true;
			}
		}
		return false;
		
	}


	@Override
	public ModelMap getList(UserNoticesCommentVo userNoticesCommentVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = userNoticesCommentMapper.getList(userNoticesCommentVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		
		
		int itemtotalcount = userNoticesCommentMapper.getListCnt(userNoticesCommentVo);
		
		int itemCount = userNoticesCommentVo.getITEM_COUNT();
		int itempage = userNoticesCommentVo.getPAGE();

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
	public ModelMap getRank(String noticesIdx) {

		ModelMap modelMap = new ModelMap();
		
		List<?> BeforeRank = userNoticesCommentMapper.getBeforeMonthRank(noticesIdx);
		List<?> nowRank = userNoticesCommentMapper.getMonthRank(noticesIdx);
		
		List<HashMap> rtnHashList = new ArrayList<HashMap>();
		for(int i = 0; i < nowRank.size(); i++)
		{
			HashMap map = (HashMap) nowRank.get(i);
			String MemberId = (String) map.get("MEMBER_ID");
			
			int j = 0;
			for(j = 0 ; j < BeforeRank.size(); j++)
			{
				HashMap map2 = (HashMap) BeforeRank.get(j);
				String MemberId2 = (String) map2.get("MEMBER_ID");
				if(MemberId.equals(MemberId2))
				{
					break;
				}
			}
			
			map.put("RANK_TYPE", j-i);
			rtnHashList.add(map);
		}
		
		for(int i = 0; i < rtnHashList.size(); i++)
		{
			HashMap map = (HashMap) rtnHashList.get(i);
			String MemberId = (String) map.get("MEMBER_ID");
			String RANK_TYPE =  map.get("RANK_TYPE")+"";
			System.out.print(MemberId);
			System.out.print("  ");
			System.out.println(RANK_TYPE);
		}
		
		
		modelMap.put("list", rtnHashList);
		return modelMap;
	}

		
}
