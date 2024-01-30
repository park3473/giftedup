package egovframework.kaist.user.portfolio.model;

import egovframework.kaist.user.SearchVo;

public class UserPortfolioVo extends SearchVo{

	String IDX; 
	String MEMBER_ID;
	String NAME;
	String START_TM; 
	String END_TM; 
	String RTICIPATION_TM;
	String PLACE; 
	String TEACHER; 
	String CONTENT; 
	String FILES = ""; 
	String CREATE_TM; 
	String UPDATE_TM; 
	String PROGRAM_IDX;
	String PROFESSOR_MEMBER_ID;
	String PROF_NAME;
	
	String COURSE;
	String COURSE_PRGM;
	String PRGM_NM;
	String STFT;
	String EVALUATION; 
	String EVALUATION_TACHER;
	String EVAL_OPEN_YN;
	String PROF_STFT;
	
	String SEARCH_TYPE = "";
	String SEARCH_TEXT = "";
	int LIMIT;
	int OFFSET;
	
    String SCHOOL_NAME;
    String SCHOOL_TYPE;
    String SCHOOL_YEAR;
    String SCHOOL_GROUP;
    String ADDRESS_LOCAL;
    String SEX;
    String SUPPORT_AREA;
    String PERIOD;
    String SUM_TM;
    
    String TYPE;
	
	public String getPROFESSOR_MEMBER_ID() {
		return PROFESSOR_MEMBER_ID;
	}
	public void setPROFESSOR_MEMBER_ID(String pROFESSOR_MEMBER_ID) {
		PROFESSOR_MEMBER_ID = pROFESSOR_MEMBER_ID;
	}
	public String getEVALUATION_TACHER() {
		return EVALUATION_TACHER;
	}
	public void setEVALUATION_TACHER(String eVALUATION_TACHER) {
		EVALUATION_TACHER = eVALUATION_TACHER;
	}
	public String getPROGRAM_IDX() {
		return PROGRAM_IDX;
	}
	public void setPROGRAM_IDX(String pROGRAM_IDX) {
		PROGRAM_IDX = pROGRAM_IDX;
	}
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
	public String getSTART_TM() {
		return START_TM;
	}
	public void setSTART_TM(String sTART_TM) {
		START_TM = sTART_TM;
	}
	public String getEND_TM() {
		return END_TM;
	}
	public void setEND_TM(String eND_TM) {
		END_TM = eND_TM;
	}
	public String getPLACE() {
		return PLACE;
	}
	public void setPLACE(String pLACE) {
		PLACE = pLACE;
	}
	public String getTEACHER() {
		return TEACHER;
	}
	public void setTEACHER(String tEACHER) {
		TEACHER = tEACHER;
	}
	public String getCONTENT() {
		return CONTENT;
	}
	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}
	public String getEVALUATION() {
		return EVALUATION;
	}
	public void setEVALUATION(String eVALUATION) {
		EVALUATION = eVALUATION;
	}
	public String getFILES() {
		return FILES;
	}
	public void setFILES(String fILES) {
		FILES = fILES;
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
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
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
	public String getADDRESS_LOCAL() {
		return ADDRESS_LOCAL;
	}
	public void setADDRESS_LOCAL(String aDDRESS_LOCAL) {
		ADDRESS_LOCAL = aDDRESS_LOCAL;
	}
	public String getSEX() {
		return SEX;
	}
	public void setSEX(String sEX) {
		SEX = sEX;
	}
	public String getSUPPORT_AREA() {
		return SUPPORT_AREA;
	}
	public void setSUPPORT_AREA(String sUPPORT_AREA) {
		SUPPORT_AREA = sUPPORT_AREA;
	}
	public String getPROF_NAME() {
		return PROF_NAME;
	}
	public void setPROF_NAME(String pROF_NAME) {
		PROF_NAME = pROF_NAME;
	}
	public String getEVAL_OPEN_YN() {
		return EVAL_OPEN_YN;
	}
	public void setEVAL_OPEN_YN(String eVAL_OPEN_YN) {
		EVAL_OPEN_YN = eVAL_OPEN_YN;
	}
	public String getPRGM_NM() {
		return PRGM_NM;
	}
	public void setPRGM_NM(String pRGM_NM) {
		PRGM_NM = pRGM_NM;
	}
	public String getCOURSE() {
		return COURSE;
	}
	public void setCOURSE(String cOURSE) {
		COURSE = cOURSE;
	}
	public String getCOURSE_PRGM() {
		return COURSE_PRGM;
	}
	public void setCOURSE_PRGM(String cOURSE_PRGM) {
		COURSE_PRGM = cOURSE_PRGM;
	}
	public String getSTFT() {
		return STFT;
	}
	public void setSTFT(String sTFT) {
		STFT = sTFT;
	}
	public String getPROF_STFT() {
		return PROF_STFT;
	}
	public void setPROF_STFT(String pROF_STFT) {
		PROF_STFT = pROF_STFT;
	}
	public String getPERIOD() {
		return PERIOD;
	}
	public void setPERIOD(String pERIOD) {
		PERIOD = pERIOD;
	}
	public String getSUM_TM() {
		return SUM_TM;
	}
	public void setSUM_TM(String sUM_TM) {
		SUM_TM = sUM_TM;
	}
	public String getTYPE() {
		return TYPE;
	}
	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}
	public String getRTICIPATION_TM() {
		return RTICIPATION_TM;
	}
	public void setRTICIPATION_TM(String rTICIPATION_TM) {
		RTICIPATION_TM = rTICIPATION_TM;
	}
	
	
	
	
}
