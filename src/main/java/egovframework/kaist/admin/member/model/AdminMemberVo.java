package egovframework.kaist.admin.member.model;

import java.util.ArrayList;
import java.util.List;

import egovframework.kaist.admin.SearchVo;

public class AdminMemberVo extends SearchVo {

	String MEMBER_ID = "";
	String PASSWORD = "";
	String NAME = "";
	String PHONE = "";
	String EMAIL = "";
	String LEVEL = "";
	String JOIN_TM = "";
	String CREATE_TM = "";
	String TYPE = "";
	String TYPE_SUB = "";
	String NAME_ENG = "";
	String NAME_HANJA = "";
	String IMAGE = "";
	String ADDRESS_LOCAL = "";
	String SCHOOL_NAME = "";
	String SCHOOL_TYPE = "";
	String SCHOOL_YEAR = "";
	String SCHOOL_GROUP = "";
	String BIRTH = "";
	String SEX = "";
	String SCHOOL_ZIPCODE = "";
	String SCHOOL_ADDRESS = "";
	String SCHOOL_ADDRESS_DETAIL = "";
	String SUPPORT_AREA = "";
	String ZIPCODE = "";
	String ADDRESS = "";
	String ADDRESS_DETAIL = "";
	String PARENTS_NAME = "";
	String PARENTS_RELATION = "";
	String PARENTS_PHONE = "";
	String PARENTS_PHONE2 = "";
	String INFO_AGREEMENT = "";
	
	String DORMANCY_TM = "";
	String LOGIN_TM = "";
	String UPDATE_TM = "";
	String STATUS = "";
	String SCHOOL_NUMBER = "";
	String SCHOOL_JIGGEUB = "";
	String TEL = "";
	String DORMANCY = "";
	
	String INFO_AGREEMENT_TM = "";
	
	String SCHOOL_MAJOR = "";
	String ELIGIBILITY = "";
	String EXP = "";
	String EXP_TYPE = "";
	String EXP_DATA = "";
	String TEST = "";
	String COMM_DATA = "";
	String COMM_TYPE = "";
	
	
	String AREA_NUMBER = "";
	
	int LIMIT;
	int OFFSET;


	String UP = "";
	String DOWN = "";
	
	List<String> LO_LIST = new ArrayList();
	
	String LO_TYPE = "";
	
	public String getTEST() {
		return TEST;
	}
	public void setTEST(String tEST) {
		TEST = tEST;
	}
	public String getINFO_AGREEMENT_TM() {
		return INFO_AGREEMENT_TM;
	}
	public void setINFO_AGREEMENT_TM(String iNFO_AGREEMENT_TM) {
		INFO_AGREEMENT_TM = iNFO_AGREEMENT_TM;
	}
	public String getSCHOOL_MAJOR() {
		return SCHOOL_MAJOR;
	}
	public void setSCHOOL_MAJOR(String sCHOOL_MAJOR) {
		SCHOOL_MAJOR = sCHOOL_MAJOR;
	}
	public String getELIGIBILITY() {
		return ELIGIBILITY;
	}
	public void setELIGIBILITY(String eLIGIBILITY) {
		ELIGIBILITY = eLIGIBILITY;
	}
	public String getEXP() {
		return EXP;
	}
	public void setEXP(String eXP) {
		EXP = eXP;
	}
	public String getEXP_TYPE() {
		return EXP_TYPE;
	}
	public void setEXP_TYPE(String eXP_TYPE) {
		EXP_TYPE = eXP_TYPE;
	}
	public String getEXP_DATA() {
		return EXP_DATA;
	}
	public void setEXP_DATA(String eXP_DATA) {
		EXP_DATA = eXP_DATA;
	}
	public String getDORMANCY() {
		return DORMANCY;
	}
	public void setDORMANCY(String dORMANCY) {
		DORMANCY = dORMANCY;
	}
	
	
	public String getAREA_NUMBER() {
		return AREA_NUMBER;
	}
	public void setAREA_NUMBER(String aREA_NUMBER) {
		AREA_NUMBER = aREA_NUMBER;
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
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
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
	public String getLEVEL() {
		return LEVEL;
	}
	public void setLEVEL(String lEVEL) {
		LEVEL = lEVEL;
	}
	public String getJOIN_TM() {
		return JOIN_TM;
	}
	public void setJOIN_TM(String jOIN_TM) {
		JOIN_TM = jOIN_TM;
	}
	public String getCREATE_TM() {
		return CREATE_TM;
	}
	public void setCREATE_TM(String cREATE_TM) {
		CREATE_TM = cREATE_TM;
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
	public String getNAME_ENG() {
		return NAME_ENG;
	}
	public void setNAME_ENG(String nAME_ENG) {
		NAME_ENG = nAME_ENG;
	}
	public String getNAME_HANJA() {
		return NAME_HANJA;
	}
	public void setNAME_HANJA(String nAME_HANJA) {
		NAME_HANJA = nAME_HANJA;
	}
	public String getIMAGE() {
		return IMAGE;
	}
	public void setIMAGE(String iMAGE) {
		IMAGE = iMAGE;
	}
	public String getADDRESS_LOCAL() {
		return ADDRESS_LOCAL;
	}
	public void setADDRESS_LOCAL(String aDDRESS_LOCAL) {
		ADDRESS_LOCAL = aDDRESS_LOCAL;
	}
	public String getSCHOOL_NAME() {
		return SCHOOL_NAME;
	}
	public void setSCHOOL_NAME(String sCHOOL_NAME) {
		SCHOOL_NAME = sCHOOL_NAME;
	}
	public String getSCHOOL_TYPE() {
		return SCHOOL_TYPE;
	}
	public void setSCHOOL_TYPE(String sCHOOL_TYPE) {
		SCHOOL_TYPE = sCHOOL_TYPE;
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
	public String getSCHOOL_ZIPCODE() {
		return SCHOOL_ZIPCODE;
	}
	public void setSCHOOL_ZIPCODE(String sCHOOL_ZIPCODE) {
		SCHOOL_ZIPCODE = sCHOOL_ZIPCODE;
	}
	public String getSCHOOL_ADDRESS() {
		return SCHOOL_ADDRESS;
	}
	public void setSCHOOL_ADDRESS(String sCHOOL_ADDRESS) {
		SCHOOL_ADDRESS = sCHOOL_ADDRESS;
	}
	public String getSCHOOL_ADDRESS_DETAIL() {
		return SCHOOL_ADDRESS_DETAIL;
	}
	public void setSCHOOL_ADDRESS_DETAIL(String sCHOOL_ADDRESS_DETAIL) {
		SCHOOL_ADDRESS_DETAIL = sCHOOL_ADDRESS_DETAIL;
	}
	public String getSUPPORT_AREA() {
		return SUPPORT_AREA;
	}
	public void setSUPPORT_AREA(String sUPPORT_AREA) {
		SUPPORT_AREA = sUPPORT_AREA;
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
	public String getPARENTS_NAME() {
		return PARENTS_NAME;
	}
	public void setPARENTS_NAME(String pARENTS_NAME) {
		PARENTS_NAME = pARENTS_NAME;
	}
	public String getPARENTS_RELATION() {
		return PARENTS_RELATION;
	}
	public void setPARENTS_RELATION(String pARENTS_RELATION) {
		PARENTS_RELATION = pARENTS_RELATION;
	}
	public String getPARENTS_PHONE() {
		return PARENTS_PHONE;
	}
	public void setPARENTS_PHONE(String pARENTS_PHONE) {
		PARENTS_PHONE = pARENTS_PHONE;
	}
	public String getPARENTS_PHONE2() {
		return PARENTS_PHONE2;
	}
	public void setPARENTS_PHONE2(String pARENTS_PHONE2) {
		PARENTS_PHONE2 = pARENTS_PHONE2;
	}
	public String getINFO_AGREEMENT() {
		return INFO_AGREEMENT;
	}
	public void setINFO_AGREEMENT(String iNFO_AGREEMENT) {
		INFO_AGREEMENT = iNFO_AGREEMENT;
	}

	public String getDORMANCY_TM() {
		return DORMANCY_TM;
	}
	public void setDORMANCY_TM(String dORMANCY_TM) {
		DORMANCY_TM = dORMANCY_TM;
	}
	public String getLOGIN_TM() {
		return LOGIN_TM;
	}
	public void setLOGIN_TM(String lOGIN_TM) {
		LOGIN_TM = lOGIN_TM;
	}
	public String getUPDATE_TM() {
		return UPDATE_TM;
	}
	public void setUPDATE_TM(String uPDATE_TM) {
		UPDATE_TM = uPDATE_TM;
	}
	public String getSTATUS() {
		return STATUS;
	}
	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}
	public String getSCHOOL_NUMBER() {
		return SCHOOL_NUMBER;
	}
	public void setSCHOOL_NUMBER(String sCHOOL_NUMBER) {
		SCHOOL_NUMBER = sCHOOL_NUMBER;
	}
	public String getSCHOOL_JIGGEUB() {
		return SCHOOL_JIGGEUB;
	}
	public void setSCHOOL_JIGGEUB(String sCHOOL_JIGGEUB) {
		SCHOOL_JIGGEUB = sCHOOL_JIGGEUB;
	}
	public String getTEL() {
		return TEL;
	}
	public void setTEL(String tEL) {
		TEL = tEL;
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
	public String getCOMM_DATA() {
		return COMM_DATA;
	}
	public void setCOMM_DATA(String cOMM_DATA) {
		COMM_DATA = cOMM_DATA;
	}
	public String getCOMM_TYPE() {
		return COMM_TYPE;
	}
	public void setCOMM_TYPE(String cOMM_TYPE) {
		COMM_TYPE = cOMM_TYPE;
	}
	public String getLO_TYPE() {
		return LO_TYPE;
	}
	public void setLO_TYPE(String lO_TYPE) {
		LO_TYPE = lO_TYPE;
	}
	public List<String> getLO_LIST() {
		return LO_LIST;
	}
	public void setLO_LIST(List<String> lO_LIST) {
		LO_LIST = lO_LIST;
	}

	
	
}
