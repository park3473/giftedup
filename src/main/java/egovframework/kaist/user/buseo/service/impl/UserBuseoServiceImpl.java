package egovframework.kaist.user.buseo.service.impl;
 

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import egovframework.kaist.user.buseo.model.UserBuseoVo;
import egovframework.kaist.user.buseo.service.UserBuseoService;
import egovframework.kaist.user.member.service.impl.UserMemberMapper;

@Service("userBuseoService")
@Transactional
public class UserBuseoServiceImpl implements UserBuseoService {

	
	@Resource(name = "userBuseoMapper")
	private UserBuseoMapper userBuseoMapper;
	
	@Resource(name = "userMemberMapper")
	private UserMemberMapper userMemberMapper;
	
	
	protected Log log = LogFactory.getLog(UserBuseoServiceImpl.class);
	 
	@Override
	public int setInsert(UserBuseoVo domain) {
		return userBuseoMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(UserBuseoVo domain) {
		return userBuseoMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(UserBuseoVo domain) {
		return userBuseoMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = userBuseoMapper.getListAll();
		String json = "[{id:0, pID:0, name: \"ROOT\", open:true},";
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map = (HashMap) list.get(i);
			String IDX = (String) map.get("IDX").toString();
			String PARENT_IDX = (String) map.get("PARENT_IDX").toString();
			String NAME = (String) map.get("NAME").toString();
			 json += "{ id:"+IDX+", pId:"+PARENT_IDX+", name:\""+NAME+"\", open:true},";
		}
		
		json += "];";
		log.debug("json : " + json);
		modelMap.addAttribute("json", json);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}
	@Override
	public ModelMap getListBuseoMemberAll() {
		
		ModelMap modelMap = new ModelMap();
		List<?> list = userBuseoMapper.getListAll();
		
		List<?> list2 = userMemberMapper.getListAll();
		
		String json = "[{id:0, pID:0, name: \"ROOT\", open:true},";
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map = (HashMap) list.get(i);
			String IDX = (String) map.get("IDX").toString();
			String PARENT_IDX = (String) map.get("PARENT_IDX").toString();
			String NAME = (String) map.get("NAME").toString();
			 json += "{ id:"+IDX+", pId:"+PARENT_IDX+", name:\""+NAME+"\", open:true, isParent :true},";
			 
			 for(int j = 0; j < list2.size(); j++)
			 {
				 HashMap map2 = (HashMap) list2.get(j);
				 String BUSEO_IDX = (String) map2.get("BUSEO_IDX").toString();
				 String MEMBER_ID = (String) map2.get("MEMBER_ID").toString();
				 String MEMBER_NAME = (String) map2.get("NAME").toString();
				 String EMAIL_SEND_FLAG = (String) map2.get("EMAIL_SEND_FLAG").toString();
				 
				 if(BUSEO_IDX.equals(IDX))
				 {
					 if(EMAIL_SEND_FLAG.equals("1"))
					 {
						 json += "{ id:"+i+j+", pId:"+BUSEO_IDX+",memberId:\""+MEMBER_ID + "\", name:\""+MEMBER_NAME+"("+MEMBER_ID+")"+"\", open:true,checked:true,isParent:false},";
					 }else
					 {
						 json += "{ id:"+i+j+", pId:"+BUSEO_IDX+",memberId:\""+MEMBER_ID + "\", name:\""+MEMBER_NAME+"("+MEMBER_ID+")"+"\", open:true,isParent:false},";	 
					 }
				 }
			 }
		}
		json += "];";
		log.debug("json : " + json);
		modelMap.addAttribute("json", json);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}
	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		UserBuseoVo vo = userBuseoMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}
	public List<HashMap> getListAgentInfo(List<?> list3, String MemberId)
	{
		List<HashMap> rtnList = new ArrayList<HashMap>();
		
		for(int i = 0; i < list3.size(); i++)
		{
			HashMap map = (HashMap) list3.get(i);
			String MEMBER_ID = (String) map.get("MEMBER_ID").toString();
			//String AGENT_MAC = (String) map.get("AGENT_MAC").toString();
			//String PC_NAME = (String) map.get("PC_NAME").toString();
			//String AGENT_VERSION = (String) map.get("AGENT_VERSION").toString();
			if(MEMBER_ID.equals(MemberId))
			{
				rtnList.add(map);
			}
		}
		return rtnList;
	}
	

	@Override
	public void setInsertToUpdate(UserBuseoVo vo) {
		 userBuseoMapper.setInsertToUpdate(vo);
	}

	@Override
	public ModelMap getListBuseoMemberAgentAll() {
		// TODO Auto-generated method stub
		return null;
	}
}
