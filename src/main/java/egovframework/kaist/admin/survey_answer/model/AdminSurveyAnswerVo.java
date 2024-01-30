package egovframework.kaist.admin.survey_answer.model;

import java.util.ArrayList;
import java.util.List;

import egovframework.kaist.admin.SearchVo;
import egovframework.kaist.admin.survey_questionnaire.model.AdminSurveyQuestionnaireVo;

public class AdminSurveyAnswerVo extends SearchVo{

	String IDX; 
	String SURVEY_IDX = ""; 
	String SURVEY_QUESTION_IDX = ""; 
	String SURVEY_SELECT = ""; 
	String MEMBER_ID = ""; 
	String TYPE; 
	String USE_KEY = "0"; 
	String CREATE_TM; 
	String SURVEY_TEXT = "";
	List<AdminSurveyAnswerVo> list = new ArrayList();
	
	
	String SEARCH_TYPE = "";
	String SEARCH_TEXT = "";
	int LIMIT;
	int OFFSET;
	
	
	
	public String getSURVEY_TEXT() {
		return SURVEY_TEXT;
	}
	public void setSURVEY_TEXT(String sURVEY_TEXT) {
		SURVEY_TEXT = sURVEY_TEXT;
	}
	public List<AdminSurveyAnswerVo> getList() {
		return list;
	}
	public void setList(List<AdminSurveyAnswerVo> list) {
		this.list = list;
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
	public String getSURVEY_SELECT() {
		return SURVEY_SELECT;
	}
	public void setSURVEY_SELECT(String sURVEY_SELECT) {
		SURVEY_SELECT = sURVEY_SELECT;
	}

	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getTYPE() {
		return TYPE;
	}
	public void setTYPE(String tYPE) {
		TYPE = tYPE;
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
