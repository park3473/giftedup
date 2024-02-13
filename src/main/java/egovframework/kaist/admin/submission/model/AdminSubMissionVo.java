package egovframework.kaist.admin.submission.model;

import egovframework.kaist.admin.SearchVo;

public class AdminSubMissionVo extends SearchVo{

	String idx = "";
	String award_idx = "";
	String member_id = "";
	String name = "";
	String content = "";
	String status = "";
	String create_tm = "";
	String update_tm = "";
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getAward_idx() {
		return award_idx;
	}
	public void setAward_idx(String award_idx) {
		this.award_idx = award_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
