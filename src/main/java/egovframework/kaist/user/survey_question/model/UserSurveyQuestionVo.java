package egovframework.kaist.user.survey_question.model;

import egovframework.kaist.user.SearchVo;

public class UserSurveyQuestionVo extends SearchVo{

	long IDX; 
	String SURVEY_IDX = ""; 
	String QUESTION; 
	String TYPE; 
	String USEKEY; 
	String CREATE_TM; 
	String IMAGE; 
	String SURVEY_QUESLIONNAIRE_IDX = ""; 
	String TURN; 


	
	String SEARCH_TYPE = "";
	String SEARCH_TEXT = "";
	int LIMIT;
	int OFFSET;
	
	
	public long getIDX() {
		return IDX;
	}
	public void setIDX(long iDX) {
		IDX = iDX;
	}
	public String getSURVEY_IDX() {
		return SURVEY_IDX;
	}
	public void setSURVEY_IDX(String sURVEY_IDX) {
		SURVEY_IDX = sURVEY_IDX;
	}
	public String getQUESTION() {
		return QUESTION;
	}
	public void setQUESTION(String qUESTION) {
		QUESTION = qUESTION;
	}
	public String getTYPE() {
		return TYPE;
	}
	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}
	public String getUSEKEY() {
		return USEKEY;
	}
	public void setUSEKEY(String uSEKEY) {
		USEKEY = uSEKEY;
	}
	public String getCREATE_TM() {
		return CREATE_TM;
	}
	public void setCREATE_TM(String cREATE_TM) {
		CREATE_TM = cREATE_TM;
	}
	public String getIMAGE() {
		return IMAGE;
	}
	public void setIMAGE(String iMAGE) {
		IMAGE = iMAGE;
	}
	
	
	public String getSURVEY_QUESLIONNAIRE_IDX() {
		return SURVEY_QUESLIONNAIRE_IDX;
	}
	public void setSURVEY_QUESLIONNAIRE_IDX(String sURVEY_QUESLIONNAIRE_IDX) {
		SURVEY_QUESLIONNAIRE_IDX = sURVEY_QUESLIONNAIRE_IDX;
	}
	public String getTURN() {
		return TURN;
	}
	public void setTURN(String tURN) {
		TURN = tURN;
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
