package egovframework.kaist.admin.member_re.model;

import java.util.ArrayList;
import java.util.List;

import egovframework.kaist.admin.SearchVo;

public class AdminMemberReVo extends SearchVo {

	String IDX = "";
	String MEMBER_ID = ""; 
	String PASSWORD = ""; 
	String TYPE = ""; 
	String TYPE_SUB = "";
	String LEVEL = "";
	String NAME = ""; 
	String BIRTH = ""; 
	String SEX = ""; 
	
	String PHONE = ""; 
	String EMAIL = ""; 
	String PARENT_PHONE = ""; 
	
	String ZIPCODE = ""; 
	String ADDRESS = ""; 
	String ADDRESS_DETAIL = ""; 
	String ADDRESS_LOCAL = "";
	
	String SCHOOL_TYPE = "";
	String SCHOOL_NAME = ""; 
	String SCHOOL_YEAR = "";
	String SCHOOL_GROUP = "";
	String SCHOOL_ADDRESS = "";

	String ELIGIBILITY = "";
	String SUPPORT_AREA = "";
	
	String SELF_INTR="";
	
	String RESULT = "";
	
	String MATCHING = "";
	
	String CREATE_TM = ""; 
	String UPDATE_TM = ""; 
	
	String EXP_DATA = "";
	String EXP_TYPE = "";
	
	String SEARCH_TYPE = "";
	String SEARCH_TEXT = "";
	int LIMIT;
	int OFFSET;
	
	String UP = "";
	String DOWN = "";
	
	String DCMNT_CNT = "";
	String DCMNT_TOTAL_CNT = "";
	
	String FILE_TYPE ="";
	
	List<String> LO_LIST = new ArrayList();
	
	String LO_TYPE = "";
	
	String COMMENT = "";
	
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
	public String getPASSWORD() {
		return PASSWORD;
	}
	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}
	public String getTYPE() {
		return TYPE;
	}
	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}
	public String getTYPE_SUB() {
		return TYPE_SUB;
	}
	public void setTYPE_SUB(String tYPE_SUB) {
		TYPE_SUB = tYPE_SUB;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getBIRTH() {
		return BIRTH;
	}
	public void setBIRTH(String bIRTH) {
		BIRTH = bIRTH;
	}
	public String getSEX() {
		return SEX;
	}
	public void setSEX(String sEX) {
		SEX = sEX;
	}
	public String getPHONE() {
		return PHONE;
	}
	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public String getPARENT_PHONE() {
		return PARENT_PHONE;
	}
	public void setPARENT_PHONE(String pARENT_PHONE) {
		PARENT_PHONE = pARENT_PHONE;
	}
	public String getZIPCODE() {
		return ZIPCODE;
	}
	public void setZIPCODE(String zIPCODE) {
		ZIPCODE = zIPCODE;
	}
	public String getADDRESS() {
		return ADDRESS;
	}
	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}
	public String getADDRESS_DETAIL() {
		return ADDRESS_DETAIL;
	}
	public void setADDRESS_DETAIL(String aDDRESS_DETAIL) {
		ADDRESS_DETAIL = aDDRESS_DETAIL;
	}
	public String getADDRESS_LOCAL() {
		return ADDRESS_LOCAL;
	}
	public void setADDRESS_LOCAL(String aDDRESS_LOCAL) {
		ADDRESS_LOCAL = aDDRESS_LOCAL;
	}
	public String getSCHOOL_TYPE() {
		return SCHOOL_TYPE;
	}
	public void setSCHOOL_TYPE(String sCHOOL_TYPE) {
		SCHOOL_TYPE = sCHOOL_TYPE;
	}
	public String getSCHOOL_NAME() {
		return SCHOOL_NAME;
	}
	public void setSCHOOL_NAME(String sCHOOL_NAME) {
		SCHOOL_NAME = sCHOOL_NAME;
	}
	public String getSCHOOL_YEAR() {
		return SCHOOL_YEAR;
	}
	public void setSCHOOL_YEAR(String sCHOOL_YEAR) {
		SCHOOL_YEAR = sCHOOL_YEAR;
	}
	public String getSCHOOL_GROUP() {
		return SCHOOL_GROUP;
	}
	public void setSCHOOL_GROUP(String sCHOOL_GROUP) {
		SCHOOL_GROUP = sCHOOL_GROUP;
	}
	public String getELIGIBILITY() {
		return ELIGIBILITY;
	}
	public void setELIGIBILITY(String eLIGIBILITY) {
		ELIGIBILITY = eLIGIBILITY;
	}
	public String getSUPPORT_AREA() {
		return SUPPORT_AREA;
	}
	public void setSUPPORT_AREA(String sUPPORT_AREA) {
		SUPPORT_AREA = sUPPORT_AREA;
	}
	public String getRESULT() {
		return RESULT;
	}
	public void setRESULT(String rESULT) {
		RESULT = rESULT;
	}
	public String getMATCHING() {
		return MATCHING;
	}
	public void setMATCHING(String mATCHING) {
		MATCHING = mATCHING;
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
	public String getEXP_DATA() {
		return EXP_DATA;
	}
	public void setEXP_DATA(String eXP_DATA) {
		EXP_DATA = eXP_DATA;
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
	public String getLEVEL() {
		return LEVEL;
	}
	public void setLEVEL(String lEVEL) {
		LEVEL = lEVEL;
	}
	public String getDCMNT_CNT() {
		return DCMNT_CNT;
	}
	public void setDCMNT_CNT(String dCMNT_CNT) {
		DCMNT_CNT = dCMNT_CNT;
	}
	public String getDCMNT_TOTAL_CNT() {
		return DCMNT_TOTAL_CNT;
	}
	public void setDCMNT_TOTAL_CNT(String dCMNT_TOTAL_CNT) {
		DCMNT_TOTAL_CNT = dCMNT_TOTAL_CNT;
	}
	public String getSELF_INTR() {
		return SELF_INTR;
	}
	public void setSELF_INTR(String sELF_INTR) {
		SELF_INTR = sELF_INTR;
	}
	public String getEXP_TYPE() {
		return EXP_TYPE;
	}
	public void setEXP_TYPE(String eXP_TYPE) {
		EXP_TYPE = eXP_TYPE;
	}
	public String getFILE_TYPE() {
		return FILE_TYPE;
	}
	public void setFILE_TYPE(String fILE_TYPE) {
		FILE_TYPE = fILE_TYPE;
	}
	public List<String> getLO_LIST() {
		return LO_LIST;
	}
	public void setLO_LIST(List<String> lO_LIST) {
		LO_LIST = lO_LIST;
	}
	public String getLO_TYPE() {
		return LO_TYPE;
	}
	public void setLO_TYPE(String lO_TYPE) {
		LO_TYPE = lO_TYPE;
	}
	public String getCOMMENT() {
		return COMMENT;
	}
	public void setCOMMENT(String cOMMENT) {
		COMMENT = cOMMENT;
	}
	public String getSCHOOL_ADDRESS() {
		return SCHOOL_ADDRESS;
	}
	public void setSCHOOL_ADDRESS(String sCHOOL_ADDRESS) {
		SCHOOL_ADDRESS = sCHOOL_ADDRESS;
	}
	
	
	
	
	
}
