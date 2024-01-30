package egovframework.kaist.user.survey_select.model;

import egovframework.kaist.user.SearchVo;

public class UserSurveySelectVo extends SearchVo{

	String IDX; 
	String SURVEY_IDX  =""; 
	String SURVEY_QUESTION_IDX = ""; 
	String SELECT_ITEM; 
	String USE_KEY; 
	String CREATE_TM; 

	String SURVEY_QUESLIONNAIRE_IDX  ="";;
	
	String SEARCH_TYPE = "";
	String SEARCH_TEXT = "";
	int LIMIT;
	int OFFSET;
	
	
	public String getSURVEY_QUESLIONNAIRE_IDX() {
		return SURVEY_QUESLIONNAIRE_IDX;
	}
	public void setSURVEY_QUESLIONNAIRE_IDX(String sURVEY_QUESLIONNAIRE_IDX) {
		SURVEY_QUESLIONNAIRE_IDX = sURVEY_QUESLIONNAIRE_IDX;
	}
	public String getIDX() {
		return IDX;
	}
	public void setIDX(String iDX) {
		IDX = iDX;
	}
	public String getSURVEY_IDX() {
		return SURVEY_IDX;
	}
	public void setSURVEY_IDX(String sURVEY_IDX) {
		SURVEY_IDX = sURVEY_IDX;
	}
	public String getSURVEY_QUESTION_IDX() {
		return SURVEY_QUESTION_IDX;
	}
	public void setSURVEY_QUESTION_IDX(String sURVEY_QUESTION_IDX) {
		SURVEY_QUESTION_IDX = sURVEY_QUESTION_IDX;
	}
	public String getSELECT_ITEM() {
		return SELECT_ITEM;
	}
	public void setSELECT_ITEM(String sELECT_ITEM) {
		SELECT_ITEM = sELECT_ITEM;
	}
	public String getUSE_KEY() {
		return USE_KEY;
	}
	public void setUSE_KEY(String uSE_KEY) {
		USE_KEY = uSE_KEY;
	}
	public String getCREATE_TM() {
		return CREATE_TM;
	}
	public void setCREATE_TM(String cREATE_TM) {
		CREATE_TM = cREATE_TM;
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
