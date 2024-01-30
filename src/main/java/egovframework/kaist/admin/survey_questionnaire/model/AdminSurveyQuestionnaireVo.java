package egovframework.kaist.admin.survey_questionnaire.model;

import java.util.ArrayList;
import java.util.List;

import egovframework.kaist.admin.SearchVo;
import egovframework.kaist.admin.survey_question.model.AdminSurveyQuestionVo;

public class AdminSurveyQuestionnaireVo extends SearchVo{

	String IDX; 
	String SURVEY_IDX = ""; 
	String TITLE; 
	String CREATE_TM; 
	String UPDATE_TM; 
	String CONTENT = ""; 
	
	String QUESTION;
	String TYPE;
	String QUESTION_SELECT;
	
	
		
	List<AdminSurveyQuestionnaireVo> list = new ArrayList();

	
	String SEARCH_TYPE = "";
	String SEARCH_TEXT = "";
	int LIMIT;
	int OFFSET;
	
	
	
	
	public List<AdminSurveyQuestionnaireVo> getList() {
		return list;
	}
	public void setList(List<AdminSurveyQuestionnaireVo> list) {
		this.list = list;
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
	public String getQUESTION_SELECT() {
		return QUESTION_SELECT;
	}
	public void setQUESTION_SELECT(String qUESTION_SELECT) {
		QUESTION_SELECT = qUESTION_SELECT;
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
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
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
	public String getCONTENT() {
		return CONTENT;
	}
	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
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
