package egovframework.kaist.admin.question.model;

import egovframework.kaist.admin.SearchVo;

public class AdminQuestionVo extends SearchVo {

	String idx = "";
	String name = "";
	String type = "";
	String category = "";
	String content = "";
	String objectives = "";
	String select_type = "";
	String select_val = "";
	String solution = "";
	String right = "";
	String worng = "";
	String create_tm = "";
	String update_tm = "";
	String exam_idx = "";	//다른 exam_idx 필요할때
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getObjectives() {
		return objectives;
	}
	public void setObjectives(String objectives) {
		this.objectives = objectives;
	}
	public String getSelect_type() {
		return select_type;
	}
	public void setSelect_type(String select_type) {
		this.select_type = select_type;
	}
	public String getSelect_val() {
		return select_val;
	}
	public void setSelect_val(String select_val) {
		this.select_val = select_val;
	}
	public String getSolution() {
		return solution;
	}
	public void setSolution(String solution) {
		this.solution = solution;
	}
	public String getRight() {
		return right;
	}
	public void setRight(String right) {
		this.right = right;
	}
	public String getWorng() {
		return worng;
	}
	public void setWorng(String worng) {
		this.worng = worng;
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
	public String getExam_idx() {
		return exam_idx;
	}
	public void setExam_idx(String exam_idx) {
		this.exam_idx = exam_idx;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	
	
}
