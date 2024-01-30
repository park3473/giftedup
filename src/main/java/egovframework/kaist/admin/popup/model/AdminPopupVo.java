package egovframework.kaist.admin.popup.model;

import egovframework.kaist.admin.SearchVo;

public class AdminPopupVo extends SearchVo{

	String IDX; 
	String START_TM; 
	String END_TM; 
	String USEKEY; 
	String TYPE; 
	String WIDTH; 
	String HEIGHT; 
	String POINT_X; 
	String POINT_Y; 
	String LINKS; 
	String LINKS_TYPE;
	String TITLE; 
	String CONTENT; 
	
	String CREATE_TM; 
	String UPDATE_TM; 

	String FILES;
	

	
	String SEARCH_TYPE = "";
	String SEARCH_TEXT = "";
	int LIMIT;
	int OFFSET;
	String UP = "";
	String DOWN = "";
	
	public String getFILES() {
		return FILES;
	}
	public void setFILES(String fILES) {
		FILES = fILES;
	}
	public String getUSEKEY() {
		return USEKEY;
	}
	public void setUSEKEY(String uSEKEY) {
		USEKEY = uSEKEY;
	}
	public String getIDX() {
		return IDX;
	}
	public void setIDX(String iDX) {
		IDX = iDX;
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

	public String getTYPE() {
		return TYPE;
	}
	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}
	public String getWIDTH() {
		return WIDTH;
	}
	public void setWIDTH(String wIDTH) {
		WIDTH = wIDTH;
	}
	public String getHEIGHT() {
		return HEIGHT;
	}
	public void setHEIGHT(String hEIGHT) {
		HEIGHT = hEIGHT;
	}
	public String getPOINT_X() {
		return POINT_X;
	}
	public void setPOINT_X(String pOINT_X) {
		POINT_X = pOINT_X;
	}
	public String getPOINT_Y() {
		return POINT_Y;
	}
	public void setPOINT_Y(String pOINT_Y) {
		POINT_Y = pOINT_Y;
	}
	public String getLINKS() {
		return LINKS;
	}
	public void setLINKS(String lINKS) {
		LINKS = lINKS;
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
	public String getLINKS_TYPE() {
		return LINKS_TYPE;
	}
	public void setLINKS_TYPE(String lINKS_TYPE) {
		LINKS_TYPE = lINKS_TYPE;
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
	
	
	
	
	
}
