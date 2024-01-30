package egovframework.kaist.user.program.model;

import egovframework.kaist.user.SearchVo;

public class UserProgramVo extends SearchVo{

	String IDX = ""; 
	String TYPE = ""; 
	String YEAR = ""; 
	String NAME = ""; 
	String START_TM; 
	String END_TM; 
	String VIDEO; 
	String FILES; 
	String WORKBOOK; 
	String MEMO; 
	String SCHOOL_YEAR = ""; 
	String SELECTION; 
	String EXPERIENCE_START_TM; 
	String EXPERIENCE_END_TM; 
	String SCHOOL_CNT; 
	String SCHOOL_MONEY; 
	String BANK_NAME; 
	String BUS_STATION; 
	String CREATE_TM; 
	String UPDATE_TM; 
	String MEMBER_ID = "";
	
	String START_TM_STEP;
	String END_TM_STEP;
	
	String MEMBER_NAME;

	String ENROLLMENT_STATUS="";
	
	String SEARCH_TYPE = "";
	String SEARCH_TEXT = "";
	String APPLY_CNT = "";
	int LIMIT;
	int OFFSET;
	
	
	 
	public String getAPPLY_CNT() {
		return APPLY_CNT;
	}
	public void setAPPLY_CNT(String aPPLY_CNT) {
		APPLY_CNT = aPPLY_CNT;
	}
	public String getMEMBER_NAME() {
		return MEMBER_NAME;
	}
	public void setMEMBER_NAME(String mEMBER_NAME) {
		MEMBER_NAME = mEMBER_NAME;
	}
	public String getSTART_TM_STEP() {
		return START_TM_STEP;
	}
	public void setSTART_TM_STEP(String sTART_TM_STEP) {
		START_TM_STEP = sTART_TM_STEP;
	}
	public String getEND_TM_STEP() {
		return END_TM_STEP;
	}
	public void setEND_TM_STEP(String eND_TM_STEP) {
		END_TM_STEP = eND_TM_STEP;
	}
	public String getENROLLMENT_STATUS() {
		return ENROLLMENT_STATUS;
	}
	public void setENROLLMENT_STATUS(String eNROLLMENT_STATUS) {
		ENROLLMENT_STATUS = eNROLLMENT_STATUS;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getIDX() {
		return IDX;
	}
	public void setIDX(String iDX) {
		IDX = iDX;
	}
	public String getTYPE() {
		return TYPE;
	}
	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}
	public String getYEAR() {
		return YEAR;
	}
	public void setYEAR(String yEAR) {
		YEAR = yEAR;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
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
	public String getVIDEO() {
		return VIDEO;
	}
	public void setVIDEO(String vIDEO) {
		VIDEO = vIDEO;
	}
	public String getFILES() {
		return FILES;
	}
	public void setFILES(String fILES) {
		FILES = fILES;
	}
	public String getWORKBOOK() {
		return WORKBOOK;
	}
	public void setWORKBOOK(String wORKBOOK) {
		WORKBOOK = wORKBOOK;
	}
	public String getMEMO() {
		return MEMO;
	}
	public void setMEMO(String mEMO) {
		MEMO = mEMO;
	}
	public String getSCHOOL_YEAR() {
		return SCHOOL_YEAR;
	}
	public void setSCHOOL_YEAR(String sCHOOL_YEAR) {
		SCHOOL_YEAR = sCHOOL_YEAR;
	}
	public String getSELECTION() {
		return SELECTION;
	}
	public void setSELECTION(String sELECTION) {
		SELECTION = sELECTION;
	}
	public String getEXPERIENCE_START_TM() {
		return EXPERIENCE_START_TM;
	}
	public void setEXPERIENCE_START_TM(String eXPERIENCE_START_TM) {
		EXPERIENCE_START_TM = eXPERIENCE_START_TM;
	}
	public String getEXPERIENCE_END_TM() {
		return EXPERIENCE_END_TM;
	}
	public void setEXPERIENCE_END_TM(String eXPERIENCE_END_TM) {
		EXPERIENCE_END_TM = eXPERIENCE_END_TM;
	}
	public String getSCHOOL_CNT() {
		return SCHOOL_CNT;
	}
	public void setSCHOOL_CNT(String sCHOOL_CNT) {
		SCHOOL_CNT = sCHOOL_CNT;
	}
	public String getSCHOOL_MONEY() {
		return SCHOOL_MONEY;
	}
	public void setSCHOOL_MONEY(String sCHOOL_MONEY) {
		SCHOOL_MONEY = sCHOOL_MONEY;
	}
	public String getBANK_NAME() {
		return BANK_NAME;
	}
	public void setBANK_NAME(String bANK_NAME) {
		BANK_NAME = bANK_NAME;
	}
	public String getBUS_STATION() {
		return BUS_STATION;
	}
	public void setBUS_STATION(String bUS_STATION) {
		BUS_STATION = bUS_STATION;
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
