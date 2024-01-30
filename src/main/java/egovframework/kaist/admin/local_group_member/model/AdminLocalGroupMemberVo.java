package egovframework.kaist.admin.local_group_member.model;

import egovframework.kaist.admin.SearchVo;

public class AdminLocalGroupMemberVo extends SearchVo {

	
	String MEMBER_ID; 
	String LOCAL_GROUP_IDX = ""; 
	String CREATE_TM;
	String UPDATE_TM;
	
	
	
	
	String SEARCH_TYPE = "";
	String SEARCH_TEXT = "";
	
	int LIMIT;
	int OFFSET;
	
	String UP = "";
	String DOWN = "";
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
	
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getLOCAL_GROUP_IDX() {
		return LOCAL_GROUP_IDX;
	}
	public void setLOCAL_GROUP_IDX(String lOCAL_GROUP_IDX) {
		LOCAL_GROUP_IDX = lOCAL_GROUP_IDX;
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
