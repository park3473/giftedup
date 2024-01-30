package egovframework.kaist.admin.banner.model;

import egovframework.kaist.admin.SearchVo;

public class AdminBannerVo extends SearchVo {

	String IDX;
	String IMAGE;
	String LINK;
	String WIDTH;
	String HEIGHT;
	String CREATE_TM;
	String TURN;
	String NAME;
	String TYPE;
	String START_TM;
	String UPDATE_TM;
	String USEKEY;
	String END_TM;
	String LINK_TYPE;
	String FILES;
	String MEMBER_ID;

	String SEARCH_TYPE = "";
	String SEARCH_TEXT = "";
	int LIMIT;
	int OFFSET;

	String UP = "";
	String DOWN = "";

	public String getIDX() {
		return IDX;
	}

	public void setIDX(String iDX) {
		IDX = iDX;
	}

	public String getIMAGE() {
		return IMAGE;
	}

	public void setIMAGE(String iMAGE) {
		IMAGE = iMAGE;
	}

	public String getLINK() {
		return LINK;
	}

	public void setLINK(String lINK) {
		LINK = lINK;
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

	public String getCREATE_TM() {
		return CREATE_TM;
	}

	public void setCREATE_TM(String cREATE_TM) {
		CREATE_TM = cREATE_TM;
	}

	public String getTURN() {
		return TURN;
	}

	public void setTURN(String tURN) {
		TURN = tURN;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public String getTYPE() {
		return TYPE;
	}

	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}

	public String getSTART_TM() {
		return START_TM;
	}

	public void setSTART_TM(String sTART_TM) {
		START_TM = sTART_TM;
	}

	public String getUPDATE_TM() {
		return UPDATE_TM;
	}

	public void setUPDATE_TM(String uPDATE_TM) {
		UPDATE_TM = uPDATE_TM;
	}



	public String getUSEKEY() {
		return USEKEY;
	}

	public void setUSEKEY(String uSEKEY) {
		USEKEY = uSEKEY;
	}

	public String getEND_TM() {
		return END_TM;
	}

	public void setEND_TM(String eND_TM) {
		END_TM = eND_TM;
	}

	public String getLINK_TYPE() {
		return LINK_TYPE;
	}

	public void setLINK_TYPE(String lINK_TYPE) {
		LINK_TYPE = lINK_TYPE;
	}

	public String getFILES() {
		return FILES;
	}

	public void setFILES(String fILES) {
		FILES = fILES;
	}

	public String getMEMBER_ID() {
		return MEMBER_ID;
	}

	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
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
