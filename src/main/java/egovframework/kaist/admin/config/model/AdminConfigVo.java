package egovframework.kaist.admin.config.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.system.util.SUtil;

public class AdminConfigVo {


	String KEY;
	String DATA = "";
	String NAME;
		
	int page;
	int pageItemCount;
	public String getKEY() {
		return KEY;
	}
	public void setKEY(String kEY) {
		KEY = kEY;
	}
	public String getDATA() {
		return DATA;
	}
	public void setDATA(String dATA) {
		DATA = dATA;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageItemCount() {
		return pageItemCount;
	}
	public void setPageItemCount(int pageItemCount) {
		this.pageItemCount = pageItemCount;
	}

	
	
}
