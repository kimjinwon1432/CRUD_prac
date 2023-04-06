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
	/*
	 *보드 총 개수
	 **/
	public int selectBoardTotal(BoardVO vo) throws Exception;
	public BoardVO selectBoardDetail(int boardNum) throws Exception;
	public int updateHits(int boardnum) throws Exception;
	public int updateBoard(BoardVO vo) throws Exception;
	public int boardDelete(int boardnum) throws Exception;
	
}
