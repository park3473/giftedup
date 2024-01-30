package egovframework.kaist.admin.ckeditor.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller	
public class CkeditorController {
	
	protected Log log = LogFactory.getLog(CkeditorController.class);
	
	
	
	@RequestMapping(value = "/ckeditor/file_upload.do", method = RequestMethod.POST)
	public void communityImageUpload2(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {

	    OutputStream out = null;
	    PrintWriter printWriter = null;
	    response.setCharacterEncoding("utf-8");
	    response.setContentType("text/html;charset=utf-8");
	    String callback = request.getParameter("CKEditorFuncNum");
	    try{
	    	
	        String fileName = upload.getOriginalFilename();
	        byte[] bytes = upload.getBytes();
	        //String uploadPath = "저장경로/" + fileName;//저장경로
	        
	        String drv = request.getRealPath("");
			
			drv = drv.substring(0, drv.length()) + "./resources"+request.getContextPath()+"/upload/ckeditor/";
			
			 File desti = new File(drv);
		  	 if(!desti.exists())
			 {
				desti.mkdirs(); 
			 }
			
			
			String inDate   = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
			String inTime   = new java.text.SimpleDateFormat("HHmmss").format(new java.util.Date());
			
			fileName = inDate + inTime + fileName;
			
	        out = new FileOutputStream(new File(drv+fileName));
	        out.write(bytes);
	       
	        
	        printWriter = response.getWriter();
	        String fileUrl = drv + fileName;//url경로

	        String javascriptMsg = "<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
	                + callback
	                + ",'"+request.getContextPath()
	                + "/resources"+request.getContextPath()+"/upload/ckeditor/"+fileName
	                + "','파일을 업로드 하였습니다.'"
	                + ")</script>";
	        
	        printWriter.println(javascriptMsg);
	        
	        printWriter.flush();
	        
	        if (log.isDebugEnabled()) {
	            log.debug(" Request drv \t:  " + drv);
	            log.debug(" Request filename \t:  " + fileName);
	            log.debug(" Request callback \t:  " + callback);
	            log.debug(" Request javascriptMsg \t:  " + javascriptMsg);
		    }

	    }catch(IOException e){
	        e.printStackTrace();
	        String javascriptMsg = "<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
	                + callback
	                + ",'"
	                + "','이미지를 업로드 실패 하였습니다.'"
	                + ")</script>";
	        printWriter.println(javascriptMsg);
	        printWriter.flush();
	    } finally {
	        try {
	            if (out != null) {
	                out.close();
	            }
	            if (printWriter != null) {
	                printWriter.close();
	            }
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	    return;
	}
}
