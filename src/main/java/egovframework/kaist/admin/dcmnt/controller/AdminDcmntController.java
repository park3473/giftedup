package egovframework.kaist.admin.dcmnt.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.kaist.admin.dcmnt.model.DcmntVo;
import egovframework.kaist.admin.dcmnt.service.AdminDcmntService;
import egovframework.kaist.admin.member_re.model.AdminMemberReVo;

@Controller
public class AdminDcmntController {

	@Autowired
	AdminDcmntService adminDcmntService;
	

	//만들려다가 안쓰는 ...
}
