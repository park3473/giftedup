package egovframework.kaist.admin;

public class SearchVo  {

	

	int PAGE;
	int OFFSET;
	int ITEM_COUNT = 10;
	
	int ITEM_TOTAL_COUNT;
	int ITEM_PAGE;
	int ITEM_PAGE_START;
	int ITEM_PAGE_END;
	int ITEM_TOTAL_PAGE;
	
	String LEVEL= "";
	String TYPE= "";
	
	String YEAR = "";
	
	String ENROLLMENT_STATUS = "";
	String SUPPORT_GROUP= "";
	
	String LOCATION = "";
	String NAME = "";
	String MEMBER_ID = "";
	String SCHOOL_NAME = "";
	String PHONE = "";
	String SCHOOL_YEAR = "";
	String SEARCH_TEXT = "";
	String SEARCH_TYPE = "";
	
	String START_TM = "";
	String END_TM = "";
	
	String RESULT="";
	String ADDRESS_LOCAL="";
	String SCHOOL_TYPE="";
	
	String SEX="";
	String SUPPORT_AREA="";
	String ELIGIBILITY="";
	
	
	int MEMBER_IDX;
	
	
	public int getMEMBER_IDX() {
		return MEMBER_IDX;
	}

	public void setMEMBER_IDX(int mEMBER_IDX) {
		MEMBER_IDX = mEMBER_IDX;
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

	public String getELIGIBILITY() {
		return ELIGIBILITY;
	}

	public void setELIGIBILITY(String eLIGIBILITY) {
		ELIGIBILITY = eLIGIBILITY;
	}

	public String getRESULT() {
		return RESULT;
	}

	public void setRESULT(String rESULT) {
		RESULT = rESULT;
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

	boolean itempagenext = true;
	
	
	public String getSCHOOL_YEAR() {
		return SCHOOL_YEAR;
	}

	public void setSCHOOL_YEAR(String sCHOOL_YEAR) {
		SCHOOL_YEAR = sCHOOL_YEAR;
	}

	public String getLOCATION() {
		return LOCATION;
	}

	public void setLOCATION(String lOCATION) {
		LOCATION = lOCATION;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public String getMEMBER_ID() {
		return MEMBER_ID;
	}

	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}

	public String getSCHOOL_NAME() {
		return SCHOOL_NAME;
	}

	public void setSCHOOL_NAME(String sCHOOL_NAME) {
		SCHOOL_NAME = sCHOOL_NAME;
	}

	public String getPHONE() {
		return PHONE;
	}

	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}

	public String getYEAR() {
		return YEAR;
	}

	public void setYEAR(String yEAR) {
		YEAR = yEAR;
	}

	public String getENROLLMENT_STATUS() {
		return ENROLLMENT_STATUS;
	}

	public void setENROLLMENT_STATUS(String eNROLLMENT_STATUS) {
		ENROLLMENT_STATUS = eNROLLMENT_STATUS;
	}

	public String getSUPPORT_GROUP() {
		return SUPPORT_GROUP;
	}

	public void setSUPPORT_GROUP(String sUPPORT_GROUP) {
		SUPPORT_GROUP = sUPPORT_GROUP;
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

	public String getLEVEL() {
		return LEVEL;
	}

	public void setLEVEL(String lEVEL) {
		LEVEL = lEVEL;
	}

	public String getTYPE() {
		return TYPE;
	}

	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}


	public String getSEARCH_TYPE() {
		return SEARCH_TYPE;
	}

	public void setSEARCH_TYPE(String sEARCH_TYPE) {
		SEARCH_TYPE = sEARCH_TYPE;
	}

	public int getPAGE() {
		return PAGE;
	}

	public void setPAGE(int pAGE) {
		OFFSET = OFFSET * (pAGE * ITEM_COUNT);
		PAGE = pAGE;
	}


	public String getSEARCH_TEXT() {
		return SEARCH_TEXT;
	}

	public void setSEARCH_TEXT(String sEARCH_TEXT) {
		SEARCH_TEXT = sEARCH_TEXT;
	}

	public int getOFFSET() {
		return OFFSET;
	}

	public void setOFFSET(int oFFSET) {
		OFFSET = oFFSET;
	}

	public int getITEM_COUNT() {
		return ITEM_COUNT;
	}

	public void setITEM_COUNT(int iTEM_COUNT) {
		ITEM_COUNT = iTEM_COUNT;
		OFFSET = OFFSET * (PAGE * ITEM_COUNT);
	}

	public int getITEM_TOTAL_COUNT() {
		return ITEM_TOTAL_COUNT;
	}

	public void setITEM_TOTAL_COUNT(int iTEM_TOTAL_COUNT) {
		ITEM_TOTAL_COUNT = iTEM_TOTAL_COUNT;
		
		ITEM_PAGE_END = ITEM_TOTAL_COUNT / ITEM_COUNT;
		
		if(ITEM_TOTAL_COUNT % ITEM_COUNT == 0)
		{
			ITEM_PAGE_END--;
		}
		if(PAGE < 0)
		{
			PAGE = 0;
		}
		
		
		ITEM_TOTAL_PAGE = ITEM_TOTAL_COUNT / ITEM_COUNT;
		
		if(ITEM_TOTAL_COUNT % ITEM_COUNT != 0 || ITEM_COUNT == 0)
		{
			ITEM_TOTAL_PAGE++;
		}
		
		
		ITEM_PAGE = PAGE;
		if(ITEM_PAGE_END < ITEM_PAGE)
		{
			ITEM_PAGE = ITEM_PAGE_END;
		}
		
		ITEM_PAGE_START = (ITEM_PAGE / ITEM_COUNT) * ITEM_COUNT;
		
		int send = ITEM_PAGE_START + 9;
		
		if(send < ITEM_PAGE_END)
		{
			ITEM_PAGE_END = send;
		}else
		{
			itempagenext = false;
		}
	}

	public int getITEM_PAGE() {
		return ITEM_PAGE;
	}

	public void setITEM_PAGE(int iTEM_PAGE) {
		ITEM_PAGE = iTEM_PAGE;
	}

	public int getITEM_PAGE_START() {
		return ITEM_PAGE_START;
	}

	public void setITEM_PAGE_START(int iTEM_PAGE_START) {
		ITEM_PAGE_START = iTEM_PAGE_START;
	}

	public int getITEM_PAGE_END() {
		return ITEM_PAGE_END;
	}

	public void setITEM_PAGE_END(int iTEM_PAGE_END) {
		ITEM_PAGE_END = iTEM_PAGE_END;
	}

	public int getITEM_TOTAL_PAGE() {
		return ITEM_TOTAL_PAGE;
	}

	public void setITEM_TOTAL_PAGE(int iTEM_TOTAL_PAGE) {
		ITEM_TOTAL_PAGE = iTEM_TOTAL_PAGE;
	}

	public boolean isItempagenext() {
		return itempagenext;
	}

	public void setItempagenext(boolean itempagenext) {
		this.itempagenext = itempagenext;
	}

	
	
	
}
