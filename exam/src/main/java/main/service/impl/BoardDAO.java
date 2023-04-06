package main.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import main.service.BoardVO;

@Repository("boardDAO")
public class BoardDAO extends EgovAbstractDAO {

	

	public String insertBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return (String) insert("boardDAO.insertBoard", vo);
	}

	public List<?> selectBoardList(BoardVO vo) {
		// TODO Auto-generated method stub
		System.out.println("boardlist..DAO hi");
		return list("boardDAO.selectBoardList", vo);
	}

	public int selectBoardTotal(BoardVO vo) {
		// TODO Auto-generated method stub
		System.out.println(select("boardDAO.selectBoardTotal", vo.toString()));
		return (int) select("boardDAO.selectBoardTotal", vo);
	}

	public BoardVO selectBoardDetail(int boardNum) {
		// TODO Auto-generated method stub
		return (BoardVO) select("boardDAO.selectBoardDetail", boardNum);
	}

	public int updateBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return update("boardDAO.updateBoard", vo);
	}

	public int updateHits(int hits) {
		// TODO Auto-generated method stub
		return update("boardDAO.updateHits", hits);
	}

	public int boardDelete(int boardnum) {
		// TODO Auto-generated method stub
		return delete("boardDAO.boardDelete", boardnum);
	}
	
	

}
