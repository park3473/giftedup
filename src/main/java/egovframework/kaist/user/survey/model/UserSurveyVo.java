package egovframework.kaist.user.survey.model;

import egovframework.kaist.user.SearchVo;

public class UserSurveyVo extends SearchVo{

	String IDX; 
	String MEMBER_ID; 
	String TITLE; 
	String END_TM; 
	String CREATE_TM; 
	String USE_KEY; 
	String READ_CNT = "0"; 
	String CONTENT; 
	String START_TM; 
	String TYPE; 
	String WIDTH; 
	String HEIGHT; 
	String POINT_X; 
	String POINT_Y; 
	String CODE; 
	String UPDATE_TM;
	String SURVEY_CNT;
	

	String START_STATUS;
	String END_STATUS;
	
	String TYPE_SUB = "";

	String SEARCH_TYPE = "";
	String SEARCH_TEXT = "";
	int LIMIT;
	int OFFSET;

	String UP = "";
	String DOWN = "";

	public String getSURVEY_CNT() {
		return SURVEY_CNT;
	}
	public void setSURVEY_CNT(String sURVEY_CNT) {
		SURVEY_CNT = sURVEY_CNT;
	}
	public String getSTART_STATUS() {
		return START_STATUS;
	}
	public void setSTART_STATUS(String sTART_STATUS) {
		START_STATUS = sTART_STATUS;
	}
	public String getEND_STATUS() {
		return END_STATUS;
	}
	public void setEND_STATUS(String eND_STATUS) {
		END_STATUS = eND_STATUS;
	}
	public String getTYPE_SUB() {
		return TYPE_SUB;
	}
	public void setTYPE_SUB(String tYPE_SUB) {
		TYPE_SUB = tYPE_SUB;
	}

	public String getCODE() {
		return CODE;
	}
	public void setCODE(String cODE) {
		CODE = cODE;
	}
	public String getUPDATE_TM() {
		return UPDATE_TM;
	}
	public void setUPDATE_TM(String uPDATE_TM) {
		UPDATE_TM = uPDATE_TM;
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
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}
	
	
	
	public String getEND_TM() {
		return END_TM;
	}
	public void setEND_TM(String eND_TM) {
		END_TM = eND_TM;
	}
	public String getCREATE_TM() {
		return CREATE_TM;
	}
	public void setCREATE_TM(String cREATE_TM) {
		CREATE_TM = cREATE_TM;
	}
	public String getUSE_KEY() {
		return USE_KEY;
	}
	public void setUSE_KEY(String uSE_KEY) {
		USE_KEY = uSE_KEY;
	}
	public String getREAD_CNT() {
		return READ_CNT;
	}
	public void setREAD_CNT(String rEAD_CNT) {
		READ_CNT = rEAD_CNT;
	}
	public String getCONTENT() {
		return CONTENT;
	}
	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}
	public String getSTART_TM() {
		return START_TM;
	}
	public void setSTART_TM(String sTART_TM) {
		START_TM = sTART_TM;
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
