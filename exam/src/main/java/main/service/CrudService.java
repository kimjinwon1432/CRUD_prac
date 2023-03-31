package main.service;

import java.util.List;

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
}

