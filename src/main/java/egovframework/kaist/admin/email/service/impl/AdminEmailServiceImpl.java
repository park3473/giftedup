package egovframework.kaist.admin.email.service.impl;
 

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import com.system.util.AES256Cipher;
import com.system.util.SUtil;

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

import egovframework.kaist.admin.email.model.AdminEmailVo;
import egovframework.kaist.admin.email.service.AdminEmailService;

@Service("adminEmailService")
@Transactional
public class AdminEmailServiceImpl implements AdminEmailService {

	
	@Resource(name = "adminEmailMapper")
	private AdminEmailMapper adminEemailMapper;
	
	protected Log log = LogFactory.getLog(AdminEmailServiceImpl.class);
	 
	@Override
	public int setInsert(AdminEmailVo domain) {
		return adminEemailMapper.setInsert(domain);
	}

	@Override
	public boolean setUpdate(AdminEmailVo domain) {
		return adminEemailMapper.setUpdate(domain);
	}

	@Override
	public boolean setDelete(AdminEmailVo domain) {
		return adminEemailMapper.setDelete(domain);
	}

	@Override
	public ModelMap getListAll() {
		ModelMap modelMap = new ModelMap();
		List<?> list = adminEemailMapper.getListAll();
		modelMap.addAttribute("list", list);
		System.out.println("------------------size : " + list.size());
		return modelMap;
	}

	@Override
	public ModelMap getView(String idx) {
		ModelMap model = new ModelMap();
		AdminEmailVo vo = adminEemailMapper.getView(idx);
		
		AES256Cipher aesChipher = new AES256Cipher();
		String rst = "";
		try {
			rst = aesChipher.AES_Decode(vo.getPW());
			
			vo.setPW(rst);
			
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
		
		model.put("pageDomain", vo);
		return model;
	}

	@Override
	public boolean testEmailSend() {
		ModelMap model = new ModelMap();
		AdminEmailVo vo = adminEemailMapper.getView("");

		if (log.isDebugEnabled()) {
			log.debug("------------------------------------------Email---------------------------");
		}

		String PROTOCOL = vo.getPROTOCOL()+"";
		String HOST = vo.getHOST() + "";
		String PORT = vo.getPORT() + "";
		String FORMUSER = vo.getFORMUSER() + "";
		String AUTH = vo.getAUTH() + "";
		String ID = vo.getID() + "";
		String PW = vo.getPW() + "";

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
		log.debug(" title :  " + "테스트 전송 메일 입니다.");
		log.debug(" content :  " + "테스트 전송 메일 입니다.");
		log.debug(" toMail :  " + vo.getTOEMAIL());

		int rtn = 1;

		try {
			String filename = "";
			String content = "테스트 전송 내용 입니다.";
			String subject = "테스트 전송 메일 입니다.";
			
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
			address.setPersonal(FORMUSER, "euc-kr");

			message.setFrom(address);
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(vo.getTOEMAIL(), parseStrict));
			message.setSubject(subject);

			message.setHeader("X-Mailer", "sendMessage");
			message.setSentDate(new Date());

			MimeBodyPart attachPart = new MimeBodyPart();
	

			MimeBodyPart bodypart = new MimeBodyPart();
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
		
}
