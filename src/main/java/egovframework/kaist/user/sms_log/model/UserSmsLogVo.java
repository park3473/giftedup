package egovframework.kaist.user.sms_log.model;

public class UserSmsLogVo {

	String IDX = "";
	String PHONE = "";
	String MESSAGE = "";
	String STATUS = "";
	String CREATE_TM = "";
	String DELETE_TM = "";
	String RESERVATION_TM = "";
	String RESERVATION = "";
	String MEMBER_ID = "";
	
	String SEARCH_TYPE = "";
	String SEARCH_TEXT = "";
	int LIMIT;
	int OFFSET;
	int page = 0;
	int pageItemCount = 10;
	public String getIDX() {
		return IDX;
	}
	public void setIDX(String iDX) {
		IDX = iDX;
	}
	public String getPHONE() {
		return PHONE;
	}
	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}
	public String getMESSAGE() {
		return MESSAGE;
	}
	public void setMESSAGE(String mESSAGE) {
		MESSAGE = mESSAGE;
	}
	public String getSTATUS() {
		return STATUS;
	}
	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}
	public String getCREATE_TM() {
		return CREATE_TM;
	}
	public void setCREATE_TM(String cREATE_TM) {
		CREATE_TM = cREATE_TM;
	}
	public String getDELETE_TM() {
		return DELETE_TM;
	}
	public void setDELETE_TM(String dELETE_TM) {
		DELETE_TM = dELETE_TM;
	}
	public String getRESERVATION_TM() {
		return RESERVATION_TM;
	}
	public void setRESERVATION_TM(String rESERVATION_TM) {
		RESERVATION_TM = rESERVATION_TM;
	}
	public String getRESERVATION() {
		return RESERVATION;
	}
	public void setRESERVATION(String rESERVATION) {
		RESERVATION = rESERVATION;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getSEARCH_TYPE() {
		return SEARCH_TYPE;
	}
	public void setSEARCH_TYPE(String sEARCH_TYPE) {
		SEARCH_TYPE = sEARCH_TYPE;
	}
	public String getSEARCH_TEXT() {
		return SEARCH_TEXT;
	}
	public void setSEARCH_TEXT(String sEARCH_TEXT) {
		SEARCH_TEXT = sEARCH_TEXT;
	}
	public int getLIMIT() {
		return LIMIT;
	}
	public void setLIMIT(int lIMIT) {
		LIMIT = lIMIT;
	}
	public int getOFFSET() {
		return OFFSET;
	}
	public void setOFFSET(int oFFSET) {
		OFFSET = oFFSET;
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
