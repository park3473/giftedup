package egovframework.kaist.admin.email.model;

public class AdminEmailVo {


	String PROTOCOL;
	String HOST;
	String PORT;
	String FORMUSER;
	String AUTH;
	String ID;
	String PW;
	String USE_KEY;
	String TOEMAIL;
	String CREATE_TM;
	
	int page;
	int pageItemCount;
	public String getPROTOCOL() {
		return PROTOCOL;
	}
	public void setPROTOCOL(String pROTOCOL) {
		PROTOCOL = pROTOCOL;
	}
	public String getHOST() {
		return HOST;
	}
	public void setHOST(String hOST) {
		HOST = hOST;
	}
	public String getPORT() {
		return PORT;
	}
	public void setPORT(String pORT) {
		PORT = pORT;
	}
	public String getFORMUSER() {
		return FORMUSER;
	}
	public void setFORMUSER(String fORMUSER) {
		FORMUSER = fORMUSER;
	}
	public String getAUTH() {
		return AUTH;
	}
	public void setAUTH(String aUTH) {
		AUTH = aUTH;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getPW() {
		return PW;
	}
	public void setPW(String pW) {
		PW = pW;
	}
	public String getUSE_KEY() {
		return USE_KEY;
	}
	public void setUSE_KEY(String uSE_KEY) {
		USE_KEY = uSE_KEY;
	}
	public String getTOEMAIL() {
		return TOEMAIL;
	}
	public void setTOEMAIL(String tOEMAIL) {
		TOEMAIL = tOEMAIL;
	}
	public String getCREATE_TM() {
		return CREATE_TM;
	}
	public void setCREATE_TM(String cREATE_TM) {
		CREATE_TM = cREATE_TM;
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
