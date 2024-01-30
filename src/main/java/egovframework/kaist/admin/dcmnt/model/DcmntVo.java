package egovframework.kaist.admin.dcmnt.model;

public class DcmntVo {
	
	int DCMNT_IDX;
	int MEMBER_IDX;
	String DCMNT_TYPE = "";
	String DCMNT_NAME = "";
	String DCMNT_CHECK = "";
	
	String IDX="";
	

	public int getDCMNT_IDX() {
		return DCMNT_IDX;
	}

	public void setDCMNT_IDX(int dCMNT_IDX) {
		DCMNT_IDX = dCMNT_IDX;
	}

	public String getIDX() {
		return IDX;
	}

	public void setIDX(String iDX) {
		IDX = iDX;
	}

	public int getMEMBER_IDX() {
		return MEMBER_IDX;
	}

	public void setMEMBER_IDX(int mEMBER_IDX) {
		MEMBER_IDX = mEMBER_IDX;
	}

	public String getDCMNT_TYPE() {
		return DCMNT_TYPE;
	}

	public void setDCMNT_TYPE(String dCMNT_TYPE) {
		DCMNT_TYPE = dCMNT_TYPE;
	}

	public String getDCMNT_NAME() {
		return DCMNT_NAME;
	}

	public void setDCMNT_NAME(String dCMNT_NAME) {
		DCMNT_NAME = dCMNT_NAME;
	}

	public String getDCMNT_CHECK() {
		return DCMNT_CHECK;
	}

	public void setDCMNT_CHECK(String dCMNT_CHECK) {
		DCMNT_CHECK = dCMNT_CHECK;
	}

	public void addAttribute(String string, DcmntVo view) {
		// TODO Auto-generated method stub
		
	}

}
