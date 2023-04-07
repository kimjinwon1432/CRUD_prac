package main.service;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface CrudService {
	/* 저장처리 */
	public String insertUser(CrudVO vo) throws Exception;
	public String insertLogin(CrudVO vo) throws Exception;
	public String insertAgreement(CrudVO vo) throws Exception;
	public int checkId(String id) throws Exception;
	public List<?> selectUserList(CrudVO vo) throws Exception;
	public CrudVO selectUserdetail(String id) throws Exception;
	public int modifyUser(CrudVO vo) throws Exception;
	public int userDelete(String id) throws Exception;
	public int loginDelete(String id) throws Exception;
	public int agreeDelete(String id) throws Exception;
	public List<?> sortUserListById() throws Exception;
	public List<?> sortUserListByAgreedate() throws Exception;
	/*
	 * 로그인 
	 */
	public int selectUserCount(CrudVO vo) throws Exception;
	
//	//01_01. 회원 로그인 체크
//	public boolean loginCheck(CrudVO vo, HttpSession session);
//	//01_02. 회원 로그인 정보
//	public CrudVO viewUser(CrudVO vo);
//	//02. 회원 로그아웃
//	public void logout(HttpSession session);
}

