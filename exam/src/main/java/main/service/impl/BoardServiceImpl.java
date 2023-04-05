package main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.service.BoardService;
import main.service.BoardVO;


@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Resource(name="boardDAO")
	public BoardDAO boardDAO;
	
	@Override
	public String insertBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.insertBoard(vo);
	}

	@Override
	public List<?> selectBoardList(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardList(vo);
	}

	@Override
	public int selectBoardTotal(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.selectBoardTotal(vo);
	}

}
