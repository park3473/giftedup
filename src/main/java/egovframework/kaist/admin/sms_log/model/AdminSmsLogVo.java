package egovframework.kaist.admin.sms_log.model;

import egovframework.kaist.user.SearchVo;

public class AdminSmsLogVo extends SearchVo{

	String IDX = "";
	String PHONE = "";
	String MESSAGE = "";
	String STATUS = "";
	String CREATE_TM = "";
	String DELETE_TM = "";
	String RESERVATION_TM = "";
	String RESERVATION = "";
	String MEMBER_ID = "";
	String TYPE = "";
	String UPDATE_TM = "";
	String RESERVATION_DT = "";
	String SMS_TYPE="";
	String SEARCH_TYPE = "";
	String SEARCH_TEXT = "";
	int LIMIT;
	int OFFSET;
	
	String UP = "";
	String DOWN = "";
	
	String RESULT = "";
	String ADDRESS_LOCAL = "";
	String SCHOOL_TYPE = "";
	String SCHOOL_YEAR = "";
	
	public String getUPDATE_TM() {
		return UPDATE_TM;
	}
	public void setUPDATE_TM(String uPDATE_TM) {
		UPDATE_TM = uPDATE_TM;
	}
	public String getTYPE() {
		return TYPE;
	}
	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}
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
	public String getUP() {
		return UP;
	}
	public void setUP(String uP) {
		UP = uP;
	}
	public String getDOWN() {
		return DOWN;
	}
	public void setDOWN(String dOWN) {
		DOWN = dOWN;
	}
	public String getRESULT() {
		return RESULT;
	}
	public void setRESULT(String rESULT) {
		RESULT = rESULT;
	}
	public String getADDRESS_LOCAL() {
		return ADDRESS_LOCAL;
	}
	public void setADDRESS_LOCAL(String aDDRESS_LOCAL) {
		ADDRESS_LOCAL = aDDRESS_LOCAL;
	}
	public String getRESERVATION_DT() {
		return RESERVATION_DT;
	}
	public void setRESERVATION_DT(String rESERVATION_DT) {
		RESERVATION_DT = rESERVATION_DT;
	}
	public String getSCHOOL_TYPE() {
		return SCHOOL_TYPE;
	}
	public void setSCHOOL_TYPE(String sCHOOL_TYPE) {
		SCHOOL_TYPE = sCHOOL_TYPE;
	}
	public String getSCHOOL_YEAR() {
		return SCHOOL_YEAR;
	}
	public void setSCHOOL_YEAR(String sCHOOL_YEAR) {
		SCHOOL_YEAR = sCHOOL_YEAR;
	}
	public String getSMS_TYPE() {
		return SMS_TYPE;
	}
	public void setSMS_TYPE(String sMS_TYPE) {
		SMS_TYPE = sMS_TYPE;
	}
	
	
	
	
}
