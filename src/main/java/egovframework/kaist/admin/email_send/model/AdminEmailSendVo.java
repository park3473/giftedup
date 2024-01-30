package egovframework.kaist.admin.email_send.model;

import com.system.util.SUtil;

public class AdminEmailSendVo {

	String IDX;
	String TITLE;
	String CONTENT;
	String TOMAIL;
	String APPLY = "0";
	String CREATE_TM;
	String RECOUNT = "0";
	String UPDATE_TM;
	String FROM_MAIL = "";

	String MEMBER_ID = "";
	String START_TM = SUtil.getNowDate();
	String END_TM= SUtil.getNowDate();
	
	int page;
	int pageItemCount;
	
	public String getFROM_MAIL() {
		return FROM_MAIL;
	}
	public void setFROM_MAIL(String fROM_MAIL) {
		FROM_MAIL = fROM_MAIL;
	}
	public String getIDX() {
		return IDX;
	}
	public void setIDX(String iDX) {
		IDX = iDX;
	}
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}
	public String getCONTENT() {
		return CONTENT;
	}
	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}
	public String getTOMAIL() {
		return TOMAIL;
	}
	public void setTOMAIL(String tOMAIL) {
		TOMAIL = tOMAIL;
	}
	public String getAPPLY() {
		return APPLY;
	}
	public void setAPPLY(String aPPLY) {
		APPLY = aPPLY;
	}
	public String getCREATE_TM() {
		return CREATE_TM;
	}
	public void setCREATE_TM(String cREATE_TM) {
		CREATE_TM = cREATE_TM;
	}
	public String getRECOUNT() {
		return RECOUNT;
	}
	public void setRECOUNT(String rECOUNT) {
		RECOUNT = rECOUNT;
	}
	public String getUPDATE_TM() {
		return UPDATE_TM;
	}
	public void setUPDATE_TM(String uPDATE_TM) {
		UPDATE_TM = uPDATE_TM;
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
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getSTART_TM() {
		return START_TM;
	}
	public void setSTART_TM(String sTART_TM) {
		START_TM = sTART_TM;
	}
	public String getEND_TM() {
		return END_TM;
	}
	public void setEND_TM(String eND_TM) {
		END_TM = eND_TM;
	}

}
