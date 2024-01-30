package egovframework.kaist.admin.portfolio.model;

import egovframework.kaist.admin.SearchVo;

public class AdminPortfolioVo extends SearchVo{

	String IDX; 
	String MEMBER_ID; 
	String START_TM; 
	String END_TM; 
	String PLACE; 
	String TEACHER; 
	String CONTENT; 
	String EVALUATION; 
	String FILES = ""; 
	String CREATE_TM; 
	String UPDATE_TM; 
	String PROGRAM_IDX;
	String PROGRAM_NAME;
	String EVALUATION_TACHER;
	
	String SEARCH_TYPE = "";
	String SEARCH_TEXT = "";
	int LIMIT;
	int OFFSET;
	
	String YEAR = "";
	
	
	public String getYEAR() {
		return YEAR;
	}
	public void setYEAR(String yEAR) {
		YEAR = yEAR;
	}
	public String getEVALUATION_TACHER() {
		return EVALUATION_TACHER;
	}
	public void setEVALUATION_TACHER(String eVALUATION_TACHER) {
		EVALUATION_TACHER = eVALUATION_TACHER;
	}
	public String getPROGRAM_NAME() {
		return PROGRAM_NAME;
	}
	public void setPROGRAM_NAME(String pROGRAM_NAME) {
		PROGRAM_NAME = pROGRAM_NAME;
	}
	public String getPROGRAM_IDX() {
		return PROGRAM_IDX;
	}
	public void setPROGRAM_IDX(String pROGRAM_IDX) {
		PROGRAM_IDX = pROGRAM_IDX;
	}
	public String getIDX() {
		return IDX;
	}
	public void setIDX(String iDX) {
		IDX = iDX;
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
	public String getPLACE() {
		return PLACE;
	}
	public void setPLACE(String pLACE) {
		PLACE = pLACE;
	}
	public String getTEACHER() {
		return TEACHER;
	}
	public void setTEACHER(String tEACHER) {
		TEACHER = tEACHER;
	}
	public String getCONTENT() {
		return CONTENT;
	}
	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}
	public String getEVALUATION() {
		return EVALUATION;
	}
	public void setEVALUATION(String eVALUATION) {
		EVALUATION = eVALUATION;
	}
	public String getFILES() {
		return FILES;
	}
	public void setFILES(String fILES) {
		FILES = fILES;
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
