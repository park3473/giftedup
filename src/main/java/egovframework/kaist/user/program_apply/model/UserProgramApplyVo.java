package egovframework.kaist.user.program_apply.model;

import egovframework.kaist.user.SearchVo;

public class UserProgramApplyVo extends SearchVo{

	String IDX = ""; 
	String PROGRAM_IDX; 
	String MEMBER_ID; 
	String APPLY = ""; 
	String CREATE_TM; 
	String UPDATE_TM; 

	String ATTEND = "";
	
	String SEARCH_TYPE = "";
	String SEARCH_TEXT = "";
	int LIMIT;
	int OFFSET;
	
	
	
	public String getATTEND() {
		return ATTEND;
	}
	public void setATTEND(String aTTEND) {
		ATTEND = aTTEND;
	}
	public String getIDX() {
		return IDX;
	}
	public void setIDX(String iDX) {
		IDX = iDX;
	}
	public String getPROGRAM_IDX() {
		return PROGRAM_IDX;
	}
	public void setPROGRAM_IDX(String pROGRAM_IDX) {
		PROGRAM_IDX = pROGRAM_IDX;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
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
	public String getUPDATE_TM() {
		return UPDATE_TM;
	}
	public void setUPDATE_TM(String uPDATE_TM) {
		UPDATE_TM = uPDATE_TM;
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
		
	
}
