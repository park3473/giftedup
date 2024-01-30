package egovframework.kaist.admin.activity_allowance.service.impl;
 

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.AES256Cipher;
import com.system.util.PageVO;

import egovframework.kaist.admin.activity_allowance.model.AdminActivityAllowanceVo;
import egovframework.kaist.admin.activity_allowance.service.AdminActivityAllowanceService;

@Service("adminActivityAllowanceService")
@Transactional
public class AdminActivityAllowanceServiceImpl implements AdminActivityAllowanceService {

	
	@Resource(name = "adminActivityAllowanceMapper")
	private AdminActivityAllowanceMapper adminActivityAllowanceMapper;
	
	protected Log log = LogFactory.getLog(AdminActivityAllowanceServiceImpl.class);
	
 
	@Override
	public int setInsert(AdminActivityAllowanceVo domain) {
		return adminActivityAllowanceMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(AdminActivityAllowanceVo domain) {
		return adminActivityAllowanceMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(AdminActivityAllowanceVo domain) {
		return adminActivityAllowanceMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminActivityAllowanceMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		AdminActivityAllowanceVo vo = adminActivityAllowanceMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean getActivityAllowanceIdCheck(String activity_allowanceId) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminActivityAllowanceMapper.getListAll();
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map   = (HashMap) list.get(i);
			System.out.println("activity_allowanceId : " + activity_allowanceId);
			System.out.println("map.get(\"MEMBER_ID\") : " + map.get("MEMBER_ID"));
			if(map.get("MEMBER_ID").equals(activity_allowanceId))
			{
				return true;
			}
		}
		return false;
		
	}


	@Override
	public ModelMap getList(AdminActivityAllowanceVo adminActivityAllowanceVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminActivityAllowanceMapper.getList(adminActivityAllowanceVo);
		
		System.out.println("------------------size : " + list.size());
		
		List<HashMap> rtnlist = new ArrayList<HashMap>();
		
		AES256Cipher aesChipher = new AES256Cipher();
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map =  (HashMap) list.get(i);
			String  MEMBER_NUMBER =  map.get("MEMBER_NUMBER")+"";
			String  BANK_NUMBER =  map.get("BANK_NUMBER")+"";
			
			String rst = "";
	 		try {
	 			MEMBER_NUMBER = aesChipher.AES_Decode(MEMBER_NUMBER);
	 			
	 			
	 		} catch (InvalidKeyException e) {
	 			e.printStackTrace();
	 		} catch (UnsupportedEncodingException e) 
	 		{
	 			e.printStackTrace();
	 		} catch (NoSuchAlgorithmException e) 
	 		{
	 			e.printStackTrace();
	 		} catch (NoSuchPaddingException e) 
	 		{
	 			e.printStackTrace();
	 		} catch (InvalidAlgorithmParameterException e) 
	 		{
	 			e.printStackTrace();
	 		} catch (IllegalBlockSizeException e) 
	 		{
	 			e.printStackTrace();
	 		} catch (BadPaddingException e) 
	 		{
	 			e.printStackTrace();
	 		}
	 		
			try {
				BANK_NUMBER = aesChipher.AES_Decode(BANK_NUMBER);
				
	 		} catch (InvalidKeyException e) {
	 			e.printStackTrace();
	 		} catch (UnsupportedEncodingException e) 
	 		{
	 			e.printStackTrace();
	 		} catch (NoSuchAlgorithmException e) 
	 		{
	 			e.printStackTrace();
	 		} catch (NoSuchPaddingException e) 
	 		{
	 			e.printStackTrace();
	 		} catch (InvalidAlgorithmParameterException e) 
	 		{
	 			e.printStackTrace();
	 		} catch (IllegalBlockSizeException e) 
	 		{
	 			e.printStackTrace();
	 		} catch (BadPaddingException e) 
	 		{
	 			e.printStackTrace();
	 		}
			
			map.remove("MEMBER_NUMBER");
			map.remove("BANK_NUMBER");
			
			map.put("MEMBER_NUMBER", MEMBER_NUMBER);
			map.put("BANK_NUMBER", BANK_NUMBER);
			rtnlist.add(map);
			
		}
		modelMap.addAttribute("list", rtnlist);
		
		
		int itemtotalcount = adminActivityAllowanceMapper.getListCnt(adminActivityAllowanceVo);
		
		int itemCount = adminActivityAllowanceVo.getITEM_COUNT();
		int itempage = adminActivityAllowanceVo.getPAGE();

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
	public boolean setUpdateTypeToText(AdminActivityAllowanceVo vo) {
		return adminActivityAllowanceMapper.setUpdateTypeToText(vo);
	}

	@Override
	public ModelMap getListMemberIdIn(String mEMBER_ID) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminActivityAllowanceMapper.getListMemberIdIn(mEMBER_ID);
		List<HashMap> rtnlist = new ArrayList<HashMap>();
		AES256Cipher aesChipher = new AES256Cipher();
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map =  (HashMap) list.get(i);
			String  MEMBER_NUMBER =  map.get("MEMBER_NUMBER")+"";
			String  BANK_NUMBER =  map.get("BANK_NUMBER")+"";
			
			String rst = "";
	 		try {
	 			MEMBER_NUMBER = aesChipher.AES_Decode(MEMBER_NUMBER);
	 			
	 			
	 		} catch (InvalidKeyException e) {
	 			e.printStackTrace();
	 		} catch (UnsupportedEncodingException e) 
	 		{
	 			e.printStackTrace();
	 		} catch (NoSuchAlgorithmException e) 
	 		{
	 			e.printStackTrace();
	 		} catch (NoSuchPaddingException e) 
	 		{
	 			e.printStackTrace();
	 		} catch (InvalidAlgorithmParameterException e) 
	 		{
	 			e.printStackTrace();
	 		} catch (IllegalBlockSizeException e) 
	 		{
	 			e.printStackTrace();
	 		} catch (BadPaddingException e) 
	 		{
	 			e.printStackTrace();
	 		}
	 		
			try {
				BANK_NUMBER = aesChipher.AES_Decode(BANK_NUMBER);
				
	 		} catch (InvalidKeyException e) {
	 			e.printStackTrace();
	 		} catch (UnsupportedEncodingException e) 
	 		{
	 			e.printStackTrace();
	 		} catch (NoSuchAlgorithmException e) 
	 		{
	 			e.printStackTrace();
	 		} catch (NoSuchPaddingException e) 
	 		{
	 			e.printStackTrace();
	 		} catch (InvalidAlgorithmParameterException e) 
	 		{
	 			e.printStackTrace();
	 		} catch (IllegalBlockSizeException e) 
	 		{
	 			e.printStackTrace();
	 		} catch (BadPaddingException e) 
	 		{
	 			e.printStackTrace();
	 		}
			
			map.remove("MEMBER_NUMBER");
			map.remove("BANK_NUMBER");
			
			map.put("MEMBER_NUMBER", MEMBER_NUMBER);
			map.put("BANK_NUMBER", BANK_NUMBER);
			rtnlist.add(map);
			
		}
		modelMap.addAttribute("list", rtnlist);
		
		return modelMap;
	}

		
}
