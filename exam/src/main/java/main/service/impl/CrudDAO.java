package main.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import main.service.CrudVO;

@Repository("crudDAO")
public class CrudDAO extends EgovAbstractDAO{

	public String insertUser(CrudVO vo) {
		// TODO Auto-generated method stub
		return (String) insert("crudDAO.insertUser", vo);
	}

	public String insertLogin(CrudVO vo) {
		// TODO Auto-generated method stub
		return (String) insert("crudDAO.insertLogin", vo);
	}

	public String insertAgreement(CrudVO vo) {
		// TODO Auto-generated method stub
		return (String) insert("crudDAO.insertAgreement", vo);
	}

	public int checkId(String id) {
		// TODO Auto-generated method stub
		return (Integer) select("crudDAO.checkId", id);
	}

	public List<?> selectUserList(CrudVO vo) {
		// TODO Auto-generated method stub
		
//		System.out.println("DAO.... vo: "+ vo);
		return list("crudDAO.selectUserList", vo);
	}

	public CrudVO selectUserDetail(String id) {
		// TODO Auto-generated method stub
		return (CrudVO) select("crudDAO.selectUserdetail", id);
	}

	public int modifyUser(CrudVO vo) {
		// TODO Auto-generated method stub
		return update("crudDAO.modifyUser", vo);
	}

	public int userDelete(String id) {
		// TODO Auto-generated method stub
		return delete("crudDAO.userDelete",id);
	}

	public int loginDelete(String id) {
		// TODO Auto-generated method stub
		return delete("crudDAO.loginDelete",id);
	}

	public int agreeDelete(String id) {
		// TODO Auto-generated method stub
		return delete("crudDAO.agreeDelete", id);
	}

	public List<?> sortUserList(String sort) {
		// TODO Auto-generated method stub
		if(sort.equals("id"))
				return list("crudDAO.sortUserListById",sort);
		else if (sort.equals("agreedate"))
				return list("crudDAO.sortUserListByAgreedate",sort);
		else  
				return list("crudDAO.selectUserList", sort);
	}
	public List<?> sortUserListById() {
		// TODO Auto-generated method stub
		return list("crudDAO.sortUserListById");
	}

	public List<?> sortUserListByAgreedate() {
		// TODO Auto-generated method stub
		return list("crudDAO.sortUserListByAgreedate");
	}

	
}
