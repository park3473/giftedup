package egovframework.kaist.user.submission.model;

public class UserSubMissionFileVo {
	
	String idx = "";
	String submission_idx = "";
	String member_id = "";
	String file = "";
	String create_tm = "";
	String update_tm = "";
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getSubmission_idx() {
		return submission_idx;
	}
	public void setSubmission_idx(String submission_idx) {
		this.submission_idx = submission_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getCreate_tm() {
		return create_tm;
	}
	public void setCreate_tm(String create_tm) {
		this.create_tm = create_tm;
	}
	public String getUpdate_tm() {
		return update_tm;
	}
	public void setUpdate_tm(String update_tm) {
		this.update_tm = update_tm;
	}

}
