package egovframework.kaist.admin.notices_data.model;

import egovframework.kaist.admin.SearchVo;

public class AdminNoticesDataVo extends SearchVo{

	String IDX; 
	String NOTICES_IDX = ""; 
	String TYPE; 
	String TYPE_SUB; 
	String TITLE; 
	String CONTENT; 
	String FILES; 
	String LINKS; 
	String PHOTO_SHOW; 
	String PASSWORD; 
	String MEMBER_ID = ""; 
	String CREATE_TM; 
	String UPDATE_TM; 
	String READ_CNT = ""; 
	String IMAGE;
	String MEMBER_NAME;
	
	String SEARCH_TYPE = "";
	String SEARCH_TEXT = "";
	
	String LINKS_TYPE;
	String LINKS2;
	String LINKS2_TYPE;
	String LINK_TYPE;
	
	int LIMIT;
	int OFFSET;
	

	String UP = "";
	String DOWN = "";
	
	public String getMEMBER_NAME() {
		return MEMBER_NAME;
	}
	public void setMEMBER_NAME(String mEMBER_NAME) {
		MEMBER_NAME = mEMBER_NAME;
	}
	public String getLINKS_TYPE() {
		return LINKS_TYPE;
	}
	public void setLINKS_TYPE(String lINKS_TYPE) {
		LINKS_TYPE = lINKS_TYPE;
	}
	public String getIDX() {
		return IDX;
	}
	public void setIDX(String iDX) {
		IDX = iDX;
	}
	public String getNOTICES_IDX() {
		return NOTICES_IDX;
	}
	public void setNOTICES_IDX(String nOTICES_IDX) {
		NOTICES_IDX = nOTICES_IDX;
	}
	public String getTYPE() {
		return TYPE;
	}
	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}
	public String getTYPE_SUB() {
		return TYPE_SUB;
	}
	public void setTYPE_SUB(String tYPE_SUB) {
		TYPE_SUB = tYPE_SUB;
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
	public String getFILES() {
		return FILES;
	}
	public void setFILES(String fILES) {
		FILES = fILES;
	}
	public String getLINKS() {
		return LINKS;
	}
	public void setLINKS(String lINKS) {
		LINKS = lINKS;
	}
	public String getPHOTO_SHOW() {
		return PHOTO_SHOW;
	}
	public void setPHOTO_SHOW(String pHOTO_SHOW) {
		PHOTO_SHOW = pHOTO_SHOW;
	}
	public String getPASSWORD() {
		return PASSWORD;
	}
	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
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
	public String getREAD_CNT() {
		return READ_CNT;
	}
	public void setREAD_CNT(String rEAD_CNT) {
		READ_CNT = rEAD_CNT;
	}
	public String getIMAGE() {
		return IMAGE;
	}
	public void setIMAGE(String iMAGE) {
		IMAGE = iMAGE;
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
	public String getLINKS2() {
		return LINKS2;
	}
	public void setLINKS2(String lINKS2) {
		LINKS2 = lINKS2;
	}
	public String getLINKS2_TYPE() {
		return LINKS2_TYPE;
	}
	public void setLINKS2_TYPE(String lINKS2_TYPE) {
		LINKS2_TYPE = lINKS2_TYPE;
	}
	public String getLINK_TYPE() {
		return LINK_TYPE;
	}
	public void setLINK_TYPE(String lINK_TYPE) {
		LINK_TYPE = lINK_TYPE;
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
	
	
	

	
}
