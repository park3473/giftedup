package egovframework.kaist.admin.crontab;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.system.util.SUtil;

import egovframework.kaist.admin.email_send.service.AdminEmailSendService;
import egovframework.kaist.admin.member.service.AdminMemberService;
import egovframework.kaist.admin.sms_log.service.AdminSmsLogService;


@Component
public class Scheduler {
	
	@Autowired
	AdminEmailSendService adminEmailSendService;
	
	@Autowired
	AdminMemberService adminMemberService;
	
	@Autowired
	AdminSmsLogService adminSmsLogService;
	
	
	//@Scheduled(cron = "30 0/5 * * * *")
	@Scheduled(cron = "30 0/10 * * * *")
	public void cronTest2() 
	{
		if(false)
		{
			adminEmailSendService.setCronSend();	
		}
		
	}
	@Scheduled(cron = "10 0/5 * * * *")
	public void cronTest4() 
	{
	}	
	@Scheduled(cron = "*/10 * * * * *")
	public void cronTest5() 
	{
		if(false)
		{
			adminSmsLogService.setSendSms();	
		}
		
	}
	
	
}
