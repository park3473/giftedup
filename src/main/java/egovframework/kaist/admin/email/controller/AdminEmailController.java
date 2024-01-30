package egovframework.kaist.admin.email.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.system.util.AES256Cipher;
import com.system.util.SUtil;

import egovframework.kaist.admin.email.model.AdminEmailVo;
import egovframework.kaist.admin.email.service.AdminEmailService;

@Controller
public class AdminEmailController {

	@Autowired
	AdminEmailService adminEmailService;
	
	protected Log log = LogFactory.getLog(AdminEmailController.class);
	
	@RequestMapping(value = "/admin/email/list.do", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		model = adminEmailService.getView("");
		
		return new ModelAndView("admin/email/list", "model", model);
	}

	@RequestMapping(value = "/admin/email/insert.do", method = RequestMethod.GET)
	public ModelAndView insertGet(HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		
		return new ModelAndView("admin/email/insert","model", model);
	}
	
	@RequestMapping(value = "/admin/email/insert.do", method = RequestMethod.POST)
	public void insertPost(@ModelAttribute("AdminEmailVo") AdminEmailVo adminEmailVo,
			HttpServletRequest request,
			HttpServletResponse response) 
	{
		
		ModelMap model = new ModelMap();
		
		if(!adminEmailVo.getPW().equals(""))
		{
			AES256Cipher aesChipher = new AES256Cipher();
			String rst = "";
			try {
				rst = aesChipher.AES_Encode(adminEmailVo.getPW());
				
				adminEmailVo.setPW(rst);
				
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
		}
		int rtn = adminEmailService.setInsert(adminEmailVo);
		
		if(rtn > 0 )
		{
			try {
				
				response.getWriter().println("true");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else
		{
			try {
				
				response.getWriter().println("false");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	
		
	}
	
	@RequestMapping(value = "/admin/email/{emailid}/update.do", method = RequestMethod.GET)
	public ModelAndView updateGet(@PathVariable("emailid") String emailid, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		
		model = adminEmailService.getView(emailid);
		
		
		return new ModelAndView("admin/email/update","model", model);
	}
	
	@RequestMapping(value = "/admin/email/update.do", method = RequestMethod.POST)
	public void updatePost(@ModelAttribute("AdminEmailVo") AdminEmailVo adminEmailVo, HttpServletRequest request,  HttpServletResponse response)  {
		
		
		ModelMap model = new ModelMap();

		if(!adminEmailVo.getPW().equals(""))
		{
			
			AES256Cipher aesChipher = new AES256Cipher();
			String rst = "";
			try {
				rst = aesChipher.AES_Encode(adminEmailVo.getPW());
				
				adminEmailVo.setPW(rst);
				
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
			
		}
		
		boolean rtn = adminEmailService.setUpdate(adminEmailVo);
		
		if(rtn)
		{
			try {
				response.getWriter().println("true");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else
		{
			try {
				response.getWriter().println("false");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	@RequestMapping(value = "/admin/email/delete.do", method = RequestMethod.POST)
	public void deletePost(@ModelAttribute("AdminEmailVo") AdminEmailVo adminEmailVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		boolean rtn = adminEmailService.setDelete(adminEmailVo);
		if(rtn)
		{
			try {
				response.getWriter().println("true");
			} catch (IOException e) {
				e.printStackTrace();
			}	
		}else
		{

			try {
				response.getWriter().println("false");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping(value = "/admin/email/testEmailSend.do", method = RequestMethod.GET)
	public void testEmailSend(@ModelAttribute("AdminEmailVo") AdminEmailVo adminEmailVo, HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelMap model = new ModelMap();

		boolean rtn = adminEmailService.testEmailSend();
		if(rtn)
		{
			try {
				response.getWriter().println("true");
			} catch (IOException e) {
				e.printStackTrace();
			}	
		}else
		{

			try {
				response.getWriter().println("false");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	
}
