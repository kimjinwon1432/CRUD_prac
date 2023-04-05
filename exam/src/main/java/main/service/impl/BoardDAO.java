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
		return list("boardDAO.selectBoardList", vo);
	}

	public int selectBoardTotal(BoardVO vo) {
		// TODO Auto-generated method stub
		return (int) select("boardDAO.selectBoardTotal", vo);
	}
	
	

}
