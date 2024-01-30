package egovframework.kaist.admin.deshboard.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminDoshBoardController {


	private static final Logger Logger = LoggerFactory.getLogger(AdminDoshBoardController.class);
	

	@RequestMapping(value = {"/admin/deshboard/index.do"}, method = RequestMethod.GET)
	public String login(HttpServletRequest request, HttpServletResponse response) {

		return "redirect:/admin/member/list.do";
	}
	
	
	
	
}
