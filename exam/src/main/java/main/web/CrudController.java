package main.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.ModelAndView;

import main.service.CrudService;
import main.service.CrudVO;

@Controller
public class CrudController {
	//로깅을 위한 변수
//	private static final Logger logger = LoggerFactory.getLogger(CrudController.class);

	@Resource(name = "crudService")
	private CrudService crudService;

	@RequestMapping(value = "/mainPage.do")
	public String mainpage() {

		return "/CRUD/main";
	}

	@RequestMapping(value = "/login.do")
	public String login() {

		return "/CRUD/login";
	}
	@RequestMapping(value= "/loginCheck.do")
	@ResponseBody
	public String loginProcessing(CrudVO vo, HttpSession session) throws Exception{
		String msg ="";
		
		int count = crudService.selectUserCount(vo);
		if(count==1) {
			//create session
			session.setAttribute("loginUserId", vo.getId());
			System.out.println("login complete");
			//processing session
			msg = "success";
			
		}
		
		return msg;
	}
	
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) {
		//session end for logout
		session.removeAttribute("loginUserId");
		System.out.println("logout Complete");
		//check session
		
//		//all session data delete
//		session.invalidate();
		//세션삭제 확인..!
		
//		//세션의 값들 모두 삭제
//		session.invalidate();
//		//세션 유효 확인
//	    if (request.isRequestedSessionIdValid() == true) {
//	        
//	        System.out.print("세션 아이디가 유효합니다.<hr/>");
//	    }
//	   
//	    else {
//	       
//	        out.print("세션 아이디가 유효하지 않습니다.<hr/>");
//	    }
		
		return "/CRUD/login";
	}
	/*
	 * 회원등록화면
	 */

	@RequestMapping(value = "/join.do")
	public String join() {
		return "/CRUD/join";
	}

	@RequestMapping(value = "/joinSave.do")
	@ResponseBody
	public String joinSave(CrudVO vo) throws Exception {

		vo.setPhone(vo.getPhone1() + vo.getPhone2() + vo.getPhone3());

		String message = "";
		String result01 = crudService.insertUser(vo);
		String result02 = crudService.insertLogin(vo);
		String result03 = crudService.insertAgreement(vo);

		System.out.println(vo.getId() + " " + vo.getName());
		if (result01 == null && result02 == null && result03 == null) {
			message = "ok";
		}
		return message;
	}

	@RequestMapping(value = "/checkId.do")
	@ResponseBody
	public String checkId(String id) throws Exception {
		int result = crudService.checkId(id);
		if (result > 0)
			return "duplicated";
		else
			return "available";
	}
	// @RequestMapping(value="/joinSubmit.do")
	// public String insertUser(CrudVO vo) throws Exception{
	//
	// System.out.println(vo);
	//
	// String result = crudService.InsertUser(vo);
	//
	// return "";
	// }

	@RequestMapping(value = "/agreement.do")
	public String agree() {

		return "/CRUD/agreement";
	}

	@RequestMapping(value = "/userList.do")
	public String userList(CrudVO vo, ModelMap model) throws Exception {
		System.out.println("select: " + vo.getSort() + "  " + vo.getSort());

		// List<?> list;
		// //sort 점검
		// if("id".equals(vo.getSort())){
		// list = crudService.sortUserListById();
		// } else if("agreedate".equals(vo.getSort())) {
		// list = crudService.sortUserListByAgreedate();
		// }
		// else {
		// list = crudService.selectUserList(vo);
		// }

		List<?> list = crudService.selectUserList(vo);
//		System.out.println("list:    " + list);
		model.addAttribute("resultList", list);
		model.addAttribute("sort", vo.getSort());

		// 사용자 목록 불러오기

		System.out.println("sort: " + vo.getSort());
		return "/CRUD/userList";
	}

	/*
	 * 내 정보 페이지
	 */

	@RequestMapping(value = "/myDetail.do")
	public String myDetail(HttpSession session, ModelMap model) throws Exception {
		CrudVO vo = crudService.selectUserdetail((String) session.getAttribute("loginUserId"));
//		System.out.println("phone: " + vo.getPhone() + " " + vo.getPhone1());
		
		//전화번호 출력위한 작업
		vo.setPhone1((String) vo.getPhone().subSequence(0, 3));
		vo.setPhone2((String) vo.getPhone().subSequence(3, 7));
		vo.setPhone3((String) vo.getPhone().subSequence(7, 11));

		model.addAttribute("crudVO", vo);
		return "/CRUD/myDetail";
	}
	
	/*
	 * 내정보 수정 시
	 */
	
	
	/*
	 * 사용자 목록
	 */
	@RequestMapping(value = "/userDetail.do")
	public String userDetail(String id, ModelMap model) throws Exception {
		CrudVO vo = crudService.selectUserdetail(id);
//		System.out.println("phone: " + vo.getPhone() + " " + vo.getPhone1());

		vo.setPhone1((String) vo.getPhone().subSequence(0, 3));
		vo.setPhone2((String) vo.getPhone().subSequence(3, 7));
		vo.setPhone3((String) vo.getPhone().subSequence(7, 11));

		model.addAttribute("crudVO", vo);
		return "/CRUD/userDetail";
	}

	/*
	 * 사용자 정보 수정 시 거치는 프로세스 .... after: userDetail.do & myDetail.do
	 */
	
	@RequestMapping(value = "/userModifySave.do")
	@ResponseBody
	public String userModifySave(CrudVO vo, ModelMap model) throws Exception {

//		System.out.println("vo: " + vo.getId() + " " + vo.getName() + " " + vo.getPhone() + " " + vo.getPostNum());
		vo.setPhone(vo.getPhone1() + vo.getPhone2() + vo.getPhone3());

		int result = crudService.modifyUser(vo);
		String msg = (result > 0) ? "success" : "fail";

		model.addAttribute("id", vo.getId());
		return msg;
	}

	@RequestMapping(value = "/userDelete.do")
	@ResponseBody
	public String userDelete(String id, ModelMap model) throws Exception {

		crudService.agreeDelete(id);
		crudService.loginDelete(id);
		int result = crudService.userDelete(id);
		String msg = (result > 0) ? "success" : "fail";

		return msg;
	}
	
	@RequestMapping(value="/findID.do")
	public String findID() {
		return "/CRUD/findID";
	}
	

	@RequestMapping(value="/findIDSub.do")
	public String findIDSub() throws Exception{
		return "/CRUD/login";
	}


	@RequestMapping(value="/findPW.do")
	public String findPW() {
		return "/CRUD/findPW";
	}

	@RequestMapping(value="/findPWSub.do")
	public String findPWSub() throws Exception{
		return "/CRUD/login";
	}


}
