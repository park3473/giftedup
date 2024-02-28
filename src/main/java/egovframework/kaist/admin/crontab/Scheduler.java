package egovframework.kaist.admin.crontab;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.system.util.SUtil;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

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
	/*
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
	@Scheduled(cron = "10 * * * * *")
	public void cronTest5() 
	{
		if(false)
		{
			adminSmsLogService.setSendSms();	
		}
		
	}
	*/
	
	@Scheduled(cron = "0 0 0 1 3 ?")
	public void StudentSchoolAllYearUp() {
	    //학생 학년 +1
		// 현재 날짜를 가져옵니다.
        LocalDate now = LocalDate.now();
        
        // 현재 년도를 추출합니다.
        int year = now.getYear();
        
        // 년도의 마지막 두 자리를 계산합니다.
        int lastTwoDigits = year % 100;
        
        // 마지막 두 자리에서 1을 빼서 결과를 출력합니다.
        int result = lastTwoDigits - 1;
        
        String School = Integer.toString(result);
		
		
		adminMemberService.setStudentSchoolAllYearUp(School);
		
	}
	
}
