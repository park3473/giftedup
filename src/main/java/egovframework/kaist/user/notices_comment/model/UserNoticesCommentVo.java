package egovframework.kaist.user.notices_comment.model;

import egovframework.kaist.admin.SearchVo;

public class UserNoticesCommentVo extends SearchVo{

	String IDX; 
	String MEMBER_ID = ""; 
	
	String NOTICES_IDX; 
	String NOTICES_DATA_IDX; 
	String COMMENT; 
	String NAME; 
	String CREATE_TM = ""; 
	String PASSWORD; 
	String SECRET_WRITING; 
	
	int LIMIT;
	int OFFSET;
	
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
	public String getNOTICES_IDX() {
		return NOTICES_IDX;
	}
	public void setNOTICES_IDX(String nOTICES_IDX) {
		NOTICES_IDX = nOTICES_IDX;
	}
	public String getNOTICES_DATA_IDX() {
		return NOTICES_DATA_IDX;
	}
	public void setNOTICES_DATA_IDX(String nOTICES_DATA_IDX) {
		NOTICES_DATA_IDX = nOTICES_DATA_IDX;
	}
	public String getCOMMENT() {
		return COMMENT;
	}
	public void setCOMMENT(String cOMMENT) {
		COMMENT = cOMMENT;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getCREATE_TM() {
		return CREATE_TM;
	}
	public void setCREATE_TM(String cREATE_TM) {
		CREATE_TM = cREATE_TM;
	}
	public String getPASSWORD() {
		return PASSWORD;
	}
	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}
	public String getSECRET_WRITING() {
		return SECRET_WRITING;
	}
	public void setSECRET_WRITING(String sECRET_WRITING) {
		SECRET_WRITING = sECRET_WRITING;
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
