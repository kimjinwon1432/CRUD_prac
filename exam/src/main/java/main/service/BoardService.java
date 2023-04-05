package main.service;

import java.util.List;

public interface BoardService {
	/*
	 * 게시판 저장 처리 
	 */
	public String insertBoard(BoardVO vo) throws Exception;
	/*
	 * 게시판 목록
	 * */
	public List<?> selectBoardList(BoardVO vo) throws Exception;
	public int selectBoardTotal(BoardVO vo) throws Exception;
}
