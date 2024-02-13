package egovframework.kaist.admin.exam.controller;

import java.io.IOException;
import java.util.List;

import javax.enterprise.inject.Model;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.system.util.SUtil;

import egovframework.kaist.admin.exam.model.AdminExamRespondentsVo;
import egovframework.kaist.admin.exam.model.AdminExamResultVo;
import egovframework.kaist.admin.exam.model.AdminExamVo;
import egovframework.kaist.admin.exam.service.AdminExamService;
import egovframework.kaist.admin.question.model.AdminQuestionListVo;
import egovframework.kaist.admin.question.model.AdminQuestionVo;
import egovframework.kaist.admin.question.service.AdminQuestionService;

@Controller
public class AdminExamController {

	@Autowired
	AdminExamService adminExamService;
	
	@Autowired
	AdminQuestionService adminQuestionService;

	
	//EXAM
	@RequestMapping(value="/admin/exam/list.do" , method = RequestMethod.GET)
	public ModelAndView AdminExamListGet(@ModelAttribute("AdminExamVo")AdminExamVo AdminExamVo , HttpServletRequest request , HttpServletResponse response) {
		
		System.out.println("PAGE : " + AdminExamVo.getPAGE());
		System.out.println("ITEM_COUNT : " + AdminExamVo.getITEM_COUNT());
		
		String PAGE = request.getParameter("PAGE") != null ? request
				.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request
				.getParameter("ITEM_COUNT") : "10";
		
		AdminExamVo.setPAGE(Integer.parseInt(PAGE));
		AdminExamVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		int pagelimit = AdminExamVo.getPAGE() * AdminExamVo.getITEM_COUNT();
		
		AdminExamVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		AdminExamVo.setOFFSET(pagelimit);
		
		ModelMap model = new ModelMap();
		
		model = adminExamService.getAllList(AdminExamVo);
		
		model.put("before", AdminExamVo);
		
		return new ModelAndView("admin/exam/list" , "model" , model);
		
	}
	
	@RequestMapping(value="/admin/exam/insert.do" , method = RequestMethod.GET)
	public ModelAndView AdminExamInsertGet(@ModelAttribute("AdminExamVo")AdminExamVo AdminExamVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		//model = adminExamService.getExamCategoryAllList();
		
		return new ModelAndView("admin/exam/insert" , "model" , model);
		
	}
	
	@RequestMapping(value="/admin/exam/insert.do", method = RequestMethod.POST )
	public void AdminExamInsertPost(@ModelAttribute("AdminExamVo")AdminExamVo AdminExamVo , MultipartHttpServletRequest request , HttpServletResponse response) throws IOException {
		
		adminExamService.setAdminExamData(AdminExamVo , "insert");
		
		SUtil.AlertAndPageMove(response, "해당 설문이 등록되었습니다.", "/admin/exam/list.do");
	
	}
	
	@RequestMapping(value="/admin/exam/update.do" , method = RequestMethod.GET)
	public ModelAndView AdminExamUpdateGet(@ModelAttribute("AdminExamVo")AdminExamVo AdminExamVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = adminExamService.getExamView(AdminExamVo);
		
		return new ModelAndView("admin/exam/update" , "model" , model);
		
	}
	
	@RequestMapping(value="/admin/exam/update.do", method = RequestMethod.POST)
	public void AdminExamUpdatePost(@ModelAttribute("AdminExamVo")AdminExamVo AdminExamVo ,  MultipartHttpServletRequest  request , HttpServletResponse response) throws IOException {
		
		adminExamService.setAdminExamData(AdminExamVo , "update");
		
		SUtil.AlertAndPageMove(response, "해당 설문이 수정되었습니다.", "/admin/exam/list.do");
		
	}
	
	@RequestMapping(value="/admin/exam/updateApi.do", method = RequestMethod.POST)
	public void AdminExamUpdatePostApi(@ModelAttribute("AdminExamVo")AdminExamVo AdminExamVo ,  HttpServletRequest  request , HttpServletResponse response){
		
		adminExamService.setAdminExamData(AdminExamVo , "update");
		
	}
	
	@RequestMapping(value="/admin/exam/delete.do" , method = RequestMethod.POST)
	public void AdminExamDeletePost(@ModelAttribute("AdminExamVo")AdminExamVo AdminExamVo , HttpServletRequest request , HttpServletResponse response) throws IOException {
		
		//자가진단 폼 삭제 (해당 자가진단 참가한 인원 있을시 삭제 X)
		adminExamService.setAdminExamData(AdminExamVo, "delete");
		
		//해당 문항 및 답안 삭제
		SUtil.AlertAndPageMove(response, "해당 설문이 삭제 되었습니다.", "/admin/exam/list.do");
	}
	
	@RequestMapping(value="/admin/exam/status.do" , method = RequestMethod.GET)
	public ModelAndView AdminExamStatusData(@ModelAttribute("AdminExamVo")AdminExamVo AdminExamVo , HttpServletRequest request , HttpServletResponse response){
		
		ModelMap model = new ModelMap();
	
		model = adminExamService.getStatusData(AdminExamVo);
		
		model.put("before", AdminExamVo);
		
		return new ModelAndView( "admin/exam/status" , "model" , model);
		
	}
	
	
	//QUESTION_LIST 부분
	@RequestMapping(value="/admin/exam/question_list.do" , method = RequestMethod.GET)
	public ModelAndView AdminExamQuestionList(@ModelAttribute("AdminQuestionListVo")AdminQuestionListVo AdminQuestionListVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = adminExamService.getQuestionList(AdminQuestionListVo);
		
		model.put("exam_idx", AdminQuestionListVo.getExam_idx());
		
		String category = request.getParameter("category") != null ? request.getParameter("category") : "0";
		
		model.put("category", category);
		
		AdminQuestionVo question = new AdminQuestionVo();
		
		List<?> list = adminQuestionService.getQuestionAllList(question);
		
		List<?> TypeList = adminQuestionService.getTypeAllList();
		
		model.put("question_list",list);
		model.put("TypeList", TypeList);
		
		return new ModelAndView("admin/exam/question_list" , "model" , model);
		
	}
	
	@RequestMapping(value="/admin/exam/question_list/insert.do" , method = RequestMethod.POST)
	public void AdminExamQuestionListInsert(@ModelAttribute("AdminQuestionListVo")AdminQuestionListVo AdminQuestionListVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminExamService.setAdminExamQuestionList(AdminQuestionListVo , "insert");
		
	}
	
	@RequestMapping(value="/admin/exam/question_list/update.do" , method = RequestMethod.POST)
	public void AdminExamQuestionListUpdate(@ModelAttribute("AdminQuestionListVo")AdminQuestionListVo AdminQuestionListVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminExamService.setAdminExamQuestionList(AdminQuestionListVo , "update");
		
	}
	
	@RequestMapping(value="/admin/exam/question_list/delete.do" , method = RequestMethod.POST)
	public void AdminExamQuestionListDelete(@ModelAttribute("AdminQuestionListVo")AdminQuestionListVo AdminQuestionListVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminExamService.setAdminExamQuestionList(AdminQuestionListVo , "delete");
		
	}
	
	@RequestMapping(value="/admin/question_list/sort.do" , method = RequestMethod.POST)
	public void AdminQuestionSortList(@ModelAttribute("AdminQuestionListVo")AdminQuestionListVo AdminQuestionListVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminExamService.setAdminExamQuestionSort(AdminQuestionListVo);
		
	}
	
	@RequestMapping(value="/admin/exam/respondents/list.do" , method = RequestMethod.GET)
	public ModelAndView AdminExamRespondents(@ModelAttribute("AdminExamRespondentsVo")AdminExamRespondentsVo AdminExamRespondentsVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		model = adminExamService.getExamRespondentsList(AdminExamRespondentsVo);
		
		model.put("before", AdminExamRespondentsVo);
		
		return new ModelAndView("admin/exam/respondents", "model" , model);
		
	}
	
	@RequestMapping(value="/admin/exam/respondents/insert.do" , method = RequestMethod.POST)
	public void AdminExamRespondentsInsert(@ModelAttribute("AdminExamRespondentsVo")AdminExamRespondentsVo AdminExamRespondentsVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminExamService.setExamRespondents(AdminExamRespondentsVo , "insert");
		
	}
	
	@RequestMapping(value="/admin/exam/respondents/Ajaxlist.do" , method = RequestMethod.POST)
	public ModelAndView AdminExamRespondentsAJAX(@ModelAttribute("AdminExamRespondentsVo")AdminExamRespondentsVo AdminExamRespondentsVo , HttpServletRequest request , HttpServletResponse response) {
		
		ModelMap model = new ModelMap();
		
		System.out.println("callType : " + AdminExamRespondentsVo.getCalltype());
		
		model = adminExamService.getExamRespondentsAjaxList(AdminExamRespondentsVo , AdminExamRespondentsVo.getCalltype());
		
		return new ModelAndView("admin/exam/ResponAjax", "model" , model);
		
	}
	
	@RequestMapping(value="/admin/exam/respondents/delete.do" , method = RequestMethod.POST)
	public void AdminExamRespondentsDelete(@ModelAttribute("AdminExamRespondentsVo")AdminExamRespondentsVo AdminExamRespondentsVo , HttpServletRequest request , HttpServletResponse response) {
		
		adminExamService.setExamRespondents(AdminExamRespondentsVo , "delete");
		
	}
	
	@RequestMapping(value="/admin/exam/respondents/listCnt.do" , method = RequestMethod.POST,produces = "application/json; charset=utf8")
	@ResponseBody
	public String AdminExamRespondentsCnt(@ModelAttribute("AdminExamRespondentsVo")AdminExamRespondentsVo AdminExamRespondentsVo , HttpServletRequest request , HttpServletResponse response)throws JsonProcessingException {
		
		int result = adminExamService.getExamRespondentsAjaxListCnt(AdminExamRespondentsVo);
		
		System.out.println(result);
		
		String resultData = Integer.toString(result);
		
		return resultData;
		
	}
	
	@RequestMapping(value="/admin/exam/result/list.do" , method = RequestMethod.GET)
	public ModelAndView AdminExamResultGet(@ModelAttribute("AdminExamResultVo")AdminExamResultVo AdminExamResultVo , HttpServletRequest request , HttpServletResponse response) {
		
		System.out.println("PAGE : " + AdminExamResultVo.getPAGE());
		System.out.println("ITEM_COUNT : " + AdminExamResultVo.getITEM_COUNT());
		
		String PAGE = request.getParameter("PAGE") != null ? request
				.getParameter("PAGE") : "0";
		String ITEM_COUNT = request.getParameter("ITEM_COUNT") != null ? request
				.getParameter("ITEM_COUNT") : "10";
		
		AdminExamResultVo.setPAGE(Integer.parseInt(PAGE));
		AdminExamResultVo.setITEM_COUNT(Integer.parseInt(ITEM_COUNT));
		
		int pagelimit = AdminExamResultVo.getPAGE() * AdminExamResultVo.getITEM_COUNT();
		
		AdminExamResultVo.setLIMIT(Integer.parseInt(ITEM_COUNT));
		AdminExamResultVo.setOFFSET(pagelimit);
		
		ModelMap model = new ModelMap();
		
		model = adminExamService.getAllResultList(AdminExamResultVo);
		
		model.put("before", model);
		
		return new ModelAndView("admin/submission/list" , "model" , model);
		
		
	}
	
	
}
