package egovframework.kaist.admin.email_send.service.impl;
 

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.AES256Cipher;

import egovframework.kaist.admin.email.model.AdminEmailVo;
import egovframework.kaist.admin.email.service.impl.AdminEmailMapper;
import egovframework.kaist.admin.email_send.model.AdminEmailSendVo;
import egovframework.kaist.admin.email_send.service.AdminEmailSendService;

@Service("adminEmailSendService")
@Transactional
public class AdminEmailSendServiceImpl implements AdminEmailSendService {
	
	@Resource(name = "adminEmailSendMapper")
	private AdminEmailSendMapper adminEmailSendMapper;
	
	@Resource(name = "adminEmailMapper")
	private AdminEmailMapper adminEmailMapper;
	
	protected Log log = LogFactory.getLog(AdminEmailSendServiceImpl.class);
	 
	@Override
	public int setInsert(AdminEmailSendVo domain) {
		return adminEmailSendMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(AdminEmailSendVo domain) {
		return adminEmailSendMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(AdminEmailSendVo domain) {
		return adminEmailSendMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminEmailSendMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		AdminEmailSendVo vo = adminEmailSendMapper.getView(idx);
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean testEmailSend(String sendEmail, String toEmail, String Subject, String Content)
	{
		ModelMap model = new ModelMap();
		AdminEmailVo vo = adminEmailMapper.getView("");

		if (log.isDebugEnabled()) {
			log.debug("------------------------------------------EmailSend---------------------------");
		}

		String PROTOCOL = vo.getPROTOCOL()+"";
		String HOST = vo.getHOST() + "";
		String PORT = vo.getPORT() + "";
		String FORMUSER = vo.getFORMUSER() + "";
		String AUTH = vo.getAUTH() + "";
		String ID = vo.getID() + "";
		String PW = vo.getPW() + "";
		log.debug(" 1PW :  " + PW);
		
		
		AES256Cipher aesChipher = new AES256Cipher();
		try {
			PW = aesChipher.AES_Decode(PW);
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
		
		log.debug(" PROTOCOL :  " + PROTOCOL);
		log.debug(" HOST :  " + HOST);
		log.debug(" PORT :  " + PORT);
		log.debug(" FORMUSER :  " + FORMUSER);
		log.debug(" AUTH :  " + AUTH);
		log.debug(" ID :  " + ID);
		log.debug(" PW :  " + PW);
		log.debug(" title :  " + Subject);
		log.debug(" content :  " + Content);
		log.debug(" toMail :  " +toEmail);
		log.debug(" fromMail :  " +sendEmail);

		int rtn = 1;

		try {
			String filename = "";
			String content = Content;
			String subject = Subject;
			
			//Properties props = new Properties();
			Properties props = System.getProperties();

			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", PROTOCOL);
			props.put("mail.smtp.host", HOST);
			// props.put ("mail.smtp.localhost", "127.0.0.1");
			props.put("mail.smtp.port", PORT);
			props.put("mail.smtp.user", FORMUSER);
			props.put("mail.smtp.auth", AUTH);

			MyAuthenticator auth2 = new MyAuthenticator(ID, PW);// "nks@bluwise.co.kr",
																// "qmffndhkdlwm"
			Session mailSession = Session.getDefaultInstance(props, auth2);

			MimeMessage message = new MimeMessage(mailSession);
			boolean parseStrict = false;
			InternetAddress address = InternetAddress.parse(vo.getTOEMAIL(), parseStrict)[0];
			address.setPersonal(sendEmail, "euc-kr");

			message.setFrom(address);
			
			
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(toEmail, parseStrict));

			message.setSubject(subject);
			message.setHeader("X-Mailer", "sendMessage");
			message.setSentDate(new Date());

			MimeBodyPart attachPart = new MimeBodyPart();
	

			MimeBodyPart bodypart = new MimeBodyPart();
			
			String html = "<html>";
			
			html += content;
			
			
			html += "</html>";
					
					
			bodypart.setContent(content, "text/html;charset=euc-kr");

			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(bodypart);
			

			message.setContent(multipart);
			Transport.send(message);

			System.out.println("메일을 보냈습니다.");

		

		} catch (MessagingException ex) {
			System.out.println("mail send error : " + ex.getMessage());
		
			ex.printStackTrace();
			rtn = -1;
		} catch (Exception e) {
			System.out.println("error : " + e.getMessage());
		
			e.printStackTrace();
			rtn = -2;
		}
		
		if(rtn == 1)
		{
			return true;
		}else
		{
			return false;
		}
	}


	class MyAuthenticator extends Authenticator {
		private String id;
		private String pw;
	
		public MyAuthenticator(String id, String pw) {
			this.id = id;
			this.pw = pw;
		}
	
		protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
			return new javax.mail.PasswordAuthentication(id, pw);
		}
	}

	@Override
	public boolean setUpdateApply(AdminEmailSendVo domain) {
		return adminEmailSendMapper.setUpdateApply(domain);
	}

	@Override
	public boolean setUpdateApplyFail(AdminEmailSendVo domain) {
		return adminEmailSendMapper.setUpdateApplyFail(domain);
	}

	@Override
	public ModelMap getListApplyAll(String string) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminEmailSendMapper.getListApplyAll(string);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public void setCronSend() {
		
		ModelMap modelMap = getListApplyAll("0");
		
		List<?> list = (List<?>) modelMap.get("list");
		
		for(int i = 0; i < list.size(); i++)
		{
			HashMap map = (HashMap)list.get(i);
			
			String IDX = (String) map.get("IDX").toString();
			String TITLE = (String) map.get("TITLE").toString();
			String CONTENT = (String) map.get("CONTENT").toString();
			String TOMAIL = (String) map.get("TOMAIL").toString();
			String APPLY = (String) map.get("APPLY").toString();
			String CREATE_TM = (String) map.get("CREATE_TM").toString();
			String UPDATE_TM = (String) map.get("UPDATE_TM").toString();
			String RECOUNT = (String) map.get("RECOUNT").toString();
			String FROM_MAIL = (String) map.get("FROM_MAIL").toString();
			
			AdminEmailSendVo adminEmailSendVo = new AdminEmailSendVo();
			adminEmailSendVo.setIDX(IDX);
			boolean rtn = testEmailSend(FROM_MAIL, TOMAIL, TITLE, CONTENT);
			if(rtn == false)
			{
				setUpdateApplyFail(adminEmailSendVo);
			}else
			{
				adminEmailSendVo.setAPPLY("1");
				setUpdateApply(adminEmailSendVo);
				
			}
			
		}
		
		modelMap.addAttribute("list", list);
	}

	@Override
	public ModelMap getList(AdminEmailSendVo adminEmailSendVo) {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminEmailSendMapper.getList(adminEmailSendVo);
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}
	

}
