package main.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import main.service.CrudService;
import main.service.CrudVO;

@Service("crudService")
public class CrudServiceImpl implements CrudService{
	
	@Resource(name="crudDAO")
	private CrudDAO crudDAO;
	
	@Override
	public String insertUser(CrudVO vo) throws Exception {
		
		return crudDAO.insertUser(vo);
	}

	@Override
	public String insertLogin(CrudVO vo) throws Exception {
		// TODO Auto-generated method stub
		return crudDAO.insertLogin(vo);
	}

	@Override
	public String insertAgreement(CrudVO vo) throws Exception {
		// TODO Auto-generated method stub
		return crudDAO.insertAgreement(vo);
	}

	@Override
	public int checkId(String id) throws Exception{
		// TODO Auto-generated method stub
		return crudDAO.checkId(id);
	}

	@Override
	public List<?> selectUserList(CrudVO vo) throws Exception {
		// TODO Auto-generated method stub
		return crudDAO.selectUserList(vo);
	}

	@Override
	public CrudVO selectUserdetail(String id) throws Exception {
		// TODO Auto-generated method stub
		return crudDAO.selectUserDetail(id);
	}

	@Override
	public int modifyUser(CrudVO vo) throws Exception {
		// TODO Auto-generated method stub
		return crudDAO.modifyUser(vo);
	}

	@Override
	public int userDelete(String id) throws Exception {
		// TODO Auto-generated method stub
		return crudDAO.userDelete(id);
	}

	@Override
	public int loginDelete(String id) throws Exception {
		// TODO Auto-generated method stub
		return crudDAO.loginDelete(id);
	}

	@Override
	public int agreeDelete(String id) throws Exception {
		// TODO Auto-generated method stub
		return crudDAO.agreeDelete(id);
	}

	@Override
	public List<?> sortUserListById() throws Exception {
		// TODO Auto-generated method stub
		return crudDAO.sortUserListById();
	}

	@Override
	public List<?> sortUserListByAgreedate() throws Exception {
		// TODO Auto-generated method stub
		return crudDAO.sortUserListByAgreedate();
	}

	@Override
	public int selectUserCount(CrudVO vo) throws Exception {
		// TODO Auto-generated method stub
		return crudDAO.selectUserCount(vo);
	}

//	// 01_01. 회원 로그인 체크
//	@Override
//	public boolean loginCheck(CrudVO vo, HttpSession session) {
//		// TODO Auto-generated method stub
//		boolean result = crudDAO.loginCheck(vo);
//		if(result) { //true
//			CrudVO vo2 = viewUser(vo);
//			//세션 변수 등록
//			session.setAttribute("userId", vo2.getId());
//			session.setAttribute("userName", vo2.getName());
//			session.setAttribute("userEmail", vo2.getEmail());
//			session.setAttribute("userPassword", vo2.getPassword());
//		}
//		return result;
//	}
//	//01_02. 회원 로그인 정보
//	@Override
//	public CrudVO viewUser(CrudVO vo) {
//		// TODO Auto-generated method stub
//		return crudDAO.viewUser(vo);
//	}
//
//	@Override
//	public void logout(HttpSession session) {
//		// TODO Auto-generated method stub
//		//세션 변수 개별 삭제
//		// session.removeAttribute("userId");
//		// 세션 정보를 초기화 시킴
//		session.invalidate();
//	}


}
