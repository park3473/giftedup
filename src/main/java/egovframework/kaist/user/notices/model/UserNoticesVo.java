package egovframework.kaist.user.notices.model;

import egovframework.kaist.user.SearchVo;

public class UserNoticesVo extends SearchVo{

	String IDX; 
	String TYPE; 
	String NAME; 
	String NOTICES;
	String CREATE_TM; 
	String UPDATE_TM; 
	
	
	String MY_WRITE_SHOW;
	String READ_LEVEL;
	String WRITE_LEVEL;
	String COMMENT_LEVEL;
	String HEAD_HTML;
	
	String CONTENT_HTML;
	
	String SECRET;
	
	
	String SEARCH_TYPE = "";
	String SEARCH_TEXT = "";
	int LIMIT;
	int OFFSET;
	
	
	
	
	public String getSECRET() {
		return SECRET;
	}
	public void setSECRET(String sECRET) {
		SECRET = sECRET;
	}
	public String getCONTENT_HTML() {
		return CONTENT_HTML;
	}
	public void setCONTENT_HTML(String cONTENT_HTML) {
		CONTENT_HTML = cONTENT_HTML;
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
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getNOTICES() {
		return NOTICES;
	}
	public void setNOTICES(String nOTICES) {
		NOTICES = nOTICES;
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
	public String getMY_WRITE_SHOW() {
		return MY_WRITE_SHOW;
	}
	public void setMY_WRITE_SHOW(String mY_WRITE_SHOW) {
		MY_WRITE_SHOW = mY_WRITE_SHOW;
	}
	public String getREAD_LEVEL() {
		return READ_LEVEL;
	}
	public void setREAD_LEVEL(String rEAD_LEVEL) {
		READ_LEVEL = rEAD_LEVEL;
	}
	public String getWRITE_LEVEL() {
		return WRITE_LEVEL;
	}
	public void setWRITE_LEVEL(String wRITE_LEVEL) {
		WRITE_LEVEL = wRITE_LEVEL;
	}
	public String getCOMMENT_LEVEL() {
		return COMMENT_LEVEL;
	}
	public void setCOMMENT_LEVEL(String cOMMENT_LEVEL) {
		COMMENT_LEVEL = cOMMENT_LEVEL;
	}
	public String getHEAD_HTML() {
		return HEAD_HTML;
	}
	public void setHEAD_HTML(String hEAD_HTML) {
		HEAD_HTML = hEAD_HTML;
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
