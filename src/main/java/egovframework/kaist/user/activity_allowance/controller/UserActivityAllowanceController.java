package egovframework.kaist.user.activity_allowance.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.system.util.AES256Cipher;
import com.system.util.SUtil;

import egovframework.kaist.user.buseo.service.UserBuseoService;
import egovframework.kaist.user.member.model.UserMemberVo;
import egovframework.kaist.user.activity_allowance.model.UserActivityAllowanceVo;
import egovframework.kaist.user.activity_allowance.service.UserActivityAllowanceService;

@Controller
public class UserActivityAllowanceController {

	@Autowired
	UserActivityAllowanceService userActivityAllowanceService;


	private static final Logger Logger = LoggerFactory.getLogger(UserActivityAllowanceController.class);

	@RequestMapping(value = "/user/activity_allowance/list.do", method = RequestMethod.GET)
	public ModelAndView list(@ModelAttribute("UserActivityAllowanceVo") UserActivityAllowanceVo userActivityAllowanceVo,
			HttpServletRequest request, HttpServletResponse response) {

		String PAGE = request.getParameter("PAGE") != null ? request
				.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request
				.getParameter("ITEM_COUNT") : "10";
			
		if(PAGE == null)
		{
			PAGE = "0";
		}
		if(ITEM_COUNT == null)
		{
			ITEM_COUNT = "10";
		}
		

		userActivityAllowanceVo.setPAGE(Integer.parseInt(PAGE));
		userActivityAllowanceVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		
		ModelMap model = new ModelMap();
	
		int pagelimit = userActivityAllowanceVo.getPAGE() * userActivityAllowanceVo.getITEM_COUNT();
		
		userActivityAllowanceVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		userActivityAllowanceVo.setOFFSET(pagelimit);
		
	
    			
		
		model = userActivityAllowanceService.getList(userActivityAllowanceVo);
		
		model.put("SEARCH_TYPE", userActivityAllowanceVo.getSEARCH_TYPE());
		model.put("SEARCH_TEXT", userActivityAllowanceVo.getSEARCH_TEXT());
		
		if(userActivityAllowanceVo.getSTART_TM().equals(""))
		{
			userActivityAllowanceVo.setSTART_TM(SUtil.getNowDate());	
		}
		if(userActivityAllowanceVo.getEND_TM().equals(""))
		{
			userActivityAllowanceVo.setEND_TM(SUtil.getNowDate());	
		}
		
		model.put("beforeDomain", userActivityAllowanceVo);

		

		return new ModelAndView("user/activity_allowance/list", "model", model);
	}

	@RequestMapping(value = "/user/activity_allowance/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(HttpServletRequest request, HttpServletResponse response) 
	{

		ModelMap model = new ModelMap();
		
		String TYPE = (String) (request.getParameter("TYPE") != null ? request.getParameter("TYPE") : "1");
		
		if(TYPE == null || TYPE.equals(""))
		{
			TYPE = "1";
		}
		
		
		model.put("TYPE", TYPE);
		
		if(SUtil.getUserId(request) == "")
		{
			return new ModelAndView("redirect:../../user/member/login.do", "model", model);
		}else
		{
			return new ModelAndView("user/activity_allowance/insert", "model", model);	
		}
	}

	@RequestMapping(value = "/user/activity_allowance/insert.do", method = RequestMethod.POST)
	public void insertPost(@ModelAttribute("UserActivityAllowanceVo") UserActivityAllowanceVo userActivityAllowanceVo, 
			HttpServletRequest  request,  HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/activity/";
		 
	//	String filename = SUtil.setFileUpload(request, drv);
		
		
		//userActivityAllowanceVo.setFILES(filename);
		
	
		AES256Cipher aesChipher = new AES256Cipher();
		String rst = "";
		try {
			rst = aesChipher.AES_Encode(userActivityAllowanceVo.getBANK_NUMBER());
			userActivityAllowanceVo.setBANK_NUMBER(rst);
			
			rst = aesChipher.AES_Encode(userActivityAllowanceVo.getMEMBER_NUMBER());
			userActivityAllowanceVo.setMEMBER_NUMBER(rst);
			
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
		
		int rtn = userActivityAllowanceService.setInsert(userActivityAllowanceVo);		
		
		try {
			response.getWriter().print("true");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//return "redirect:./insert.do";
	}
	
	@RequestMapping(value = "/user/activity_allowance/{activity_allowanceid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("activity_allowanceid") String activity_allowanceid, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		
		model = userActivityAllowanceService.getView(activity_allowanceid);

		return new ModelAndView("user/activity_allowance/update", "model", model);
	}
	
	@RequestMapping(value = "/user/activity_allowance/update.do", method = RequestMethod.POST)
	public void updatePost(@ModelAttribute("UserActivityAllowanceVo") UserActivityAllowanceVo userActivityAllowanceVo, MultipartHttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();

		String drv = request.getRealPath("");
		drv = drv.substring(0, drv.length()) + "./resources"+((HttpServletRequest) request).getContextPath()+"/upload/activity/";
		 
		String filename = SUtil.setFileUpload(request, drv);
		
		boolean rtn = userActivityAllowanceService.setUpdate(userActivityAllowanceVo);

		if (rtn) {
			try {
				response.getWriter().println("true");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				response.getWriter().println("false");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	@RequestMapping(value = "/user/activity_allowance/delete.do", method = RequestMethod.POST)
	public void deletePost(@ModelAttribute("UserActivityAllowanceVo") UserActivityAllowanceVo userActivityAllowanceVo, HttpServletRequest request,
			HttpServletResponse response) {

		ModelMap model = new ModelMap();
		String year = request.getParameter("year") != null ? request.getParameter("year") : "";
		String month = request.getParameter("month") != null ? request.getParameter("month") : "";

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		boolean rtn = userActivityAllowanceService.setDelete(userActivityAllowanceVo);
		if (rtn) {
			try {
				response.getWriter().println("true");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {

			try {
				response.getWriter().println("false");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}


	@RequestMapping(value = "/user/activity_allowance/deleteArr.do", method = RequestMethod.POST)
	public void deleteArrPost(@ModelAttribute("UserMemberVo") UserActivityAllowanceVo userActivityAllowanceVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		String idx = userActivityAllowanceVo.getIDX();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				UserActivityAllowanceVo userMemberDomain = new UserActivityAllowanceVo();
				userMemberDomain.setIDX(arrIdx[i]);
				userActivityAllowanceService.setDelete(userMemberDomain);		
			}
		}
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	
	@RequestMapping(value = "/user/activity_allowance/TypeToTextUpdateArr.do", method = RequestMethod.POST)
	public void statusUpdateArr(@ModelAttribute("UserActivityAllowanceVo") UserActivityAllowanceVo userActivityAllowanceVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		String idx = userActivityAllowanceVo.getIDX();
		String [] arrIdx = idx.split(",");
		for(int i = 0; i < arrIdx.length; i++)
		{
			if(arrIdx[i].length()>0)
			{
				UserActivityAllowanceVo vo = new UserActivityAllowanceVo();
				vo.setIDX(arrIdx[i]);
				vo.setSEARCH_TYPE(userActivityAllowanceVo.getSEARCH_TYPE());
				vo.setSEARCH_TEXT(userActivityAllowanceVo.getSEARCH_TEXT());
				userActivityAllowanceService.setUpdateTypeToText(vo);		
			}
		}
		
		try {
			response.getWriter().println("true");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
}
