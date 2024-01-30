package egovframework.kaist.admin.matching.model;

import egovframework.kaist.admin.SearchVo;

public class AdminMatchingVo extends SearchVo {

	
	String MEMBER_ID = "";
	String NAME = "";
	String EXP_DATA = "";
	
	String PROFESSOR_MEMBER_ID = ""; 
	String SUPPORT_GROUP= "";
	String YEAR= "";
	String SCHOOL_NUMBER = "";
	String SCHOOL_NAME= ""; 
	String SCHOOL_YEAR = "";
	String SCHOOL_GROUP= ""; 
	String OBSERVATION_TEACHER= ""; 
	String ENROLLMENT_STATUS= "";
	String FILES; 
	String MEMO; 
	String CREATE_TM; 
	String UPDATE_TM; 
	String PROFESSOR_MEMBER_NAME;
	
	String PORTFOLIO_CNT;
	
	String SEARCH_TYPE = "";
	String SEARCH_TEXT = "";
	int LIMIT;
	int OFFSET;
	
	String UP = "";
	String DOWN = "";
	public String getSCHOOL_NUMBER() {
		return SCHOOL_NUMBER;
	}
	public void setSCHOOL_NUMBER(String sCHOOL_NUMBER) {
		SCHOOL_NUMBER = sCHOOL_NUMBER;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getPROFESSOR_MEMBER_NAME() {
		return PROFESSOR_MEMBER_NAME;
	}
	public void setPROFESSOR_MEMBER_NAME(String pROFESSOR_MEMBER_NAME) {
		PROFESSOR_MEMBER_NAME = pROFESSOR_MEMBER_NAME;
	}
	public String getPORTFOLIO_CNT() {
		return PORTFOLIO_CNT;
	}
	public void setPORTFOLIO_CNT(String pORTFOLIO_CNT) {
		PORTFOLIO_CNT = pORTFOLIO_CNT;
	}

	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getPROFESSOR_MEMBER_ID() {
		return PROFESSOR_MEMBER_ID;
	}
	public void setPROFESSOR_MEMBER_ID(String pROFESSOR_MEMBER_ID) {
		PROFESSOR_MEMBER_ID = pROFESSOR_MEMBER_ID;
	}
	public String getSUPPORT_GROUP() {
		return SUPPORT_GROUP;
	}
	public void setSUPPORT_GROUP(String sUPPORT_GROUP) {
		SUPPORT_GROUP = sUPPORT_GROUP;
	}
	public String getYEAR() {
		return YEAR;
	}
	public void setYEAR(String yEAR) {
		YEAR = yEAR;
	}

	public String getSCHOOL_NAME() {
		return SCHOOL_NAME;
	}
	public void setSCHOOL_NAME(String sCHOOL_NAME) {
		SCHOOL_NAME = sCHOOL_NAME;
	}
	public String getSCHOOL_YEAR() {
		return SCHOOL_YEAR;
	}
	public void setSCHOOL_YEAR(String sCHOOL_YEAR) {
		SCHOOL_YEAR = sCHOOL_YEAR;
	}
	public String getSCHOOL_GROUP() {
		return SCHOOL_GROUP;
	}
	public void setSCHOOL_GROUP(String sCHOOL_GROUP) {
		SCHOOL_GROUP = sCHOOL_GROUP;
	}

	public String getOBSERVATION_TEACHER() {
		return OBSERVATION_TEACHER;
	}
	public void setOBSERVATION_TEACHER(String oBSERVATION_TEACHER) {
		OBSERVATION_TEACHER = oBSERVATION_TEACHER;
	}
	public String getENROLLMENT_STATUS() {
		return ENROLLMENT_STATUS;
	}
	public void setENROLLMENT_STATUS(String eNROLLMENT_STATUS) {
		ENROLLMENT_STATUS = eNROLLMENT_STATUS;
	}
	
	public String getFILES() {
		return FILES;
	}
	public void setFILES(String fILES) {
		FILES = fILES;
	}
	public String getMEMO() {
		return MEMO;
	}
	public void setMEMO(String mEMO) {
		MEMO = mEMO;
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
	public String getEXP_DATA() {
		return EXP_DATA;
	}
	public void setEXP_DATA(String eXP_DATA) {
		EXP_DATA = eXP_DATA;
	}

	
	
	
}
