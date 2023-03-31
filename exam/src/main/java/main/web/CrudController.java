package main.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.CrudService;
import main.service.CrudVO;

@Controller
public class CrudController {

	@Resource(name="crudService")
	private CrudService crudService;

	@RequestMapping(value = "/mainPage.do")
	public String mainpage() {
		
		return "/CRUD/main";
	}
	
	@RequestMapping(value = "/login.do")
	public String login() {
		
		return "/CRUD/login";
	}

	/*
	 * 회원등록화면
  	 */
	
	@RequestMapping(value="/join.do")
	public String join() {
		return "/CRUD/join";
	}
	
	@RequestMapping(value="/joinSave.do")
	@ResponseBody
	public String joinSave(CrudVO vo) throws Exception {
		
		System.out.println("vo: "+ vo.getPhone());
		vo.setPhone(vo.getPhone().replace("-", ""));
		System.out.println("vo: "+ vo.getPhone());

		String message ="";
		String result = crudService.insertUser(vo);
		crudService.insertLogin(vo);
		crudService.insertAgreement(vo);
		
		if(result == null) {
			message ="ok";
		}
		
		return message;
	}
	
	@RequestMapping(value="/checkId.do")
	@ResponseBody
	public String checkId(String id) throws Exception{
		System.out.println(id);
		int result = crudService.checkId(id);
		System.out.println(result);
		if(result>0) return "duplicated";
		else 		 return "available";
	}
//	@RequestMapping(value="/joinSubmit.do")
//	public String insertUser(CrudVO vo) throws Exception{
//		
//		System.out.println(vo);
//		
//		String result = crudService.InsertUser(vo);
//		
//		return "";
//	}
	
	@RequestMapping(value="/agreement.do")
	public String agree() {
		
		return "/CRUD/agreement";
	}
	
	@RequestMapping(value="/userList.do")
	public String userList(CrudVO vo, ModelMap model) throws Exception{
		
		int unit=10;
		
		//사용자 목록 불러오기
		List<?> list = crudService.selectUserList(vo);
		System.out.println("list : "+list);
		model.addAttribute("resultList", list);
		
		return "/CRUD/userList";
	}
	@RequestMapping(value="/userDetail.do")
	public String userDetail(String id, ModelMap model) throws Exception{
		
		CrudVO vo = crudService.selectUserdetail(id);
		model.addAttribute("crudVO", vo);
		return "/CRUD/userDetail";
	}
	@RequestMapping(value="/userModifySave.do")
	public int userModifySave(CrudVO vo, ModelMap model) throws Exception{
		System.out.println("vo: "+vo.getId()+" "+vo.getName()+" "+vo.getPhone()+" "+vo.getPostNum());
		int result = crudService.modifyUser(vo);
		int msg=(result>0)?1:0;
		
		model.addAttribute("id", vo.getId());
		return msg;
	}
	@RequestMapping(value="/userDelete.do")
	public String userDelete(String id, ModelMap model) throws Exception{
		
		crudService.agreeDelete(id);
		crudService.loginDelete(id);
		int result = crudService.userDelete(id);
		String msg=(result>0)?"success":"faile";
				
		return msg;	

	}
}
