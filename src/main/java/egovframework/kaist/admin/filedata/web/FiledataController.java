package egovframework.kaist.admin.filedata.web;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Iterator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
/**
 * Handles requests for the application home page.
 */
@Controller
public class FiledataController {

	private static final Logger logger = LoggerFactory.getLogger(FiledataController.class);

	/*	
	@Value("#{FILE['EXCEL_UPLOAD_PATH']}")
	public String EXCEL_UPLOAD_PATH;
	
	@Value("#{FILE['FILE_UPLOAD_PATH']}")
	public String FILE_UPLOAD_PATH;
	
	@Value("#{FILE['UPLOAD_TEMP']}") 
	public  String UPLOAD_TEMP;
	
	@Value("#{FILE['FILE_EXPORT_KTDB_PATH']}") 
	public  String FILE_EXPORT_KTDB_PATH;
	*/
	
	@RequestMapping(value = {"/filedata/filepost.do"}, method = RequestMethod.POST) //ajax에서 호출하는 부분
	@ResponseBody
	public String upload(MultipartHttpServletRequest multipartRequest) { //Multipart로 받는다.
		
		System.out.println("/fileUpload/post");
		
	    Iterator<String> itr =  multipartRequest.getFileNames();
	    String fname="";
	    while (itr.hasNext()) { //받은 파일들을 모두 돌린다.
	    	
	    	MultipartFile mpf = multipartRequest.getFile(itr.next());
		    String originFileName = mpf.getOriginalFilename();
		    System.out.println("FILE_INFO: "+originFileName); //받은 파일 리스트 출력
	    
		    String drv = multipartRequest.getRealPath("");
			drv = drv.substring(0, drv.length()) + "./resources"+multipartRequest.getContextPath()+"/upload/notices/";

			 File desti = new File(drv);
		  	 if(!desti.exists())
			 {
				desti.mkdirs(); 
			 }
		  	 System.out.println("fileupload : " + drv);
		  	 
		  	long time = System.currentTimeMillis()/1000;
		  	fname = time+"_"+originFileName;
		  	
		  	fname = fname.trim(); 
		  	String rname = "";
		  	for(int i = 0; i < fname.length(); i++)
		  	{
		  		if(fname.charAt(i) != ' ')
		  		{
		  			rname += fname.charAt(i);
		  		}
		  	}
		  	fname = rname;
		  	System.out.println("fname = "+fname);
		  	File file = new File(drv+fname);
			
			if(! file.exists()) 
			{
				try {
					file.createNewFile();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
			}else 
			{
				file.delete();
				try {
					file.createNewFile();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
			}
			try {
				mpf.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
       }
	    
	    try {
	    	fname = URLEncoder.encode(fname, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	    System.out.println("/fileUpload/post return");
		return "success " + fname;
	}
	
}
